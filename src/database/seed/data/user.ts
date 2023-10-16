import { faker } from '@faker-js/faker';
import argon2 from 'argon2';

interface User {
  username: string;
  email: string;
  password: string;
  firstname: string;
  lastname: string;
}

export default async function users(): Promise<User[]> {
  const result: User[] = [];
  for (let i = 0; i < 50; i++) {
    const username = faker.internet.userName();
    const email = faker.internet.email();
    const password = await argon2.hash(faker.internet.password(), { type: argon2.argon2id });
    const firstname = faker.person.firstName();
    const lastname = faker.person.lastName();

    result.push({
      username,
      email,
      password,
      firstname,
      lastname,
    });
  }

  const testUser: User = {
    username: 'Testing Account',
    email: 'test@gmail.com',
    password: await argon2.hash('123'),
    firstname: 'Testing',
    lastname: 'Account',
  }

  result.push(testUser);

  return result;
}
