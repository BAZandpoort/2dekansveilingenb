import { faker } from '@faker-js/faker';

interface Products {
  userid: number;
  categoryid: number;
  name: string;
  description: string;
  price: string;
  imageUrl: string;
  endDate: string;
}

export default async function products(): Promise<Products[]> {
  const result: Products[] = [];
  const userIds = Array.from(Array(50).keys()).map((i) => i + 1);
  const imageIds = Array.from(Array(50).keys()).map((i) => i + 1);
  for (let i = 0; i < 50; i++) {
    const userid = faker.helpers.arrayElement(userIds);
    const categoryid = faker.helpers.arrayElement(Array.from(Array(10).keys()).map((i) => i + 1));
    const name = faker.commerce.productName();
    const description = faker.commerce.productDescription();
    const price = faker.commerce.price();
    const imageId = faker.helpers.arrayElement(imageIds);
    const imageUrl = imageId + '.jpg';
    const endDate = faker.date.soon();

    userIds.splice(userIds.indexOf(userid), 1);
    imageIds.splice(userIds.indexOf(imageId), 1);
    result.push({
      userid,
      categoryid,
      name,
      description,
      price,
      imageUrl,
      endDate: endDate.toISOString(),
    });
  }

  return result;
}
