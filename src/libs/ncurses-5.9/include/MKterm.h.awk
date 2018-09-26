# vile:awkmode
BEGIN		{
		    print  "/****************************************************************************"
		    print  " * Copyright (c) 1998-2009,2010 Free Software Foundation, Inc.              *"
		    print  " *                                                                          *"
		    print  " * Permission is hereby granted, free of charge, to any person obtaining a  *"
		    print  " * copy of this software and associated documentation files (the            *"
		    print  " * \"Software\"), to deal in the Software without restriction, including      *"
		    print  " * without limitation the rights to use, copy, modify, merge, publish,      *"
		    print  " * distribute, distribute with modifications, sublicense, and/or sell       *"
		    print  " * copies of the Software, and to permit persons to whom the Software is    *"
		    print  " * furnished to do so, subject to the following conditions:                 *"
		    print  " *                                                                          *"
		    print  " * The above copyright notice and this permission notice shall be included  *"
		    print  " * in all copies or substantial portions of the Software.                   *"
		    print  " *                                                                          *"
		    print  " * THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS  *"
		    print  " * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF               *"
		    print  " * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.   *"
		    print  " * IN NO EVENT SHALL THE ABOVE COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,   *"
		    print  " * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR    *"
		    print  " * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR    *"
		    print  " * THE USE OR OTHER DEALINGS IN THE SOFTWARE.                               *"
		    print  " *                                                                          *"
		    print  " * Except as contained in this notice, the name(s) of the above copyright   *"
		    print  " * holders shall not be used in advertising or otherwise to promote the     *"
		    print  " * sale, use or other dealings in this Software without prior written       *"
		    print  " * authorization.                                                           *"
		    print  " ****************************************************************************/"
		    print  ""
		    print  "/****************************************************************************/"
		    print  "/* Author: Zeyd M. Ben-Halim <zmbenhal@netcom.com> 1992,1995                */"
		    print  "/*    and: Eric S. Raymond <esr@snark.thyrsus.com>                          */"
		    print  "/*    and: Thomas E. Dickey                        1995-on                  */"
		    print  "/****************************************************************************/"
		    print  ""
		    print  "/* $Id: MKterm.h.awk.in,v 1.58 2010/01/09 19:53:26 tom Exp $ */"
		    print  ""
		    print  "/*"
		    print  "**	term.h -- Definition of struct term"
		    print  "*/"
		    print  ""
		    print  "#ifndef NCURSES_TERM_H_incl"
		    print  "#define NCURSES_TERM_H_incl 1"
		    print  ""
		    print  "#undef  NCURSES_VERSION"
		    print  "#define NCURSES_VERSION \"5.9\""
		    print  ""
		    print  "#include <ncurses_dll.h>"
		    print  ""
		    print  "#ifdef __cplusplus"
		    print  "extern \"C\" {"
		    print  "#endif"
		    print  ""
		    print  "/* Make this file self-contained by providing defaults for the HAVE_TERMIO[S]_H"
		    print  " * definition (based on the system for which this was configured)."
		    print  " */"
		    print  ""
		    print  "#undef  NCURSES_CONST"
		    print  "#define NCURSES_CONST /*nothing*/"
		    print  ""
		    print  "#undef  NCURSES_SBOOL"
		    print  "#define NCURSES_SBOOL char"
		    print  ""
		    print  "#undef  NCURSES_XNAMES"
		    print  "#define NCURSES_XNAMES 1"
		    print  ""
		    print  "/* We will use these symbols to hide differences between"
		    print  " * termios/termio/sgttyb interfaces."
		    print  " */"
		    print  "#undef  TTY"
		    print  "#undef  SET_TTY"
		    print  "#undef  GET_TTY"
		    print  ""
		    print  "/* Assume POSIX termio if we have the header and function */"
		    print  "/* #if HAVE_TERMIOS_H && HAVE_TCGETATTR */"
		    print  "#if 1 && 1"
		    print  ""
		    print  "#undef  TERMIOS"
		    print  "#define TERMIOS 1"
		    print  ""
		    print  "#include <termios.h>"
		    print  "#define TTY struct termios"
		    print  ""
		    print  "#else /* !HAVE_TERMIOS_H */"
		    print  ""
		    print  "/* #if HAVE_TERMIO_H */"
		    print  "#if 1"
		    print  ""
		    print  "#undef  TERMIOS"
		    print  "#define TERMIOS 1"
		    print  ""
		    print  "#include <termio.h>"
		    print  "#define TTY struct termio"
		    print  ""
		    print  "/* Add definitions to make termio look like termios."
		    print  " * But ifdef it, since there are some implementations"
		    print  " * that try to do this for us in a fake <termio.h>."
		    print  " */"
		    print  "#ifndef TCSANOW"
		    print  "#define TCSANOW TCSETA"
		    print  "#endif"
		    print  "#ifndef TCSADRAIN"
		    print  "#define TCSADRAIN TCSETAW"
		    print  "#endif"
		    print  "#ifndef TCSAFLUSH"
		    print  "#define TCSAFLUSH TCSETAF"
		    print  "#endif"
		    print  "#ifndef tcsetattr"
		    print  "#define tcsetattr(fd, cmd, arg) ioctl(fd, cmd, arg)"
		    print  "#endif"
		    print  "#ifndef tcgetattr"
		    print  "#define tcgetattr(fd, arg) ioctl(fd, TCGETA, arg)"
		    print  "#endif"
		    print  "#ifndef cfgetospeed"
		    print  "#define cfgetospeed(t) ((t)->c_cflag & CBAUD)"
		    print  "#endif"
		    print  "#ifndef TCIFLUSH "
		    print  "#define TCIFLUSH 0"
		    print  "#endif"
		    print  "#ifndef TCOFLUSH "
		    print  "#define TCOFLUSH 1"
		    print  "#endif"
		    print  "#ifndef TCIOFLUSH "
		    print  "#define TCIOFLUSH 2"
		    print  "#endif"
		    print  "#ifndef tcflush"
		    print  "#define tcflush(fd, arg) ioctl(fd, TCFLSH, arg)"
		    print  "#endif"
		    print  ""
		    print  "#else /* !HAVE_TERMIO_H */"
		    print  ""
		    print  "#if __MINGW32__"
		    print  "#  include <ncurses_mingw.h>"
		    print  "#  define TTY struct termios"
		    print  "#else"
		    print  "#undef TERMIOS"
		    print  "#include <sgtty.h>"
		    print  "#include <sys/ioctl.h>"
		    print  "#define TTY struct sgttyb"
		    print  "#endif /* MINGW32 */"
		    print  "#endif /* HAVE_TERMIO_H */"
		    print  ""
		    print  "#endif /* HAVE_TERMIOS_H */"
		    print  ""
		    print  "#ifdef TERMIOS"
		    print  "#define GET_TTY(fd, buf) tcgetattr(fd, buf)"
		    print  "#define SET_TTY(fd, buf) tcsetattr(fd, TCSADRAIN, buf)"
		    print  "#else"
		    print  "#define GET_TTY(fd, buf) gtty(fd, buf)"
		    print  "#define SET_TTY(fd, buf) stty(fd, buf)"
		    print  "#endif"
		    print  ""
		    print  "#define NAMESIZE 256"
		    print  ""
		    print  "#define CUR cur_term->type."
		    print  ""
		}

