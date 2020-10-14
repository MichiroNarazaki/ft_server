<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wp' );

/** MySQL database username */
define( 'DB_USER', 'wp' );

/** MySQL database password */
define( 'DB_PASSWORD', 'password' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'eh3_>43+v_exz-)[vB>D`U+`q94VN6=x^%,REtv+bag&b])%:L@obkC`+3kR,%q>');
define('SECURE_AUTH_KEY',  '-DplIe<TK(8.WBbl6nTu-h)KX=|>ON&{V~G$)KZ8*y-7%mTy(($$)0>gloT`iOF[');
define('LOGGED_IN_KEY',    'JzY5F{+b<*MEO]!-(+C0^v4A4|Fl#m+E+Q=[TO)2wBRL7VFDL+N:)H=,5UY-lD#f');
define('NONCE_KEY',        'Tx*i:UPsQzKE<pG|.^m:8=CGEk1^#KrAKmmL+`fx&@fitDd)I:?R{8BvOF64G?iy');
define('AUTH_SALT',        'I|A2+]%KZo*^$_oTfi-Ra*sVS7##iT{Fdr+bN-@NH+czTco)[+OBm46tb$m1N38?');
define('SECURE_AUTH_SALT', '#-+B*1PtRq||mINa-8|CLooocw(NHB&Sz?d7+d yiiJEv|K.Q**7I*K~?]^[Ak|F');
define('LOGGED_IN_SALT',   'CN(_|)lJf]/p93DT:BPa3B:Qcp@ezLs|yQ})d2JNN]#MZwN%`6~Xe=ht41|d:!=%');
define('NONCE_SALT',       '6x%OV~~pgZq|1xt>PH|dwT6zcmf{3fpx0<bfwLMBm<I9_CqlTbnSe9b| h-M1B]D');
/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'my_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
