import Link from "next/link";
import { Raid } from "../../lib/generatedTypes";

export function RaidButton({ date, id, donjonByDonjonId: { name } }: Raid) {
  return (
    <button>
      <Link href="/raid/edit/[id]" as={`/raid/edit/${id}`}>
        <a>
          <div>{date}</div>
          <div>{name}</div>
        </a>
      </Link>
    </button>
  );
}
