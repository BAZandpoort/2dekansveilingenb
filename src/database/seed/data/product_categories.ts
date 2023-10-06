import { faker } from '@faker-js/faker';

interface ProductCategories {
  name: string;
  icon: string;
}

export default async function productCategories(): Promise<ProductCategories[]> {
  const result: ProductCategories[] = [];
  const checkList: string[] = [];
  for (let i = 0; i < 10; i++) {
    let name;
    do {
      name = faker.commerce.department();
    } while (checkList.includes(name));

    const icon = faker.helpers.arrayElement([
      'fa-utensils',
      'fa-tshirt',
      'fa-shoe-prints',
      'fa-tv',
      'fa-mobile-alt',
      'fa-laptop',
      'fa-tablet-alt',
      'fa-camera',
      'fa-headphones',
      'fa-gamepad',
      'fa-car',
      'fa-baby',
      'fa-chair',
      'fa-bicycle',
      'fa-book',
      'fa-guitar',
      'fa-gift',
      'fa-couch',
      'fa-bed',
      'fa-bath',
      'fa-bus',
      'fa-train',
      'fa-plane',
      'fa-hamburger',
      'fa-pizza-slice',
      'fa-coffee',
      'fa-cocktail',
      'fa-beer',
      'fa-wine-glass-alt',
      'fa-coins',
      'fa-shopping-bag',
      'fa-shopping-basket',
      'fa-shopping-cart',
      'fa-shopping-cart']);

    checkList.push(name);
  
    result.push({
      name,
      icon,
    });
  }

  return result;
}
