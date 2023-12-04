import { faker } from '@faker-js/faker';

interface UserRoleMapping {
  userid: number;
  roleid: number;
}

export default async function userRoleMapping(): Promise<UserRoleMapping[]> {
  const result: UserRoleMapping[] = [];
  const userids = Array.from(Array(50).keys()).map((i) => i + 1);
  for (let i = 0; i < 50; i++) {
    const userid = faker.helpers.arrayElement(userids);
    const roleid = 1;

    userids.splice(userids.indexOf(userid), 1);
    result.push({
      userid,
      roleid,
    });
  }

  return result;
}
