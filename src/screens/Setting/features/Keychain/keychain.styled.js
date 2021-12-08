import {StyleSheet} from 'react-native';
import {COLORS, FONT} from '@src/styles';

export const itemStyled = StyleSheet.create({
  wrap: {
    backgroundColor: COLORS.transparent,
    marginBottom: 8
  },
  wrapContent: {
    padding: 16,
  },
  wrapBin: {
    flex: 1,
    backgroundColor: COLORS.red,
    borderTopRightRadius: 8,
    borderBottomRightRadius: 8,
    justifyContent: 'center',
    alignItems: 'center'
  },
  mediumBlack: {
    ...FONT.STYLE.medium,
    fontSize: FONT.SIZE.medium,
    lineHeight: FONT.SIZE.medium + 9,
  },
  mediumGrey: {
    ...FONT.STYLE.medium,
    fontSize: FONT.SIZE.small,
    lineHeight: FONT.SIZE.small + 7,
    paddingLeft: 36
  },
  shadow: {
    shadowOffset: {
      width: 0,
      height: 0,
    },
    shadowOpacity: 0.1,
    shadowRadius: 3,
    borderRadius: 8,
    borderWidth: 1,
    borderColor: COLORS.colorGrey4,
    overflow: 'visible'
  },
  arrow: {
    tintColor: COLORS.blue5,
    width: 8,
    height: 13,
  },
  wrapSetting: {
    paddingVertical: 16,
    borderBottomColor: COLORS.colorGrey4,
    borderBottomWidth: 1
  },
  wrapIcon: {
    width: 24,
    height: 24,
    justifyContent: 'center',
    alignItems: 'center',
    marginRight: 16
  }
});

export const styled = StyleSheet.create({
  wrapper: {
    paddingHorizontal: 25,
    paddingTop: 24,
  }
});

