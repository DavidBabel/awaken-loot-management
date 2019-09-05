import { useRouter } from 'next/router';

export default () => {
  const router = useRouter();

  return <div onClick={() => router.push('/raid')}>click</div>;
};
