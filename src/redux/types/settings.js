import { genNamspace } from '@src/utils/reduxUtils';

const n = genNamspace('SETTINGS');

const TYPES = {
  SET_SETTINGS: n('SET_SETTINGS'),
  SET_BANNERS: n('SET_BANNERS')
};

export default TYPES;
