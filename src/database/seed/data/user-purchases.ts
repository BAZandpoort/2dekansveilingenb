import { faker } from '@faker-js/faker';

interface UserPurchase {
  userid: number;
  timeOfPurchase: string;
  productId: number;
  price: number;
  productName: string;
  productImage: string;
}

export default async function userPurchases(): Promise<UserPurchase[]> {
  const result: UserPurchase[] = [];
  for (let i = 0; i < 100; i++) {
    const userid = faker.helpers.rangeToNumber({ min: 1, max: 50 });
    const timeOfPurchase = faker.date.recent({ days: 30 }).toISOString().split('T')[0];
    const productId = faker.helpers.rangeToNumber({ min: 1, max: 50 });
    const price = Number(faker.commerce.price());
    const productName = faker.commerce.productName();
    const productImage = faker.image.url();

    result.push({
      userid,
      timeOfPurchase,
      productId,
      price,
      productName,
      productImage,
    });
  }

  const testPurchase: UserPurchase = {
    userid: 51,
    timeOfPurchase: faker.date.recent({ days: 30 }).toISOString().split('T').join(' ').split('.')[0],
    productId: faker.helpers.rangeToNumber({ min: 1, max: 50 }),
    price: Number(faker.commerce.price()),
    productName: faker.commerce.productName(),
    productImage: faker.image.url(),
  };
  result.push(testPurchase);

  return result;
}

