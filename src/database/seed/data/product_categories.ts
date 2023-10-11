import { faker } from '@faker-js/faker';

interface ProductCategories {
  name: string;
  icon: string;
}

export default async function productCategories(): Promise<ProductCategories[]> {
  const result: ProductCategories[] = [];
  const checkList: string[] = [];
  for (let i = 0; i < 22; i++) {
    let name;
    do {
      name = faker.commerce.department();
    } while (checkList.includes(name));

    checkList.push(name);

    const icon = faker.helpers.arrayElement([
      'fa-utensils',
      'fa-tshirt',
      'fa-laptop',
      'fa-mobile-alt',
      'fa-tv',
      'fa-book',
      'fa-gamepad',
      'fa-headphones',
      'fa-camera',
      'fa-baby',
      'fa-briefcase',
      'fa-bicycle',
      'fa-car',
      'fa-couch',
      'fa-guitar',
      'fa-gift',
      'fa-glasses',
      'fa-hat-wizard',
      'fa-microphone',
      'fa-music',
      'fa-paw',
      'fa-pizza-slice',
      'fa-suitcase',
      'fa-tools',
      'fa-tshirt',
    ]);
  
    result.push({
      name,
      icon,
    });
  }

  return result;
}
