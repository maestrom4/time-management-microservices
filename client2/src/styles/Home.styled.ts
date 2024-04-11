// styles/Home.styled.ts
import styled from 'styled-components';
import tw from 'twin.macro';

export const Container = styled.div`
  ${tw`px-8 m-auto`}
`;

export const Main = styled.main`
  ${tw`min-h-screen py-16 flex flex-col justify-center items-center`}
`;

export const Footer = styled.footer`
  ${tw`flex w-full py-8 justify-center items-center border-t border-gray-200`}
`;

export const Title = styled.h1`
  ${tw`m-0 text-4xl leading-tight text-center`}
`;

export const Description = styled.p`
  ${tw`text-center`}
`;

export const Code = styled.code`
  ${tw`bg-gray-100 rounded p-3 text-lg font-mono`}
`;
