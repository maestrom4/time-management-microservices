// pages/_app.tsx
import type { AppProps } from 'next/app';
import GlobalStyle from '../src/styles/GlobalStyle'; // Adjust the path as necessary

function MyApp({ Component, pageProps }: AppProps) {
  return (
    <>
      <GlobalStyle />
      <Component {...pageProps} />
    </>
  );
}

export default MyApp;
