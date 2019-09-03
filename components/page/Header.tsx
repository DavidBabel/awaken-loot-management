import Head from 'next/head';
// import './global.scss';

export function Header() {
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
      {/* <link
        rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
      /> */}
      {/* <link
        rel="stylesheet"
        href="https://fonts.googleapis.com/icon?family=Material+Icons"
      /> */}
    </Head>
  );
}

// Header.getInitialProps = async () => {
//   //TODO change this
//   // @ts-ignore
//   window.w;
// };