$2 == "%%-STOP-HERE-%%"	{
			print  ""
			printf "#define BOOLWRITE %d\n", BoolCount
			printf "#define NUMWRITE  %d\n", NumberCount
			printf "#define STRWRITE  %d\n", StringCount
			print  ""
			print  "/* older synonyms for some capabilities */"
			print  "#define beehive_glitch	no_esc_ctlc"
			print  "#define teleray_glitch	dest_tabs_magic_smso"
			print  "#define micro_char_size micro_col_size"
			print  ""
			print  "#ifdef __INTERNAL_CAPS_VISIBLE"
		}

/^#/		{next;}

$1 == "acs_chars"	{acsindex = StringCount}

$3 == "bool"	{
		    printf "#define %-30s CUR Booleans[%d]\n", $1, BoolCount++
		}

$3 == "num"	{
		    printf "#define %-30s CUR Numbers[%d]\n", $1, NumberCount++
		}

$3 == "str"	{
		    printf "#define %-30s CUR Strings[%d]\n", $1, StringCount++
		}

END		{
			print  "#endif /* __INTERNAL_CAPS_VISIBLE */"
			print  ""
			print  ""
			print  "/*"
			print  " * Predefined terminfo array sizes"
			print  " */"
			printf "#define BOOLCOUNT %d\n", BoolCount
			printf "#define NUMCOUNT  %d\n", NumberCount
			printf "#define STRCOUNT  %d\n", StringCount
			print  ""
			print  "/* used by code for comparing entries */"
			print  "#define acs_chars_index	", acsindex
			print  ""
			print  "typedef struct termtype {	/* in-core form of terminfo data */"
			print  "    char  *term_names;		/* str_table offset of term names */"
			print  "    char  *str_table;		/* pointer to string table */"
			print  "    NCURSES_SBOOL  *Booleans;	/* array of boolean values */"
			print  "    short *Numbers;		/* array of integer values */"
			print  "    char  **Strings;		/* array of string offsets */"
			print  ""
			print  "#if NCURSES_XNAMES"
			print  "    char  *ext_str_table;	/* pointer to extended string table */"
			print  "    char  **ext_Names;		/* corresponding names */"
			print  ""
			print  "    unsigned short num_Booleans;/* count total Booleans */"
			print  "    unsigned short num_Numbers;	/* count total Numbers */"
			print  "    unsigned short num_Strings;	/* count total Strings */"
			print  ""
			print  "    unsigned short ext_Booleans;/* count extensions to Booleans */"
			print  "    unsigned short ext_Numbers;	/* count extensions to Numbers */"
			print  "    unsigned short ext_Strings;	/* count extensions to Strings */"
			print  "#endif /* NCURSES_XNAMES */"
			print  ""
			print  "} TERMTYPE;"
			print  ""
			print  "typedef struct term {		/* describe an actual terminal */"
			print  "    TERMTYPE	type;		/* terminal type description */"
			print  "    short	Filedes;	/* file description being written to */"
			print  "    TTY		Ottyb,		/* original state of the terminal */"
			print  "		Nttyb;		/* current state of the terminal */"
			print  "    int		_baudrate;	/* used to compute padding */"
			print  "    char *      _termname;      /* used for termname() */"
			print  "} TERMINAL;"
			print  ""
			print  "#if 1 && !0"
			print  "extern NCURSES_EXPORT_VAR(TERMINAL *) cur_term;"
			print  "#elif 0"
			print  "NCURSES_WRAPPED_VAR(TERMINAL *, cur_term);"
			print  "#define cur_term   NCURSES_PUBLIC_VAR(cur_term())"
			print  "#else"
			print  "extern NCURSES_EXPORT_VAR(TERMINAL *) cur_term;"
			print  "#endif"
			print  ""
			print  "#if 1 || 0"
			print  "NCURSES_WRAPPED_VAR(NCURSES_CONST char * const *, boolnames);"
			print  "NCURSES_WRAPPED_VAR(NCURSES_CONST char * const *, boolcodes);"
			print  "NCURSES_WRAPPED_VAR(NCURSES_CONST char * const *, boolfnames);"
			print  "NCURSES_WRAPPED_VAR(NCURSES_CONST char * const *, numnames);"
			print  "NCURSES_WRAPPED_VAR(NCURSES_CONST char * const *, numcodes);"
			print  "NCURSES_WRAPPED_VAR(NCURSES_CONST char * const *, numfnames);"
			print  "NCURSES_WRAPPED_VAR(NCURSES_CONST char * const *, strnames);"
			print  "NCURSES_WRAPPED_VAR(NCURSES_CONST char * const *, strcodes);"
			print  "NCURSES_WRAPPED_VAR(NCURSES_CONST char * const *, strfnames);"
			print  ""
			print  "#define boolnames  NCURSES_PUBLIC_VAR(boolnames())"
			print  "#define boolcodes  NCURSES_PUBLIC_VAR(boolcodes())"
			print  "#define boolfnames NCURSES_PUBLIC_VAR(boolfnames())"
			print  "#define numnames   NCURSES_PUBLIC_VAR(numnames())"
			print  "#define numcodes   NCURSES_PUBLIC_VAR(numcodes())"
			print  "#define numfnames  NCURSES_PUBLIC_VAR(numfnames())"
			print  "#define strnames   NCURSES_PUBLIC_VAR(strnames())"
			print  "#define strcodes   NCURSES_PUBLIC_VAR(strcodes())"
			print  "#define strfnames  NCURSES_PUBLIC_VAR(strfnames())"
			print  ""
			print  "#else"
			print  ""
			print  "extern NCURSES_EXPORT_VAR(NCURSES_CONST char * const ) boolnames[];"
			print  "extern NCURSES_EXPORT_VAR(NCURSES_CONST char * const ) boolcodes[];"
			print  "extern NCURSES_EXPORT_VAR(NCURSES_CONST char * const ) boolfnames[];"
			print  "extern NCURSES_EXPORT_VAR(NCURSES_CONST char * const ) numnames[];"
			print  "extern NCURSES_EXPORT_VAR(NCURSES_CONST char * const ) numcodes[];"
			print  "extern NCURSES_EXPORT_VAR(NCURSES_CONST char * const ) numfnames[];"
			print  "extern NCURSES_EXPORT_VAR(NCURSES_CONST char * const ) strnames[];"
			print  "extern NCURSES_EXPORT_VAR(NCURSES_CONST char * const ) strcodes[];"
			print  "extern NCURSES_EXPORT_VAR(NCURSES_CONST char * const ) strfnames[];"
			print  ""
			print  "#endif"
			print  ""
			print  "/* internals */"
			print  "extern NCURSES_EXPORT(int) _nc_set_tty_mode (TTY *buf);"
			print  "extern NCURSES_EXPORT(int) _nc_get_tty_mode (TTY *buf);"
			print  "extern NCURSES_EXPORT(int) _nc_read_entry (const char * const, char * const, TERMTYPE *const);"
			print  "extern NCURSES_EXPORT(int) _nc_read_file_entry (const char *const, TERMTYPE *);"
			print  "extern NCURSES_EXPORT(int) _nc_read_termtype (TERMTYPE *, char *, int);"
			print  "extern NCURSES_EXPORT(char *) _nc_first_name (const char *const);"
			print  "extern NCURSES_EXPORT(int) _nc_name_match (const char *const, const char *const, const char *const);"
			print  "extern NCURSES_EXPORT(const TERMTYPE *) _nc_fallback (const char *);"
			print  ""
			print  "/* entry points */"
			print  "extern NCURSES_EXPORT(TERMINAL *) set_curterm (TERMINAL *);"
			print  "extern NCURSES_EXPORT(int) del_curterm (TERMINAL *);"
			print  ""
			print  "/* miscellaneous entry points */"
			print  "extern NCURSES_EXPORT(int) restartterm (NCURSES_CONST char *, int, int *);"
			print  "extern NCURSES_EXPORT(int) setupterm (NCURSES_CONST char *,int,int *);"
			print  ""
			print  "/* terminfo entry points, also declared in curses.h */"
			print  "#if !defined(__NCURSES_H)"
			print  "extern NCURSES_EXPORT(char *) tigetstr (NCURSES_CONST char *);"
			print  "extern NCURSES_EXPORT_VAR(char) ttytype[];"
			print  "extern NCURSES_EXPORT(int) putp (const char *);"
			print  "extern NCURSES_EXPORT(int) tigetflag (NCURSES_CONST char *);"
			print  "extern NCURSES_EXPORT(int) tigetnum (NCURSES_CONST char *);"
			print  ""
			print  "#if 1 /* NCURSES_TPARM_VARARGS */"
			print  "extern NCURSES_EXPORT(char *) tparm (NCURSES_CONST char *, ...);	/* special */"
			print  "#else"
			print  "extern NCURSES_EXPORT(char *) tparm (NCURSES_CONST char *, long,long,long,long,long,long,long,long,long);	/* special */"
			print  "extern NCURSES_EXPORT(char *) tparm_varargs (NCURSES_CONST char *, ...);	/* special */"
			print  "#endif"
			print  ""
			print  "extern NCURSES_EXPORT(char *) tiparm (const char *, ...);		/* special */"
			print  ""
			print  "#endif /* __NCURSES_H */"
			print  ""
			print  "/* termcap database emulation (XPG4 uses const only for 2nd param of tgetent) */"
			print  "#if !defined(NCURSES_TERMCAP_H_incl)"
			print  "extern NCURSES_EXPORT(char *) tgetstr (NCURSES_CONST char *, char **);"
			print  "extern NCURSES_EXPORT(char *) tgoto (const char *, int, int);"
			print  "extern NCURSES_EXPORT(int) tgetent (char *, const char *);"
			print  "extern NCURSES_EXPORT(int) tgetflag (NCURSES_CONST char *);"
			print  "extern NCURSES_EXPORT(int) tgetnum (NCURSES_CONST char *);"
			print  "extern NCURSES_EXPORT(int) tputs (const char *, int, int (*)(int));"
			print  "#endif /* NCURSES_TERMCAP_H_incl */"
			print  ""
			print  "/*"
			print  " * Include curses.h before term.h to enable these extensions."
			print  " */"
			print  "#if defined(NCURSES_SP_FUNCS) && (NCURSES_SP_FUNCS != 0)"
			print  ""
			print  "extern NCURSES_EXPORT(char *)  NCURSES_SP_NAME(tigetstr) (SCREEN*, NCURSES_CONST char *);"
			print  "extern NCURSES_EXPORT(int)     NCURSES_SP_NAME(putp) (SCREEN*, const char *);"
			print  "extern NCURSES_EXPORT(int)     NCURSES_SP_NAME(tigetflag) (SCREEN*, NCURSES_CONST char *);"
			print  "extern NCURSES_EXPORT(int)     NCURSES_SP_NAME(tigetnum) (SCREEN*, NCURSES_CONST char *);"
			print  ""
			print  "#if 1 /* NCURSES_TPARM_VARARGS */"
			print  "extern NCURSES_EXPORT(char *)  NCURSES_SP_NAME(tparm) (SCREEN*, NCURSES_CONST char *, ...);	/* special */"
			print  "#else"
			print  "extern NCURSES_EXPORT(char *)  NCURSES_SP_NAME(tparm) (SCREEN*, NCURSES_CONST char *, long,long,long,long,long,long,long,long,long);	/* special */"
			print  "extern NCURSES_EXPORT(char *)  NCURSES_SP_NAME(tparm_varargs) (SCREEN*, NCURSES_CONST char *, ...);	/* special */"
			print  "#endif"
			print  ""
			print  "/* termcap database emulation (XPG4 uses const only for 2nd param of tgetent) */"
			print  "extern NCURSES_EXPORT(char *)  NCURSES_SP_NAME(tgetstr) (SCREEN*, NCURSES_CONST char *, char **);"
			print  "extern NCURSES_EXPORT(char *)  NCURSES_SP_NAME(tgoto) (SCREEN*, const char *, int, int);"
			print  "extern NCURSES_EXPORT(int)     NCURSES_SP_NAME(tgetent) (SCREEN*, char *, const char *);"
			print  "extern NCURSES_EXPORT(int)     NCURSES_SP_NAME(tgetflag) (SCREEN*, NCURSES_CONST char *);"
			print  "extern NCURSES_EXPORT(int)     NCURSES_SP_NAME(tgetnum) (SCREEN*, NCURSES_CONST char *);"
			print  "extern NCURSES_EXPORT(int)     NCURSES_SP_NAME(tputs) (SCREEN*, const char *, int, NCURSES_SP_OUTC);"
			print  ""
			print  "extern NCURSES_EXPORT(TERMINAL *) NCURSES_SP_NAME(set_curterm) (SCREEN*, TERMINAL *);"
			print  "extern NCURSES_EXPORT(int)     NCURSES_SP_NAME(del_curterm) (SCREEN*, TERMINAL *);"
			print  ""
			print  "extern NCURSES_EXPORT(int)     NCURSES_SP_NAME(restartterm) (SCREEN*, NCURSES_CONST char *, int, int *);"
			print  "#endif /* NCURSES_SP_FUNCS */"
			print  ""
			print  "#ifdef __cplusplus"
			print  "}"
			print  "#endif"
			print  ""
			print  "#endif /* NCURSES_TERM_H_incl */"
		}
