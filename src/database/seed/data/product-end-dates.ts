import { faker } from '@faker-js/faker';

interface EndDate {
  endDate: string;
}

export default async function endDates(): Promise<EndDate[]> {
  const result: EndDate[] = [];
  for (let i = 0; i < 50; i++) {
    const endDate = faker.date.soon();
    result.push({
      endDate: endDate.toISOString(),
    });
  }

  return result;
}
