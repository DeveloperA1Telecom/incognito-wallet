import React from 'react';
import { TouchableOpacity, Text, StyleSheet } from 'react-native';
import PropTypes from 'prop-types';
import { COLORS, FONT } from '@src/styles';

export const BtnPrimary = React.memo(
  ({ title, background, wrapperStyle, textStyle, onPress, disabled }) => {
    return (
      <TouchableOpacity
        style={[
          styled.wrapper,
          background && { backgroundColor: background },
          { opacity: disabled ? 0.5 : 1 },
          wrapperStyle,
        ]}
        onPress={onPress}
        disabled={disabled}
      >
        <Text style={[styled.primaryText, textStyle]}>{title}</Text>
      </TouchableOpacity>
    );
  },
);

export const BtnSecondary = React.memo(
  ({ title, background, wrapperStyle, textStyle, onPress, disabled }) => {
    return (
      <TouchableOpacity
        style={[
          styled.wrapper,
          styled.border,
          background && { borderColor: background },
          { opacity: disabled ? 0.5 : 1 },
          wrapperStyle,
        ]}
        onPress={onPress}
        disabled={disabled}
      >
        <Text style={[styled.normalText, textStyle]}>{title}</Text>
      </TouchableOpacity>
    );
  },
);

const styled = StyleSheet.create({
  wrapper: {
    height: 50,
    justifyContent: 'center',
    alignItems: 'center',
    marginBottom: 8,
    borderRadius: 8,
  },
  primaryText: {
    ...FONT.STYLE.medium,
    color: COLORS.white,
    fontSize: FONT.SIZE.medium,
  },
  normalText: {
    ...FONT.STYLE.medium,
    color: COLORS.blue5,
    fontSize: FONT.SIZE.medium,
  },
  border: {
    borderColor: COLORS.blue5,
    borderWidth: 1,
  },
});

BtnPrimary.defaultProps = {
  background: COLORS.blue5,
  wrapperStyle: null,
  textStyle: null,
  disabled: false,
};

BtnPrimary.propTypes = {
  title: PropTypes.string.isRequired,
  background: PropTypes.string,
  wrapperStyle: PropTypes.any,
  onPress: PropTypes.func.isRequired,
  textStyle: PropTypes.any,
  disabled: PropTypes.bool,
};

BtnSecondary.defaultProps = {
  background: null,
  wrapperStyle: null,
  textStyle: null,
  disabled: false,
};

BtnSecondary.propTypes = {
  title: PropTypes.string.isRequired,
  background: PropTypes.string,
  wrapperStyle: PropTypes.any,
  onPress: PropTypes.func.isRequired,
  textStyle: PropTypes.any,
  disabled: PropTypes.bool,
};
