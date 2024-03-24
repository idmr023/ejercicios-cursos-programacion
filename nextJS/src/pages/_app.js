import MainLayout from '@layout/MainLayout';
import '@styles/tailwind.css';
import { ProviderAuth } from '@hooks/useAuth';

export default function MyApp({ Component, pageProps }) {
  return(
    <>
      <ProviderAuth>
        <MainLayout>
          <Component {...pageProps} />
        </MainLayout>
      </ProviderAuth>
    </>
  );
}