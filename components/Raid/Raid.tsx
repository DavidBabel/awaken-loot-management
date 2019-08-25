import { Raid } from '../../lib/generatedTypes';
// import Router from 'next/router';
import Link from 'next/link';

export function RaidButton({ date, id, donjonByDonjonId: { name } }: Raid) {
  return (
    <button>
      <Link href="/viewRaid/[id]" as={`/viewRaid/${id}`}>
        <a>
          <div>{date}</div>
          <div>{name}</div>
        </a>
      </Link>
    </button>
  );
}
