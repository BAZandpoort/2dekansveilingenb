import * as mysql from 'mysql2/promise';
import users from './data/user';
import userProfiles from './data/user-profile';
import userRoleMapping from './data/user-role-mapping';
import productCategories from './data/product-categories';
import products from './data/products';
import orders from './data/orders';

const dbConfig = {
    host: 'localhost',
    user: 'root',
    password: '',
    database: '2dekansveilingen',
};


async function seedDatabase() {
    const productCategoriesData = await productCategories();
    const productData = await products();
    const userData = await users();
    const userProfilesData = await userProfiles();
    const userRoleMapppingData = await userRoleMapping();
    const orderData = await orders();

    const connection = await mysql.createConnection(dbConfig);

    try {
        await connection.beginTransaction();

        await connection.execute('SET FOREIGN_KEY_CHECKS=0');
        await connection.execute('TRUNCATE TABLE user_profile');
        await connection.execute('TRUNCATE TABLE user_roles');
        await connection.execute('TRUNCATE TABLE user_role_mapping');
        await connection.execute('TRUNCATE TABLE orders');
        await connection.execute('TRUNCATE TABLE products');
        await connection.execute('TRUNCATE TABLE product_categories');
        await connection.execute('TRUNCATE TABLE users');
        await connection.execute('SET FOREIGN_KEY_CHECKS=1');
        console.log('Truncated all tables.');

        await connection.execute(
            'INSERT INTO user_roles (name) VALUES (?), (?), (?)',
            ['guest', 'member', 'admin'],
        );
        console.log('Inserted user roles.');

        userData.forEach(async (user) => {
            await connection.execute(
              'INSERT INTO users (username, email, password, firstname, lastname) VALUES (?, ?, ?, ?, ?)',
              Object.values(user),
            );
        });
        console.log('Inserted users.');

        userProfilesData.forEach(async (userProfile) => {
            await connection.execute(
              'INSERT INTO user_profile (userid, profilepicture, about, theme, language) VALUES (?, ?, ?, ?, ?)',
              Object.values(userProfile),
            );
        });
        console.log('Inserted user profiles.');

        userRoleMapppingData.forEach(async (userRoleMapping) => {
            await connection.execute(
              'INSERT INTO user_role_mapping (userid, roleid) VALUES (?, ?)',
              Object.values(userRoleMapping),
            );
        });
        console.log('Inserted user role mappings.');

        productCategoriesData.forEach(async (productCategory) => {
            await connection.execute(
              'INSERT INTO product_categories (name, icon) VALUES (?, ?)',
              Object.values(productCategory),
            );
        });
        console.log('Inserted product categories.');

        productData.forEach(async (product) => {
            await connection.execute(
              'INSERT INTO products (userid, categoryid, name, description, price, image, endDate) VALUES (?, ?, ?, ?, ?, ?, ?)',
              Object.values(product),
            );
        });
        console.log('Inserted products.');

        orderData.forEach(async (order) => {
            await connection.execute(
              'INSERT INTO orders (productid, buyerid, deliverymethod) VALUES (?, ?, ?)',
              Object.values(order),
            );
        });
        console.log('Inserted orders.');

        await connection.commit();

        console.log('Database seeded successfully.');
    } catch (error) {
        console.error('Error seeding database:', error);
    } finally {
        await connection.end();
    }
}

seedDatabase();
