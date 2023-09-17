import { faker } from '@faker-js/faker';

interface UserProfile {
  userid: number;
  profilePictureUrl: string;
  about: string;
}

export default async function userProfiles(): Promise<UserProfile[]> {
  const result: UserProfile[] = [];
  const userids = Array.from(Array(50).keys()).map((i) => i + 1);
  for (let i = 0; i < 50; i++) {
    const userid = faker.helpers.arrayElement(userids);
    const profilePictureUrl = faker.image.avatar();
    const about = faker.lorem.paragraph();

    userids.splice(userids.indexOf(userid), 1);
    result.push({
      userid,
      profilePictureUrl,
      about,
    });
  }

  return result;
}
