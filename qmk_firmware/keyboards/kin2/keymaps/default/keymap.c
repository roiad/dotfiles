#include QMK_KEYBOARD_H

enum layer_names {
    _BASE,
    _FN,
};

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
	[_BASE]=LAYOUT(
		KC_EQL   , KC_1     , KC_2    , KC_3     , KC_4    , KC_5           , KC_6        , KC_7        , KC_8      , KC_9   , KC_0     , KC_MINS   ,
		KC_LNG5  , KC_Q     , KC_W    , KC_E     , KC_R    , KC_T           , KC_Y        , KC_U        , KC_I	    , KC_O   , KC_P     , KC_SLASH,
		KC_TAB   , KC_A     , KC_S    , KC_D     , KC_F    , KC_G           , KC_H        , KC_J        , KC_K      , KC_L   , KC_COLON , KC_QUOTE  ,
		KC_LSFT  , KC_Z     , KC_X    , KC_C     , KC_V    , KC_B           , KC_N        , KC_M        , KC_COMMA  , KC_DOT , KC_SLASH , KC_RSFT   ,
		                      KC_GRV  , KC_BSLS  , KC_LEFT , KC_RIGHT       , KC_DOWN     , KC_UP       , KC_LBRC   , KC_RBRC,
		KC_BSPC  , MO(_FN)  , KC_ESC  , KC_SPC   , KC_LCTL , KC_LGUI        , KC_LGUI     , KC_LCTL     , TG(_FN)   , KC_RALT, KC_ENT   , KC_SPC
		),
	[_FN] =LAYOUT(
		KC_F1    , KC_F2  , KC_F3  , KC_F4  , KC_F5  , KC_F6  ,           KC_F7  , KC_F8  , KC_F9  , KC_F10  , KC_F11 , KC_F12,
		KC_LNG3  , KC_1   , KC_2   , KC_3   , KC_4   , KC_5   ,           KC_EXLM, KC_AT  , KC_CIRC, KC_LPRN , KC_RPRN, KC_AUDIO_VOL_UP,
		KC_CAPS  , KC_6   , KC_7   , KC_8   , KC_9   , KC_0   ,           KC_LEFT, KC_DOWN, KC_UP  , KC_RIGHT, KC_SCLN, KC_AUDIO_MUTE,
		KC_TRNS  , KC_DLR , KC_PERC, KC_EQL , KC_PLUS, KC_EXLM,           KC_INT5, KC_MINS, KC_HASH, KC_AMPR , KC_ASTR, KC_MENU,
        KC_KB_VOLUME_DOWN , KC_KB_VOLUME_UP , KC_HOME, KC_END ,           KC_PGDN, KC_PGUP, KC_LNG1, KC_INT2,
		KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS,   KC_TRNS,           KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS)

}
;
