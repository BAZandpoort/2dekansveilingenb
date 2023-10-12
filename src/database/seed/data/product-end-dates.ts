import { faker } from '@faker-js/faker';

interface EndDate {
  endDate: string;
}

export default async function endDates(): Promise<EndDate[]> {
  const result: EndDate[] = [];
  for (let i = 0; i < 50; i++) {
    const endDate = faker.date.soon().toISOString().split('T').join(' ').split('.')[0];
    result.push({
      endDate: endDate,
    });
  }

  return result;
}
