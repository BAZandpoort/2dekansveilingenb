import { faker } from '@faker-js/faker';

interface Order {
  productid: number;
  buyerid: number;
  deliverymethod: string;
}

export default async function orders(): Promise<Order[]> {
  const result: Order[] = [];
  const productids = Array.from(Array(50).keys()).map((i) => i + 1);
  const buyerids = Array.from(Array(50).keys()).map((i) => i + 1);
  for (let i = 0; i < 50; i++) {
    const productid = faker.helpers.arrayElement(productids);
    const buyerid = faker.helpers.arrayElement(buyerids);
    const deliverymethod = faker.helpers.arrayElement(['standard', 'express', 'pickup']);

    productids.splice(productids.indexOf(productid), 1);
    buyerids.splice(buyerids.indexOf(buyerid), 1);
    result.push({
      productid,
      buyerid,
      deliverymethod,
    });
  }

  const testOrder: Order = {
    productid: faker.helpers.rangeToNumber({ min: 1, max: 50 }),
    buyerid: 51,
    deliverymethod: faker.helpers.arrayElement(['standard', 'express', 'pickup']),
  };
  result.push(testOrder);

  return result;
}

