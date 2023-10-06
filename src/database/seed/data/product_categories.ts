import { faker } from '@faker-js/faker';

interface ProductCategories {
  name: string;
}

export default async function productCategories(): Promise<ProductCategories[]> {
  const result: ProductCategories[] = [];
  const checkList: string[] = [];
  for (let i = 0; i < 10; i++) {
    let name;
    do {
      name = faker.commerce.department();
    } while (checkList.includes(name));

    checkList.push(name);
  
    result.push({
      name
    });
  }

  return result;
}
