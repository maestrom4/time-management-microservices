import { fileURLToPath } from 'url';
import { dirname } from 'path';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

export default {
  webpack: (config) => {
    config.resolve.alias['@components'] = `${__dirname}/src/components`;
    config.resolve.alias['@pages'] = `${__dirname}/src/pages`;
    config.resolve.alias['@hooks'] = `${__dirname}/src/hooks`;
    config.resolve.alias['@styles'] = `${__dirname}/src/styles`;
    config.resolve.alias['@app'] = `${__dirname}/src/app`;
    config.resolve.alias['@containers'] = `${__dirname}/src/containers`;
    config.resolve.alias['@store'] = `${__dirname}/src/store`;
    config.resolve.alias['@types'] = `${__dirname}/src/types`;
    config.resolve.alias['@utils'] = `${__dirname}/src/utils`;
    return config;
  },
};
