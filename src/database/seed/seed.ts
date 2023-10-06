import * as mysql from 'mysql2/promise';
import users from './data/user';
import userProfiles from './data/user_profile';
import userRoleMapping from './data/user_role_mapping';
import productCategories from './data/product_categories';
import products from './data/products';



const dbConfig = {
    host: 'localhost',
    user: 'root',
    password: '',
    database: '2dekans-veilingen-testing',
};


async function seedDatabase() {
    const productCategoriesData = await productCategories();
    const productData = await products();
    const userData = await users();
    const userProfilesData = await userProfiles();
    const userRoleMapppingData = await userRoleMapping();

    const connection = await mysql.createConnection(dbConfig);

    try {
        await connection.beginTransaction();

        await connection.execute('SET FOREIGN_KEY_CHECKS=0');
        await connection.execute('TRUNCATE TABLE user_profile');
        await connection.execute('TRUNCATE TABLE user_roles');
        await connection.execute('TRUNCATE TABLE user_role_mapping');
        await connection.execute('TRUNCATE TABLE products');
        await connection.execute('TRUNCATE TABLE product_categories');
        await connection.execute('TRUNCATE TABLE users');
        await connection.execute('SET FOREIGN_KEY_CHECKS=1');

        await connection.execute(
            'INSERT INTO user_roles (name) VALUES (?), (?), (?)',
            ['guest', 'member', 'admin'],
        );

        userData.forEach(async (user) => {
            await connection.execute(
              'INSERT INTO users (username, email, password, firstname, lastname) VALUES (?, ?, ?, ?, ?)',
              Object.values(user),
            );
        });

        userProfilesData.forEach(async (userProfile) => {
            await connection.execute(
              'INSERT INTO user_profile (userid, profilePictureUrl, about, theme) VALUES (?, ?, ?, ?)',
              Object.values(userProfile),
            );
        });

        userRoleMapppingData.forEach(async (userRoleMapping) => {
            await connection.execute(
              'INSERT INTO user_role_mapping (userid, roleid) VALUES (?, ?)',
              Object.values(userRoleMapping),
            );
        });

        productCategoriesData.forEach(async (productCategory) => {
            await connection.execute(
              'INSERT INTO product_categories (name) VALUES (?)',
              Object.values(productCategory),
            );
        });

        productData.forEach(async (product) => {
            await connection.execute(
              'INSERT INTO products (userid, categoryid, name, description, price, imageUrl) VALUES (?, ?, ?, ?, ?, ?)',
              Object.values(product),
            );
        });

        await connection.commit();

        console.log('Database seeded successfully.');
    } catch (error) {
        console.error('Error seeding database:', error);
    } finally {
        await connection.end();
    }
}

seedDatabase();
