import { faker } from '@faker-js/faker';

interface Products {
  userid: number;
  name: string;
  description: string;
  price: string;
  imageUrl: string;
}

export default async function products(): Promise<Products[]> {
  const result: Products[] = [];
  const userids = Array.from(Array(50).keys()).map((i) => i + 1);
  for (let i = 0; i < 50; i++) {
    const userid = faker.helpers.arrayElement(userids);
    const name = faker.commerce.productName();
    const description = faker.commerce.productDescription();
    const price = faker.commerce.price();
    const imageUrl = faker.image.urlPicsumPhotos();

    userids.splice(userids.indexOf(userid), 1);
    result.push({
      userid,
      name,
      description,
      price,
      imageUrl,
    });
  }

  return result;
}
