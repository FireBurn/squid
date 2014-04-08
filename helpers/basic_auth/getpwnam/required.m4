AC_CHECK_HEADERS([pwd.h],[
  # check for crypt(3), may require -lcrypt
  SQUID_STATE_SAVE(getpwnam_helper)
  LIBS="$LIBS $CRYPTLIB"
  AC_CHECK_FUNCS(crypt)
  SQUID_STATE_ROLLBACK(getpwnam_helper)

  # unconditionally requires crypt(3), for now
  if test "x$cv_ac_func_crypt" != "x"; then
    AC_CHECK_HEADERS(unistd.h crypt.h shadow.h)

    BUILD_HELPER="getpwnam"
  fi
])
