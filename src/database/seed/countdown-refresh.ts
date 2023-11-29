import * as mysql from 'mysql2/promise';
import endDates from './data/product-end-dates';
import { dbConfig } from '../config';


async function refreshDates() {
    const dates = await endDates();

    const connection = await mysql.createConnection(dbConfig);

    try {
        await connection.beginTransaction();

        for (let i = 0; i < 50; i++) {
            await connection.execute(
                'UPDATE products SET endDate = ? WHERE id = ?',
                [dates[i].endDate, i + 1]
            );
        }

        await connection.commit();

        console.log('Dates refreshed successfully.');
    } catch (error) {
        console.error('Error seeding database:', error);
    } finally {
        await connection.end();
    }
}

refreshDates();
