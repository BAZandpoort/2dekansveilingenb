import { faker } from '@faker-js/faker';

interface UserProfile {
  userid: number;
  profilePictureUrl: string;
  about: string;
  theme: string;
  language: string;
}

export default async function userProfiles(): Promise<UserProfile[]> {
  const result: UserProfile[] = [];
  const userids = Array.from(Array(50).keys()).map((i) => i + 1);
  const imageIds = Array.from(Array(50).keys()).map((i) => i + 1);
  for (let i = 0; i < 50; i++) {
    const userid = faker.helpers.arrayElement(userids);
    const profilePictureId = faker.helpers.arrayElement(imageIds);
    const profilePictureUrl = profilePictureId + '.jpg';
    const about = faker.lorem.paragraph();
    const theme = faker.helpers.arrayElement(['light', 'dark']);
    const language = faker.helpers.arrayElement(['text_en', 'text_nl', 'text_fr']);

    userids.splice(userids.indexOf(userid), 1);
    imageIds.splice(imageIds.indexOf(profilePictureId), 1);
    result.push({
      userid,
      profilePictureUrl,
      about,
      theme,
      language,
    });
  }

  const testUserProfile: UserProfile = {
    userid: 51,
    profilePictureUrl: 'test.jpg',
    about: 'Testing Account',
    theme: 'light',
    language: 'text_en',
  }
  result.push(testUserProfile);

  return result;
}
