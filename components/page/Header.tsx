import Head from 'next/head';

export function Header() {
  // if (process.browser) {
  //   // @ts-ignore
  //   var hTooltips = {
  //     colorLinks: true,
  //     iconizeLinks: true,
  //     renameLinks: true
  //   };
  // }
  return (
    <Head>
      <title>Awaken loot manager</title>
      <meta name="viewport" content="initial-scale=1.0, width=device-width" />
      <script
        dangerouslySetInnerHTML={{
          __html: `
        window.whTooltips = window.wowhead_tooltips = {
          colorLinks: true,
          iconizeLinks: true,
          renameLinks: true,
          iconSize: 'medium'
        };
        var head = document.getElementsByTagName('head')[0];
        var wowHeadScript = document.createElement('script');
        wowHeadScript.src = 'https://wow.zamimg.com/widgets/power.js?t=' + Date.now();
        head.appendChild(window.wowHeadScript);
        `
        }}
      />
    </Head>
  );
}

// Header.getInitialProps = async () => {
//   //TODO change this
//   // @ts-ignore
//   window.w;
// };
