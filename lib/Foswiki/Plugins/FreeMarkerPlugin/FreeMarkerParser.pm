####################################################################
#
#    This file was generated using Parse::Yapp version 1.05.
#
#        Don't edit this file, use source file instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
####################################################################
package Foswiki::Plugins::FreeMarkerPlugin::FreeMarkerParser;
use vars qw ( @ISA );
use strict;

@ISA= qw ( Parse::Yapp::Driver::FreeMarkerParser );
#Included Parse/Yapp/Driver.pm file----------------------------------------
{
#
# Module Parse::Yapp::Driver::FreeMarkerParser
#
# This module is part of the Parse::Yapp package available on your
# nearest CPAN
#
# Any use of this module in a standalone parser make the included
# text under the same copyright as the Parse::Yapp module itself.
#
# This notice should remain unchanged.
#
# (c) Copyright 1998-2001 Francois Desarmenien, all rights reserved.
# (see the pod text in Parse::Yapp module for use and distribution rights)
#

package Parse::Yapp::Driver::FreeMarkerParser;

require 5.004;

use strict;

use vars qw ( $VERSION $COMPATIBLE $FILENAME );

$VERSION = '1.05';
$COMPATIBLE = '0.07';
$FILENAME=__FILE__;

use Carp;

#Known parameters, all starting with YY (leading YY will be discarded)
my(%params)=(YYLEX => 'CODE', 'YYERROR' => 'CODE', YYVERSION => '',
			 YYRULES => 'ARRAY', YYSTATES => 'ARRAY', YYDEBUG => '');
#Mandatory parameters
my(@params)=('LEX','RULES','STATES');

sub new {
    my($class)=shift;
	my($errst,$nberr,$token,$value,$check,$dotpos);
    my($self)={ ERROR => \&_Error,
				ERRST => \$errst,
                NBERR => \$nberr,
				TOKEN => \$token,
				VALUE => \$value,
				DOTPOS => \$dotpos,
				STACK => [],
				DEBUG => 0,
				CHECK => \$check };

	_CheckParams( [], \%params, \@_, $self );

		exists($$self{VERSION})
	and	$$self{VERSION} < $COMPATIBLE
	and	croak "Yapp driver version $VERSION ".
			  "incompatible with version $$self{VERSION}:\n".
			  "Please recompile parser module.";

        ref($class)
    and $class=ref($class);

    bless($self,$class);
}

sub YYParse {
    my($self)=shift;
    my($retval);

	_CheckParams( \@params, \%params, \@_, $self );

	if($$self{DEBUG}) {
		_DBLoad();
		$retval = eval '$self->_DBParse()';#Do not create stab entry on compile
        $@ and die $@;
	}
	else {
		$retval = $self->_Parse();
	}
    $retval
}

sub YYData {
	my($self)=shift;

		exists($$self{USER})
	or	$$self{USER}={};

	$$self{USER};
	
}

sub YYErrok {
	my($self)=shift;

	${$$self{ERRST}}=0;
    undef;
}

sub YYNberr {
	my($self)=shift;

	${$$self{NBERR}};
}

sub YYRecovering {
	my($self)=shift;

	${$$self{ERRST}} != 0;
}

sub YYAbort {
	my($self)=shift;

	${$$self{CHECK}}='ABORT';
    undef;
}

sub YYAccept {
	my($self)=shift;

	${$$self{CHECK}}='ACCEPT';
    undef;
}

sub YYError {
	my($self)=shift;

	${$$self{CHECK}}='ERROR';
    undef;
}

sub YYSemval {
	my($self)=shift;
	my($index)= $_[0] - ${$$self{DOTPOS}} - 1;

		$index < 0
	and	-$index <= @{$$self{STACK}}
	and	return $$self{STACK}[$index][1];

	undef;	#Invalid index
}

sub YYCurtok {
	my($self)=shift;

        @_
    and ${$$self{TOKEN}}=$_[0];
    ${$$self{TOKEN}};
}

sub YYCurval {
	my($self)=shift;

        @_
    and ${$$self{VALUE}}=$_[0];
    ${$$self{VALUE}};
}

sub YYExpect {
    my($self)=shift;

    keys %{$self->{STATES}[$self->{STACK}[-1][0]]{ACTIONS}}
}

sub YYLexer {
    my($self)=shift;

	$$self{LEX};
}


#################
# Private stuff #
#################


sub _CheckParams {
	my($mandatory,$checklist,$inarray,$outhash)=@_;
	my($prm,$value);
	my($prmlst)={};

	while(($prm,$value)=splice(@$inarray,0,2)) {
        $prm=uc($prm);
			exists($$checklist{$prm})
		or	croak("Unknow parameter '$prm'");
			ref($value) eq $$checklist{$prm}
		or	croak("Invalid value for parameter '$prm'");
        $prm=unpack('@2A*',$prm);
		$$outhash{$prm}=$value;
	}
	for (@$mandatory) {
			exists($$outhash{$_})
		or	croak("Missing mandatory parameter '".lc($_)."'");
	}
}

sub _Error {
	print "Parse error.\n";
}

sub _DBLoad {
	{
		no strict 'refs';

			exists(${__PACKAGE__.'::'}{_DBParse})#Already loaded ?
		and	return;
	}
	my($fname)=__FILE__;
	my(@drv);
	open(DRV,"<$fname") or die "Report this as a BUG: Cannot open $fname";
	while(<DRV>) {
                	/^\s*sub\s+_Parse\s*{\s*$/ .. /^\s*}\s*#\s*_Parse\s*$/
        	and     do {
                	s/^#DBG>//;
                	push(@drv,$_);
        	}
	}
	close(DRV);

	$drv[0]=~s/_P/_DBP/;
	eval join('',@drv);
}

#Note that for loading debugging version of the driver,
#this file will be parsed from 'sub _Parse' up to '}#_Parse' inclusive.
#So, DO NOT remove comment at end of sub !!!
sub _Parse {
    my($self)=shift;

	my($rules,$states,$lex,$error)
     = @$self{ 'RULES', 'STATES', 'LEX', 'ERROR' };
	my($errstatus,$nberror,$token,$value,$stack,$check,$dotpos)
     = @$self{ 'ERRST', 'NBERR', 'TOKEN', 'VALUE', 'STACK', 'CHECK', 'DOTPOS' };

#DBG>	my($debug)=$$self{DEBUG};
#DBG>	my($dbgerror)=0;

#DBG>	my($ShowCurToken) = sub {
#DBG>		my($tok)='>';
#DBG>		for (split('',$$token)) {
#DBG>			$tok.=		(ord($_) < 32 or ord($_) > 126)
#DBG>					?	sprintf('<%02X>',ord($_))
#DBG>					:	$_;
#DBG>		}
#DBG>		$tok.='<';
#DBG>	};

	$$errstatus=0;
	$$nberror=0;
	($$token,$$value)=(undef,undef);
	@$stack=( [ 0, undef ] );
	$$check='';

    while(1) {
        my($actions,$act,$stateno);

        $stateno=$$stack[-1][0];
        $actions=$$states[$stateno];

#DBG>	print STDERR ('-' x 40),"\n";
#DBG>		$debug & 0x2
#DBG>	and	print STDERR "In state $stateno:\n";
#DBG>		$debug & 0x08
#DBG>	and	print STDERR "Stack:[".
#DBG>					 join(',',map { $$_[0] } @$stack).
#DBG>					 "]\n";


        if  (exists($$actions{ACTIONS})) {

				defined($$token)
            or	do {
				($$token,$$value)=&$lex($self);
#DBG>				$debug & 0x01
#DBG>			and	print STDERR "Need token. Got ".&$ShowCurToken."\n";
			};

            $act=   exists($$actions{ACTIONS}{$$token})
                    ?   $$actions{ACTIONS}{$$token}
                    :   exists($$actions{DEFAULT})
                        ?   $$actions{DEFAULT}
                        :   undef;
        }
        else {
            $act=$$actions{DEFAULT};
#DBG>			$debug & 0x01
#DBG>		and	print STDERR "Don't need token.\n";
        }

            defined($act)
        and do {

                $act > 0
            and do {        #shift

#DBG>				$debug & 0x04
#DBG>			and	print STDERR "Shift and go to state $act.\n";

					$$errstatus
				and	do {
					--$$errstatus;

#DBG>					$debug & 0x10
#DBG>				and	$dbgerror
#DBG>				and	$$errstatus == 0
#DBG>				and	do {
#DBG>					print STDERR "**End of Error recovery.\n";
#DBG>					$dbgerror=0;
#DBG>				};
				};


                push(@$stack,[ $act, $$value ]);

					$$token ne ''	#Don't eat the eof
				and	$$token=$$value=undef;
                next;
            };

            #reduce
            my($lhs,$len,$code,@sempar,$semval);
            ($lhs,$len,$code)=@{$$rules[-$act]};

#DBG>			$debug & 0x04
#DBG>		and	$act
#DBG>		and	print STDERR "Reduce using rule ".-$act." ($lhs,$len): ";

                $act
            or  $self->YYAccept();

            $$dotpos=$len;

                unpack('A1',$lhs) eq '@'    #In line rule
            and do {
                    $lhs =~ /^\@[0-9]+\-([0-9]+)$/
                or  die "In line rule name '$lhs' ill formed: ".
                        "report it as a BUG.\n";
                $$dotpos = $1;
            };

            @sempar =       $$dotpos
                        ?   map { $$_[1] } @$stack[ -$$dotpos .. -1 ]
                        :   ();

            $semval = $code ? &$code( $self, @sempar )
                            : @sempar ? $sempar[0] : undef;

            splice(@$stack,-$len,$len);

                $$check eq 'ACCEPT'
            and do {

#DBG>			$debug & 0x04
#DBG>		and	print STDERR "Accept.\n";

				return($semval);
			};

                $$check eq 'ABORT'
            and	do {

#DBG>			$debug & 0x04
#DBG>		and	print STDERR "Abort.\n";

				return(undef);

			};

#DBG>			$debug & 0x04
#DBG>		and	print STDERR "Back to state $$stack[-1][0], then ";

                $$check eq 'ERROR'
            or  do {
#DBG>				$debug & 0x04
#DBG>			and	print STDERR 
#DBG>				    "go to state $$states[$$stack[-1][0]]{GOTOS}{$lhs}.\n";

#DBG>				$debug & 0x10
#DBG>			and	$dbgerror
#DBG>			and	$$errstatus == 0
#DBG>			and	do {
#DBG>				print STDERR "**End of Error recovery.\n";
#DBG>				$dbgerror=0;
#DBG>			};

			    push(@$stack,
                     [ $$states[$$stack[-1][0]]{GOTOS}{$lhs}, $semval ]);
                $$check='';
                next;
            };

#DBG>			$debug & 0x04
#DBG>		and	print STDERR "Forced Error recovery.\n";

            $$check='';

        };

        #Error
            $$errstatus
        or   do {

            $$errstatus = 1;
            &$error($self);
                $$errstatus # if 0, then YYErrok has been called
            or  next;       # so continue parsing

#DBG>			$debug & 0x10
#DBG>		and	do {
#DBG>			print STDERR "**Entering Error recovery.\n";
#DBG>			++$dbgerror;
#DBG>		};

            ++$$nberror;

        };

			$$errstatus == 3	#The next token is not valid: discard it
		and	do {
				$$token eq ''	# End of input: no hope
			and	do {
#DBG>				$debug & 0x10
#DBG>			and	print STDERR "**At eof: aborting.\n";
				return(undef);
			};

#DBG>			$debug & 0x10
#DBG>		and	print STDERR "**Dicard invalid token ".&$ShowCurToken.".\n";

			$$token=$$value=undef;
		};

        $$errstatus=3;

		while(	  @$stack
			  and (		not exists($$states[$$stack[-1][0]]{ACTIONS})
			        or  not exists($$states[$$stack[-1][0]]{ACTIONS}{error})
					or	$$states[$$stack[-1][0]]{ACTIONS}{error} <= 0)) {

#DBG>			$debug & 0x10
#DBG>		and	print STDERR "**Pop state $$stack[-1][0].\n";

			pop(@$stack);
		}

			@$stack
		or	do {

#DBG>			$debug & 0x10
#DBG>		and	print STDERR "**No state left on stack: aborting.\n";

			return(undef);
		};

		#shift the error token

#DBG>			$debug & 0x10
#DBG>		and	print STDERR "**Shift \$error token and go to state ".
#DBG>						 $$states[$$stack[-1][0]]{ACTIONS}{error}.
#DBG>						 ".\n";

		push(@$stack, [ $$states[$$stack[-1][0]]{ACTIONS}{error}, undef ]);

    }

    #never reached
	croak("Error in driver logic. Please, report it as a BUG");

}#_Parse
#DO NOT remove comment

1;

}
#End of include--------------------------------------------------




sub new {
        my($class)=shift;
        ref($class)
    and $class=ref($class);

    my($self)=$class->SUPER::new( yyversion => '1.05',
                                  yystates =>
[
	{#State 0
		ACTIONS => {
			'tag_else' => 8,
			"<#" => 9,
			'variable_verbatim' => 12,
			'string' => 7,
			"\${" => 16
		},
		GOTOS => {
			'tag_assign' => 2,
			'tag_ftl' => 1,
			'content_item' => 4,
			'variable' => 3,
			'tmp_tag_condition' => 13,
			'tag_list' => 5,
			'tag_if' => 14,
			'content' => 6,
			'tag_open_start' => 15,
			'tag' => 10,
			'tag_comment' => 11
		}
	},
	{#State 1
		DEFAULT => -12
	},
	{#State 2
		DEFAULT => -7
	},
	{#State 3
		DEFAULT => -4
	},
	{#State 4
		ACTIONS => {
			'variable_verbatim' => 12,
			'string' => 7,
			'tag_else' => 8,
			"<#" => 9,
			"\${" => 16
		},
		DEFAULT => -1,
		GOTOS => {
			'tag_assign' => 2,
			'tag_ftl' => 1,
			'content_item' => 4,
			'variable' => 3,
			'tmp_tag_condition' => 13,
			'tag_list' => 5,
			'tag_if' => 14,
			'content' => 17,
			'tag_open_start' => 15,
			'tag' => 10,
			'tag_comment' => 11
		}
	},
	{#State 5
		DEFAULT => -8
	},
	{#State 6
		ACTIONS => {
			'' => 18
		}
	},
	{#State 7
		DEFAULT => -6
	},
	{#State 8
		DEFAULT => -10
	},
	{#State 9
		DEFAULT => -107
	},
	{#State 10
		DEFAULT => -3
	},
	{#State 11
		DEFAULT => -13
	},
	{#State 12
		DEFAULT => -5
	},
	{#State 13
		DEFAULT => -11
	},
	{#State 14
		DEFAULT => -9
	},
	{#State 15
		ACTIONS => {
			"if" => 20,
			"list" => 24,
			"ftl" => 22,
			"assign" => 25,
			"_if_" => 19,
			"--" => 21
		},
		GOTOS => {
			'directive_assign' => 23
		}
	},
	{#State 16
		DEFAULT => -141,
		GOTOS => {
			'@17-1' => 26
		}
	},
	{#State 17
		DEFAULT => -2
	},
	{#State 18
		DEFAULT => 0
	},
	{#State 19
		DEFAULT => -128,
		GOTOS => {
			'@12-2' => 27
		}
	},
	{#State 20
		DEFAULT => -125,
		GOTOS => {
			'@10-2' => 28
		}
	},
	{#State 21
		DEFAULT => -139,
		GOTOS => {
			'@16-2' => 29
		}
	},
	{#State 22
		DEFAULT => -133,
		GOTOS => {
			'@14-2' => 30
		}
	},
	{#State 23
		ACTIONS => {
			'VAR' => 33
		},
		GOTOS => {
			'expr_assignments' => 32,
			'expr_assignment' => 31
		}
	},
	{#State 24
		DEFAULT => -121,
		GOTOS => {
			'@7-2' => 34
		}
	},
	{#State 25
		DEFAULT => -119
	},
	{#State 26
		ACTIONS => {
			"-" => 37,
			".." => 35,
			".vars" => 47,
			"+" => 40,
			'DATA_KEY' => 39,
			"{" => 48,
			'string' => 41,
			"(" => 54,
			'VAR' => 57,
			"r" => 56,
			"false" => 58,
			"true" => 42,
			"[" => 43,
			'NUMBER' => 44
		},
		GOTOS => {
			'exp' => 45,
			'array_str' => 36,
			'hash_op' => 46,
			'array_pos' => 38,
			'type_op' => 49,
			'data' => 50,
			'func_op' => 51,
			'array_op' => 53,
			'hash' => 52,
			'string_op' => 55
		}
	},
	{#State 27
		ACTIONS => {
			"(" => 64,
			"!" => 59,
			'VAR' => 65,
			'NUMBER' => 60
		},
		GOTOS => {
			'exp_condition' => 62,
			'exp_condition_var' => 63,
			'exp_logic' => 61,
			'condition' => 66
		}
	},
	{#State 28
		ACTIONS => {
			"(" => 73,
			"!" => 68,
			'VAR' => 74,
			'NUMBER' => 70
		},
		GOTOS => {
			'exp_logic_unexpanded' => 69,
			'exp_condition_unexpanded' => 71,
			'exp_condition_var_unexpanded' => 67,
			'condition_unexpanded' => 72
		}
	},
	{#State 29
		ACTIONS => {
			'string' => 75
		}
	},
	{#State 30
		ACTIONS => {
			'VAR' => 77
		},
		GOTOS => {
			'expr_ftl_assignments' => 78,
			'expr_ftl_assignment' => 76
		}
	},
	{#State 31
		ACTIONS => {
			'VAR' => 80
		},
		DEFAULT => -104,
		GOTOS => {
			'expr_assignments' => 79,
			'expr_assignment' => 31
		}
	},
	{#State 32
		DEFAULT => -114,
		GOTOS => {
			'@4-3' => 81
		}
	},
	{#State 33
		ACTIONS => {
			"=" => 82
		},
		DEFAULT => -116,
		GOTOS => {
			'@5-3' => 83
		}
	},
	{#State 34
		ACTIONS => {
			"-" => 37,
			".." => 35,
			".vars" => 47,
			"+" => 40,
			'DATA_KEY' => 39,
			"{" => 48,
			'string' => 41,
			"(" => 54,
			'VAR' => 57,
			"r" => 56,
			"false" => 58,
			"true" => 42,
			"[" => 43,
			'NUMBER' => 44
		},
		GOTOS => {
			'exp' => 45,
			'array_str' => 36,
			'hash_op' => 46,
			'array_pos' => 38,
			'type_op' => 49,
			'data' => 84,
			'func_op' => 51,
			'array_op' => 53,
			'hash' => 52,
			'string_op' => 55
		}
	},
	{#State 35
		ACTIONS => {
			'DATA_KEY' => 86,
			'NUMBER' => 87
		},
		GOTOS => {
			'array_pos' => 85
		}
	},
	{#State 36
		DEFAULT => -198
	},
	{#State 37
		ACTIONS => {
			"-" => 37,
			'VAR' => 57,
			"+" => 40,
			"false" => 58,
			"true" => 42,
			'NUMBER' => 88
		},
		GOTOS => {
			'exp' => 89
		}
	},
	{#State 38
		ACTIONS => {
			".." => 90
		}
	},
	{#State 39
		ACTIONS => {
			".." => -202,
			"(" => 91
		},
		DEFAULT => -143
	},
	{#State 40
		ACTIONS => {
			"-" => 37,
			'VAR' => 57,
			"+" => 40,
			"false" => 58,
			"true" => 42,
			'NUMBER' => 88
		},
		GOTOS => {
			'exp' => 92
		}
	},
	{#State 41
		DEFAULT => -186
	},
	{#State 42
		DEFAULT => -22
	},
	{#State 43
		ACTIONS => {
			"-" => 37,
			"+" => 40,
			"{" => 48,
			'string' => 95,
			'VAR' => 57,
			"false" => 58,
			"true" => 42,
			"[" => 96,
			'NUMBER' => 88,
			"]" => 97
		},
		GOTOS => {
			'hash' => 52,
			'exp' => 98,
			'array_str' => 93,
			'sequence_item' => 100,
			'hash_op' => 99,
			'sequence' => 94,
			'hashes' => 101
		}
	},
	{#State 44
		ACTIONS => {
			".." => -201
		},
		DEFAULT => -19
	},
	{#State 45
		ACTIONS => {
			"-" => 102,
			"+" => 103,
			"/" => 107,
			"%" => 104,
			"^" => 105,
			"*" => 106
		},
		DEFAULT => -150
	},
	{#State 46
		ACTIONS => {
			"+" => 108
		},
		DEFAULT => -147
	},
	{#State 47
		DEFAULT => -144
	},
	{#State 48
		ACTIONS => {
			'string' => 109
		},
		GOTOS => {
			'hashvalue' => 110,
			'hashvalues' => 111
		}
	},
	{#State 49
		DEFAULT => -146
	},
	{#State 50
		ACTIONS => {
			"}" => 112,
			"!" => 114,
			"?" => 116,
			"+" => 113,
			"[" => 115,
			"." => 117
		}
	},
	{#State 51
		DEFAULT => -149
	},
	{#State 52
		DEFAULT => -192
	},
	{#State 53
		DEFAULT => -148
	},
	{#State 54
		ACTIONS => {
			"-" => 37,
			".." => 35,
			".vars" => 47,
			"+" => 40,
			'DATA_KEY' => 39,
			"{" => 48,
			'string' => 41,
			"(" => 54,
			'VAR' => 57,
			"r" => 56,
			"false" => 58,
			"true" => 42,
			"[" => 43,
			'NUMBER' => 44
		},
		GOTOS => {
			'exp' => 45,
			'array_str' => 36,
			'hash_op' => 46,
			'array_pos' => 38,
			'type_op' => 49,
			'data' => 118,
			'func_op' => 51,
			'array_op' => 53,
			'hash' => 52,
			'string_op' => 55
		}
	},
	{#State 55
		ACTIONS => {
			"+" => 119
		},
		DEFAULT => -145
	},
	{#State 56
		ACTIONS => {
			'string' => 120
		}
	},
	{#State 57
		ACTIONS => {
			"=" => 121
		},
		DEFAULT => -20
	},
	{#State 58
		DEFAULT => -23
	},
	{#State 59
		ACTIONS => {
			"(" => 64,
			"!" => 59,
			'VAR' => 65,
			'NUMBER' => 60
		},
		GOTOS => {
			'exp_condition' => 62,
			'exp_condition_var' => 63,
			'exp_logic' => 122
		}
	},
	{#State 60
		DEFAULT => -70
	},
	{#State 61
		ACTIONS => {
			"!" => 123,
			"&&" => 125,
			"||" => 124
		},
		DEFAULT => -131
	},
	{#State 62
		DEFAULT => -32
	},
	{#State 63
		ACTIONS => {
			"!=" => 129,
			"gte" => 130,
			"==" => 127,
			"lte" => 126,
			"=" => 132,
			"??" => 131,
			"gt" => 133,
			"lt" => 128
		},
		DEFAULT => -44
	},
	{#State 64
		ACTIONS => {
			"(" => 64,
			"!" => 59,
			'VAR' => 65,
			'NUMBER' => 60
		},
		GOTOS => {
			'exp_condition' => 62,
			'exp_condition_var' => 63,
			'exp_logic' => 134
		}
	},
	{#State 65
		ACTIONS => {
			"?" => 135
		},
		DEFAULT => -68
	},
	{#State 66
		DEFAULT => -129,
		GOTOS => {
			'@13-4' => 136
		}
	},
	{#State 67
		ACTIONS => {
			"!=" => 140,
			"gte" => 141,
			"==" => 138,
			"lte" => 137,
			"=" => 143,
			"??" => 142,
			"gt" => 144,
			"lt" => 139
		},
		DEFAULT => -56
	},
	{#State 68
		ACTIONS => {
			"(" => 73,
			"!" => 68,
			'VAR' => 74,
			'NUMBER' => 70
		},
		GOTOS => {
			'exp_logic_unexpanded' => 145,
			'exp_condition_unexpanded' => 71,
			'exp_condition_var_unexpanded' => 67
		}
	},
	{#State 69
		ACTIONS => {
			"!" => 146,
			"&&" => 148,
			"||" => 147
		},
		DEFAULT => -132
	},
	{#State 70
		DEFAULT => -73
	},
	{#State 71
		DEFAULT => -38
	},
	{#State 72
		DEFAULT => -126,
		GOTOS => {
			'@11-4' => 149
		}
	},
	{#State 73
		ACTIONS => {
			"(" => 73,
			"!" => 68,
			'VAR' => 74,
			'NUMBER' => 70
		},
		GOTOS => {
			'exp_logic_unexpanded' => 150,
			'exp_condition_unexpanded' => 71,
			'exp_condition_var_unexpanded' => 67
		}
	},
	{#State 74
		ACTIONS => {
			"?" => 151
		},
		DEFAULT => -71
	},
	{#State 75
		ACTIONS => {
			"--" => 152
		}
	},
	{#State 76
		ACTIONS => {
			'VAR' => 77
		},
		DEFAULT => -136,
		GOTOS => {
			'expr_ftl_assignments' => 153,
			'expr_ftl_assignment' => 76
		}
	},
	{#State 77
		ACTIONS => {
			"=" => 154
		}
	},
	{#State 78
		DEFAULT => -134,
		GOTOS => {
			'@15-4' => 155
		}
	},
	{#State 79
		DEFAULT => -105
	},
	{#State 80
		ACTIONS => {
			"=" => 82
		}
	},
	{#State 81
		ACTIONS => {
			">" => 157
		},
		GOTOS => {
			'tag_open_end' => 156
		}
	},
	{#State 82
		ACTIONS => {
			"-" => 37,
			".." => 35,
			".vars" => 47,
			"+" => 40,
			'DATA_KEY' => 39,
			"{" => 48,
			'string' => 41,
			"(" => 54,
			'VAR' => 57,
			"r" => 56,
			"false" => 58,
			"true" => 42,
			"[" => 43,
			'NUMBER' => 44
		},
		GOTOS => {
			'exp' => 45,
			'array_str' => 36,
			'hash_op' => 46,
			'array_pos' => 38,
			'type_op' => 49,
			'data' => 158,
			'func_op' => 51,
			'array_op' => 53,
			'hash' => 52,
			'string_op' => 55
		}
	},
	{#State 83
		ACTIONS => {
			">" => 157
		},
		GOTOS => {
			'tag_open_end' => 159
		}
	},
	{#State 84
		ACTIONS => {
			"!" => 114,
			"?" => 116,
			"+" => 113,
			"[" => 115,
			"as" => 160,
			"." => 117
		}
	},
	{#State 85
		DEFAULT => -200
	},
	{#State 86
		DEFAULT => -202
	},
	{#State 87
		DEFAULT => -201
	},
	{#State 88
		DEFAULT => -19
	},
	{#State 89
		ACTIONS => {
			"-" => 102,
			"+" => 103,
			"%" => 104,
			"^" => 105,
			"*" => 106,
			"/" => 107
		},
		DEFAULT => -28
	},
	{#State 90
		ACTIONS => {
			'DATA_KEY' => 86,
			'NUMBER' => 87
		},
		GOTOS => {
			'array_pos' => 161
		}
	},
	{#State 91
		ACTIONS => {
			'string' => 162
		}
	},
	{#State 92
		ACTIONS => {
			"-" => 102,
			"+" => 103,
			"%" => 104,
			"^" => 105,
			"*" => 106,
			"/" => 107
		},
		DEFAULT => -29
	},
	{#State 93
		DEFAULT => -96
	},
	{#State 94
		ACTIONS => {
			"]" => 163
		}
	},
	{#State 95
		DEFAULT => -98
	},
	{#State 96
		ACTIONS => {
			"-" => 37,
			"+" => 40,
			'string' => 95,
			'VAR' => 57,
			"false" => 58,
			"true" => 42,
			"[" => 96,
			'NUMBER' => 88,
			"]" => 97
		},
		GOTOS => {
			'exp' => 98,
			'array_str' => 93,
			'sequence_item' => 100,
			'sequence' => 94
		}
	},
	{#State 97
		DEFAULT => -101
	},
	{#State 98
		ACTIONS => {
			"-" => 102,
			"+" => 103,
			"/" => 107,
			"%" => 104,
			"^" => 105,
			"*" => 106
		},
		DEFAULT => -97
	},
	{#State 99
		ACTIONS => {
			"+" => 108
		},
		DEFAULT => -190
	},
	{#State 100
		ACTIONS => {
			"," => 164
		},
		DEFAULT => -99
	},
	{#State 101
		ACTIONS => {
			"," => 165,
			"]" => 166
		}
	},
	{#State 102
		ACTIONS => {
			"-" => 37,
			'VAR' => 57,
			"+" => 40,
			"false" => 58,
			"true" => 42,
			'NUMBER' => 88
		},
		GOTOS => {
			'exp' => 167
		}
	},
	{#State 103
		ACTIONS => {
			"-" => 37,
			'VAR' => 57,
			"+" => 40,
			"false" => 58,
			"true" => 42,
			'NUMBER' => 88
		},
		GOTOS => {
			'exp' => 168
		}
	},
	{#State 104
		ACTIONS => {
			"-" => 37,
			'VAR' => 57,
			"+" => 40,
			"false" => 58,
			"true" => 42,
			'NUMBER' => 88
		},
		GOTOS => {
			'exp' => 169
		}
	},
	{#State 105
		ACTIONS => {
			"-" => 37,
			'VAR' => 57,
			"+" => 40,
			"false" => 58,
			"true" => 42,
			'NUMBER' => 88
		},
		GOTOS => {
			'exp' => 170
		}
	},
	{#State 106
		ACTIONS => {
			"-" => 37,
			'VAR' => 57,
			"+" => 40,
			"false" => 58,
			"true" => 42,
			'NUMBER' => 88
		},
		GOTOS => {
			'exp' => 171
		}
	},
	{#State 107
		ACTIONS => {
			"-" => 37,
			'VAR' => 57,
			"+" => 40,
			"false" => 58,
			"true" => 42,
			'NUMBER' => 88
		},
		GOTOS => {
			'exp' => 172
		}
	},
	{#State 108
		ACTIONS => {
			"{" => 48
		},
		GOTOS => {
			'hash' => 173
		}
	},
	{#State 109
		ACTIONS => {
			":" => 174
		}
	},
	{#State 110
		DEFAULT => -195
	},
	{#State 111
		ACTIONS => {
			"}" => 175,
			"," => 176
		}
	},
	{#State 112
		DEFAULT => -142
	},
	{#State 113
		ACTIONS => {
			"-" => 37,
			".." => 35,
			".vars" => 47,
			"+" => 40,
			'DATA_KEY' => 39,
			"{" => 48,
			'string' => 41,
			"(" => 54,
			'VAR' => 57,
			"r" => 56,
			"false" => 58,
			"true" => 42,
			"[" => 43,
			'NUMBER' => 44
		},
		GOTOS => {
			'exp' => 45,
			'array_str' => 36,
			'hash_op' => 46,
			'array_pos' => 38,
			'type_op' => 49,
			'data' => 177,
			'func_op' => 51,
			'array_op' => 53,
			'hash' => 52,
			'string_op' => 55
		}
	},
	{#State 114
		ACTIONS => {
			"-" => 37,
			".." => 35,
			".vars" => 47,
			"+" => 40,
			'DATA_KEY' => 39,
			"{" => 48,
			'string' => 41,
			"(" => 54,
			'VAR' => 57,
			"r" => 56,
			"false" => 58,
			"true" => 42,
			"[" => 43,
			'NUMBER' => 44
		},
		GOTOS => {
			'exp' => 45,
			'array_str' => 36,
			'hash_op' => 46,
			'array_pos' => 38,
			'type_op' => 49,
			'data' => 178,
			'func_op' => 51,
			'array_op' => 53,
			'hash' => 52,
			'string_op' => 55
		}
	},
	{#State 115
		ACTIONS => {
			".." => 179,
			"-" => 37,
			'DATA_KEY' => 181,
			"+" => 40,
			'string' => 182,
			'VAR' => 57,
			"false" => 58,
			"true" => 42,
			'NUMBER' => 44,
			"]" => 183
		},
		GOTOS => {
			'exp' => 184,
			'array_pos' => 180
		}
	},
	{#State 116
		ACTIONS => {
			"sort" => 186,
			"reverse" => 185,
			"xhtml" => 187,
			"replace" => 190,
			"string" => 189,
			"upper_case" => 188,
			"length" => 191,
			"eval" => 192,
			"seq_contains" => 193,
			"lower_case" => 194,
			"html" => 195,
			"substring" => 196,
			"join" => 197,
			"uncap_first" => 198,
			"cap_first" => 199,
			"first" => 200,
			"seq_index_of" => 202,
			"word_list" => 201,
			"sort_by" => 204,
			"last" => 203,
			"size" => 205,
			"capitalize" => 206
		}
	},
	{#State 117
		ACTIONS => {
			'DATA_KEY' => 207
		}
	},
	{#State 118
		ACTIONS => {
			"!" => 114,
			"?" => 116,
			"+" => 113,
			"[" => 115,
			"." => 117,
			")" => 208
		}
	},
	{#State 119
		ACTIONS => {
			"-" => 37,
			".." => 35,
			".vars" => 47,
			"+" => 40,
			'DATA_KEY' => 39,
			"{" => 48,
			'string' => 41,
			"(" => 54,
			'VAR' => 57,
			"r" => 56,
			"false" => 58,
			"true" => 42,
			"[" => 43,
			'NUMBER' => 44
		},
		GOTOS => {
			'exp' => 45,
			'array_str' => 36,
			'hash_op' => 46,
			'array_pos' => 38,
			'type_op' => 49,
			'data' => 209,
			'func_op' => 51,
			'array_op' => 53,
			'hash' => 52,
			'string_op' => 55
		}
	},
	{#State 120
		DEFAULT => -188
	},
	{#State 121
		ACTIONS => {
			"-" => 37,
			'VAR' => 57,
			"+" => 40,
			"false" => 58,
			"true" => 42,
			'NUMBER' => 88
		},
		GOTOS => {
			'exp' => 210
		}
	},
	{#State 122
		ACTIONS => {
			"!" => 123,
			"&&" => 125,
			"||" => 124
		},
		DEFAULT => -36
	},
	{#State 123
		ACTIONS => {
			"(" => 64,
			"!" => 59,
			'VAR' => 65,
			'NUMBER' => 60
		},
		GOTOS => {
			'exp_condition' => 62,
			'exp_condition_var' => 63,
			'exp_logic' => 211
		}
	},
	{#State 124
		ACTIONS => {
			"(" => 64,
			"!" => 59,
			'VAR' => 65,
			'NUMBER' => 60
		},
		GOTOS => {
			'exp_condition' => 62,
			'exp_condition_var' => 63,
			'exp_logic' => 212
		}
	},
	{#State 125
		ACTIONS => {
			"(" => 64,
			"!" => 59,
			'VAR' => 65,
			'NUMBER' => 60
		},
		GOTOS => {
			'exp_condition' => 62,
			'exp_condition_var' => 63,
			'exp_logic' => 213
		}
	},
	{#State 126
		ACTIONS => {
			"-" => 37,
			'VAR' => 57,
			"+" => 40,
			"false" => 58,
			"true" => 42,
			'NUMBER' => 88
		},
		GOTOS => {
			'exp' => 214
		}
	},
	{#State 127
		ACTIONS => {
			"-" => 37,
			'VAR' => 57,
			"+" => 40,
			"false" => 58,
			"true" => 42,
			'string' => 215,
			'NUMBER' => 88
		},
		GOTOS => {
			'exp' => 216
		}
	},
	{#State 128
		ACTIONS => {
			"-" => 37,
			'VAR' => 57,
			"+" => 40,
			"false" => 58,
			"true" => 42,
			'NUMBER' => 88
		},
		GOTOS => {
			'exp' => 217
		}
	},
	{#State 129
		ACTIONS => {
			"-" => 37,
			'VAR' => 57,
			"+" => 40,
			"false" => 58,
			"true" => 42,
			'string' => 218,
			'NUMBER' => 88
		},
		GOTOS => {
			'exp' => 219
		}
	},
	{#State 130
		ACTIONS => {
			"-" => 37,
			'VAR' => 57,
			"+" => 40,
			"false" => 58,
			"true" => 42,
			'NUMBER' => 88
		},
		GOTOS => {
			'exp' => 220
		}
	},
	{#State 131
		DEFAULT => -55
	},
	{#State 132
		ACTIONS => {
			"-" => 37,
			'VAR' => 57,
			"+" => 40,
			"false" => 58,
			"true" => 42,
			'string' => 221,
			'NUMBER' => 88
		},
		GOTOS => {
			'exp' => 222
		}
	},
	{#State 133
		ACTIONS => {
			"-" => 37,
			'VAR' => 57,
			"+" => 40,
			"false" => 58,
			"true" => 42,
			'NUMBER' => 88
		},
		GOTOS => {
			'exp' => 223
		}
	},
	{#State 134
		ACTIONS => {
			"!" => 123,
			"&&" => 125,
			"||" => 124,
			")" => 224
		}
	},
	{#State 135
		ACTIONS => {
			"size" => 225
		}
	},
	{#State 136
		ACTIONS => {
			">" => 157
		},
		GOTOS => {
			'tag_open_end' => 226
		}
	},
	{#State 137
		ACTIONS => {
			"-" => 37,
			'VAR' => 57,
			"+" => 40,
			"false" => 58,
			"true" => 42,
			'NUMBER' => 88
		},
		GOTOS => {
			'exp' => 227
		}
	},
	{#State 138
		ACTIONS => {
			"-" => 37,
			'VAR' => 57,
			"+" => 40,
			"false" => 58,
			"true" => 42,
			'string' => 228,
			'NUMBER' => 88
		},
		GOTOS => {
			'exp' => 229
		}
	},
	{#State 139
		ACTIONS => {
			"-" => 37,
			'VAR' => 57,
			"+" => 40,
			"false" => 58,
			"true" => 42,
			'NUMBER' => 88
		},
		GOTOS => {
			'exp' => 230
		}
	},
	{#State 140
		ACTIONS => {
			"-" => 37,
			'VAR' => 57,
			"+" => 40,
			"false" => 58,
			"true" => 42,
			'string' => 231,
			'NUMBER' => 88
		},
		GOTOS => {
			'exp' => 232
		}
	},
	{#State 141
		ACTIONS => {
			"-" => 37,
			'VAR' => 57,
			"+" => 40,
			"false" => 58,
			"true" => 42,
			'NUMBER' => 88
		},
		GOTOS => {
			'exp' => 233
		}
	},
	{#State 142
		DEFAULT => -67
	},
	{#State 143
		ACTIONS => {
			"-" => 37,
			'VAR' => 57,
			"+" => 40,
			"false" => 58,
			"true" => 42,
			'string' => 234,
			'NUMBER' => 88
		},
		GOTOS => {
			'exp' => 235
		}
	},
	{#State 144
		ACTIONS => {
			"-" => 37,
			'VAR' => 57,
			"+" => 40,
			"false" => 58,
			"true" => 42,
			'NUMBER' => 88
		},
		GOTOS => {
			'exp' => 236
		}
	},
	{#State 145
		ACTIONS => {
			"!" => 146,
			"&&" => 148,
			"||" => 147
		},
		DEFAULT => -41
	},
	{#State 146
		ACTIONS => {
			"(" => 73,
			"!" => 68,
			'VAR' => 74,
			'NUMBER' => 70
		},
		GOTOS => {
			'exp_logic_unexpanded' => 237,
			'exp_condition_unexpanded' => 71,
			'exp_condition_var_unexpanded' => 67
		}
	},
	{#State 147
		ACTIONS => {
			"(" => 73,
			"!" => 68,
			'VAR' => 74,
			'NUMBER' => 70
		},
		GOTOS => {
			'exp_logic_unexpanded' => 238,
			'exp_condition_unexpanded' => 71,
			'exp_condition_var_unexpanded' => 67
		}
	},
	{#State 148
		ACTIONS => {
			"(" => 73,
			"!" => 68,
			'VAR' => 74,
			'NUMBER' => 70
		},
		GOTOS => {
			'exp_logic_unexpanded' => 239,
			'exp_condition_unexpanded' => 71,
			'exp_condition_var_unexpanded' => 67
		}
	},
	{#State 149
		ACTIONS => {
			">" => 157
		},
		GOTOS => {
			'tag_open_end' => 240
		}
	},
	{#State 150
		ACTIONS => {
			"!" => 146,
			"&&" => 148,
			"||" => 147,
			")" => 241
		}
	},
	{#State 151
		ACTIONS => {
			"sort" => 243,
			"reverse" => 242,
			"xhtml" => 244,
			"upper_case" => 247,
			"string" => 246,
			"replace" => 245,
			"length" => 248,
			"eval" => 249,
			"seq_contains" => 250,
			"lower_case" => 251,
			"html" => 252,
			"substring" => 253,
			"join" => 254,
			"first" => 255,
			"cap_first" => 256,
			"uncap_first" => 257,
			"word_list" => 259,
			"seq_index_of" => 258,
			"sort_by" => 261,
			"last" => 260,
			"size" => 262,
			"capitalize" => 263
		},
		GOTOS => {
			'op' => 264
		}
	},
	{#State 152
		ACTIONS => {
			">" => 266
		},
		GOTOS => {
			'tag_close_end' => 265
		}
	},
	{#State 153
		DEFAULT => -137
	},
	{#State 154
		ACTIONS => {
			"-" => 37,
			".." => 35,
			".vars" => 47,
			"+" => 40,
			'DATA_KEY' => 39,
			"{" => 48,
			'string' => 41,
			"(" => 54,
			'VAR' => 57,
			"r" => 56,
			"false" => 58,
			"true" => 42,
			"[" => 43,
			'NUMBER' => 44
		},
		GOTOS => {
			'exp' => 45,
			'array_str' => 36,
			'hash_op' => 46,
			'array_pos' => 38,
			'type_op' => 49,
			'data' => 267,
			'func_op' => 51,
			'array_op' => 53,
			'hash' => 52,
			'string_op' => 55
		}
	},
	{#State 155
		ACTIONS => {
			">" => 157
		},
		GOTOS => {
			'tag_open_end' => 268
		}
	},
	{#State 156
		DEFAULT => -115
	},
	{#State 157
		DEFAULT => -108,
		GOTOS => {
			'@1-1' => 269
		}
	},
	{#State 158
		ACTIONS => {
			"!" => 114,
			"?" => 116,
			"+" => 113,
			"[" => 115,
			"." => 117
		},
		DEFAULT => -106
	},
	{#State 159
		DEFAULT => -117,
		GOTOS => {
			'@6-5' => 270
		}
	},
	{#State 160
		DEFAULT => -122,
		GOTOS => {
			'@8-5' => 271
		}
	},
	{#State 161
		DEFAULT => -199
	},
	{#State 162
		ACTIONS => {
			")" => 272
		}
	},
	{#State 163
		DEFAULT => -102
	},
	{#State 164
		ACTIONS => {
			"-" => 37,
			"+" => 40,
			'string' => 95,
			'VAR' => 57,
			"true" => 42,
			"false" => 58,
			"[" => 96,
			'NUMBER' => 88
		},
		GOTOS => {
			'exp' => 98,
			'array_str' => 93,
			'sequence_item' => 100,
			'sequence' => 274
		}
	},
	{#State 165
		ACTIONS => {
			"{" => 48
		},
		GOTOS => {
			'hash' => 52,
			'hash_op' => 275
		}
	},
	{#State 166
		DEFAULT => -197
	},
	{#State 167
		ACTIONS => {
			"%" => 104,
			"^" => 105,
			"*" => 106,
			"/" => 107
		},
		DEFAULT => -25
	},
	{#State 168
		ACTIONS => {
			"%" => 104,
			"^" => 105,
			"*" => 106,
			"/" => 107
		},
		DEFAULT => -24
	},
	{#State 169
		ACTIONS => {
			"^" => 105
		},
		DEFAULT => -31
	},
	{#State 170
		DEFAULT => -30
	},
	{#State 171
		ACTIONS => {
			"^" => 105
		},
		DEFAULT => -26
	},
	{#State 172
		ACTIONS => {
			"^" => 105
		},
		DEFAULT => -27
	},
	{#State 173
		DEFAULT => -193
	},
	{#State 174
		ACTIONS => {
			"-" => 37,
			".." => 35,
			"+" => 40,
			'DATA_KEY' => 86,
			'string' => 276,
			'VAR' => 57,
			"false" => 58,
			"true" => 42,
			"[" => 43,
			'NUMBER' => 44
		},
		GOTOS => {
			'array_op' => 279,
			'exp' => 277,
			'array_str' => 36,
			'array_pos' => 38,
			'value' => 278
		}
	},
	{#State 175
		DEFAULT => -189
	},
	{#State 176
		ACTIONS => {
			'string' => 109
		},
		GOTOS => {
			'hashvalue' => 280
		}
	},
	{#State 177
		ACTIONS => {
			"?" => 116,
			"[" => 115,
			"." => 117
		},
		DEFAULT => -153
	},
	{#State 178
		ACTIONS => {
			"?" => 116,
			"+" => 113,
			"!" => 114,
			"[" => 115,
			"." => 117
		},
		DEFAULT => -185
	},
	{#State 179
		ACTIONS => {
			'DATA_KEY' => 86,
			'NUMBER' => 87
		},
		GOTOS => {
			'array_pos' => 281
		}
	},
	{#State 180
		ACTIONS => {
			".." => 282
		}
	},
	{#State 181
		ACTIONS => {
			"]" => 283
		},
		DEFAULT => -202
	},
	{#State 182
		ACTIONS => {
			"]" => 284
		}
	},
	{#State 183
		DEFAULT => -154
	},
	{#State 184
		ACTIONS => {
			"-" => 102,
			"^" => 105,
			"*" => 106,
			"+" => 103,
			"/" => 107,
			"%" => 104,
			"]" => 285
		}
	},
	{#State 185
		DEFAULT => -167
	},
	{#State 186
		DEFAULT => -162
	},
	{#State 187
		DEFAULT => -174
	},
	{#State 188
		DEFAULT => -183
	},
	{#State 189
		ACTIONS => {
			"(" => 286
		},
		DEFAULT => -178
	},
	{#State 190
		ACTIONS => {
			"(" => 287
		}
	},
	{#State 191
		DEFAULT => -175
	},
	{#State 192
		DEFAULT => -172
	},
	{#State 193
		ACTIONS => {
			"(" => 288
		}
	},
	{#State 194
		DEFAULT => -176
	},
	{#State 195
		DEFAULT => -173
	},
	{#State 196
		ACTIONS => {
			"(" => 289
		}
	},
	{#State 197
		ACTIONS => {
			"(" => 290
		}
	},
	{#State 198
		DEFAULT => -182
	},
	{#State 199
		DEFAULT => -170
	},
	{#State 200
		DEFAULT => -169
	},
	{#State 201
		DEFAULT => -184
	},
	{#State 202
		ACTIONS => {
			"(" => 291
		}
	},
	{#State 203
		DEFAULT => -168
	},
	{#State 204
		ACTIONS => {
			"(" => 292
		}
	},
	{#State 205
		DEFAULT => -163
	},
	{#State 206
		DEFAULT => -171
	},
	{#State 207
		DEFAULT => -151
	},
	{#State 208
		DEFAULT => -152
	},
	{#State 209
		ACTIONS => {
			"?" => 116,
			"[" => 115,
			"." => 117
		},
		DEFAULT => -187
	},
	{#State 210
		DEFAULT => -21
	},
	{#State 211
		ACTIONS => {
			"!" => 123,
			"&&" => 125,
			"||" => 124
		},
		DEFAULT => -35
	},
	{#State 212
		DEFAULT => -34
	},
	{#State 213
		ACTIONS => {
			"||" => 124
		},
		DEFAULT => -33
	},
	{#State 214
		ACTIONS => {
			"-" => 102,
			"+" => 103,
			"/" => 107,
			"%" => 104,
			"^" => 105,
			"*" => 106
		},
		DEFAULT => -50
	},
	{#State 215
		DEFAULT => -48
	},
	{#State 216
		ACTIONS => {
			"-" => 102,
			"+" => 103,
			"/" => 107,
			"%" => 104,
			"^" => 105,
			"*" => 106
		},
		DEFAULT => -46
	},
	{#State 217
		ACTIONS => {
			"-" => 102,
			"+" => 103,
			"/" => 107,
			"%" => 104,
			"^" => 105,
			"*" => 106
		},
		DEFAULT => -52
	},
	{#State 218
		DEFAULT => -54
	},
	{#State 219
		ACTIONS => {
			"-" => 102,
			"+" => 103,
			"/" => 107,
			"%" => 104,
			"^" => 105,
			"*" => 106
		},
		DEFAULT => -53
	},
	{#State 220
		ACTIONS => {
			"-" => 102,
			"+" => 103,
			"/" => 107,
			"%" => 104,
			"^" => 105,
			"*" => 106
		},
		DEFAULT => -49
	},
	{#State 221
		DEFAULT => -47
	},
	{#State 222
		ACTIONS => {
			"-" => 102,
			"+" => 103,
			"/" => 107,
			"%" => 104,
			"^" => 105,
			"*" => 106
		},
		DEFAULT => -45
	},
	{#State 223
		ACTIONS => {
			"-" => 102,
			"+" => 103,
			"/" => 107,
			"%" => 104,
			"^" => 105,
			"*" => 106
		},
		DEFAULT => -51
	},
	{#State 224
		DEFAULT => -37
	},
	{#State 225
		DEFAULT => -69
	},
	{#State 226
		DEFAULT => -130
	},
	{#State 227
		ACTIONS => {
			"-" => 102,
			"+" => 103,
			"/" => 107,
			"%" => 104,
			"^" => 105,
			"*" => 106
		},
		DEFAULT => -62
	},
	{#State 228
		DEFAULT => -60
	},
	{#State 229
		ACTIONS => {
			"-" => 102,
			"+" => 103,
			"/" => 107,
			"%" => 104,
			"^" => 105,
			"*" => 106
		},
		DEFAULT => -58
	},
	{#State 230
		ACTIONS => {
			"-" => 102,
			"+" => 103,
			"/" => 107,
			"%" => 104,
			"^" => 105,
			"*" => 106
		},
		DEFAULT => -64
	},
	{#State 231
		DEFAULT => -66
	},
	{#State 232
		ACTIONS => {
			"-" => 102,
			"+" => 103,
			"/" => 107,
			"%" => 104,
			"^" => 105,
			"*" => 106
		},
		DEFAULT => -65
	},
	{#State 233
		ACTIONS => {
			"-" => 102,
			"+" => 103,
			"/" => 107,
			"%" => 104,
			"^" => 105,
			"*" => 106
		},
		DEFAULT => -61
	},
	{#State 234
		DEFAULT => -59
	},
	{#State 235
		ACTIONS => {
			"-" => 102,
			"+" => 103,
			"/" => 107,
			"%" => 104,
			"^" => 105,
			"*" => 106
		},
		DEFAULT => -57
	},
	{#State 236
		ACTIONS => {
			"-" => 102,
			"+" => 103,
			"/" => 107,
			"%" => 104,
			"^" => 105,
			"*" => 106
		},
		DEFAULT => -63
	},
	{#State 237
		ACTIONS => {
			"!" => 146,
			"&&" => 148,
			"||" => 147
		},
		DEFAULT => -42
	},
	{#State 238
		DEFAULT => -40
	},
	{#State 239
		ACTIONS => {
			"||" => 147
		},
		DEFAULT => -39
	},
	{#State 240
		ACTIONS => {
			'tag_else' => 8,
			"<#" => 9,
			'variable_verbatim' => 12,
			'string' => 7,
			"\${" => 16
		},
		GOTOS => {
			'tag_assign' => 2,
			'tag_ftl' => 1,
			'content_item' => 4,
			'variable' => 3,
			'tmp_tag_condition' => 13,
			'tag_list' => 5,
			'tag_if' => 14,
			'content' => 293,
			'tag_open_start' => 15,
			'tag' => 10,
			'tag_comment' => 11
		}
	},
	{#State 241
		DEFAULT => -43
	},
	{#State 242
		DEFAULT => -92
	},
	{#State 243
		DEFAULT => -88
	},
	{#State 244
		DEFAULT => -82
	},
	{#State 245
		DEFAULT => -79
	},
	{#State 246
		DEFAULT => -78
	},
	{#State 247
		DEFAULT => -75
	},
	{#State 248
		DEFAULT => -81
	},
	{#State 249
		DEFAULT => -84
	},
	{#State 250
		DEFAULT => -91
	},
	{#State 251
		DEFAULT => -80
	},
	{#State 252
		DEFAULT => -83
	},
	{#State 253
		DEFAULT => -77
	},
	{#State 254
		DEFAULT => -94
	},
	{#State 255
		DEFAULT => -95
	},
	{#State 256
		DEFAULT => -86
	},
	{#State 257
		DEFAULT => -76
	},
	{#State 258
		DEFAULT => -90
	},
	{#State 259
		DEFAULT => -74
	},
	{#State 260
		DEFAULT => -93
	},
	{#State 261
		DEFAULT => -87
	},
	{#State 262
		DEFAULT => -89
	},
	{#State 263
		DEFAULT => -85
	},
	{#State 264
		DEFAULT => -72
	},
	{#State 265
		DEFAULT => -140
	},
	{#State 266
		DEFAULT => -112,
		GOTOS => {
			'@3-1' => 294
		}
	},
	{#State 267
		ACTIONS => {
			"!" => 114,
			"?" => 116,
			"+" => 113,
			"[" => 115,
			"." => 117
		},
		DEFAULT => -138
	},
	{#State 268
		DEFAULT => -135
	},
	{#State 269
		DEFAULT => -109,
		GOTOS => {
			'@2-2' => 295
		}
	},
	{#State 270
		ACTIONS => {
			'tag_else' => 8,
			"<#" => 9,
			'variable_verbatim' => 12,
			'string' => 7,
			"\${" => 16
		},
		GOTOS => {
			'tag_assign' => 2,
			'tag_ftl' => 1,
			'content_item' => 4,
			'variable' => 3,
			'tmp_tag_condition' => 13,
			'tag_list' => 5,
			'tag_if' => 14,
			'content' => 296,
			'tag_open_start' => 15,
			'tag' => 10,
			'tag_comment' => 11
		}
	},
	{#State 271
		ACTIONS => {
			'string' => 297
		}
	},
	{#State 272
		DEFAULT => -203
	},
	{#State 273
		ACTIONS => {
			"[" => 96
		},
		GOTOS => {
			'array_str' => 298
		}
	},
	{#State 274
		DEFAULT => -100
	},
	{#State 275
		ACTIONS => {
			"+" => 108
		},
		DEFAULT => -191
	},
	{#State 276
		DEFAULT => -18
	},
	{#State 277
		ACTIONS => {
			"-" => 102,
			"+" => 103,
			"/" => 107,
			"%" => 104,
			"^" => 105,
			"*" => 106
		},
		DEFAULT => -17
	},
	{#State 278
		DEFAULT => -194
	},
	{#State 279
		DEFAULT => -16
	},
	{#State 280
		DEFAULT => -196
	},
	{#State 281
		ACTIONS => {
			"]" => 299
		}
	},
	{#State 282
		ACTIONS => {
			'DATA_KEY' => 86,
			"]" => 301,
			'NUMBER' => 87
		},
		GOTOS => {
			'array_pos' => 300
		}
	},
	{#State 283
		DEFAULT => -160
	},
	{#State 284
		DEFAULT => -159
	},
	{#State 285
		DEFAULT => -155
	},
	{#State 286
		ACTIONS => {
			'string' => 302
		}
	},
	{#State 287
		ACTIONS => {
			'string' => 303
		}
	},
	{#State 288
		ACTIONS => {
			"-" => 37,
			".." => 35,
			"+" => 40,
			'DATA_KEY' => 86,
			'string' => 276,
			'VAR' => 57,
			"false" => 58,
			"true" => 42,
			"[" => 43,
			'NUMBER' => 44
		},
		GOTOS => {
			'array_op' => 279,
			'exp' => 277,
			'array_str' => 36,
			'array_pos' => 38,
			'value' => 304
		}
	},
	{#State 289
		ACTIONS => {
			'NUMBER' => 305
		}
	},
	{#State 290
		ACTIONS => {
			'string' => 306
		}
	},
	{#State 291
		ACTIONS => {
			"-" => 37,
			".." => 35,
			"+" => 40,
			'DATA_KEY' => 86,
			'string' => 276,
			'VAR' => 57,
			"false" => 58,
			"true" => 42,
			"[" => 43,
			'NUMBER' => 44
		},
		GOTOS => {
			'array_op' => 279,
			'exp' => 277,
			'array_str' => 36,
			'array_pos' => 38,
			'value' => 307
		}
	},
	{#State 292
		ACTIONS => {
			"-" => 37,
			".." => 35,
			"+" => 40,
			'DATA_KEY' => 86,
			'string' => 276,
			'VAR' => 57,
			"false" => 58,
			"true" => 42,
			"[" => 43,
			'NUMBER' => 44
		},
		GOTOS => {
			'array_op' => 279,
			'exp' => 277,
			'array_str' => 36,
			'array_pos' => 38,
			'value' => 308
		}
	},
	{#State 293
		ACTIONS => {
			"</#" => 309
		},
		GOTOS => {
			'tag_close_start' => 310
		}
	},
	{#State 294
		ACTIONS => {
			"whitespace" => 312
		},
		DEFAULT => -15,
		GOTOS => {
			'whitespace' => 311
		}
	},
	{#State 295
		ACTIONS => {
			"whitespace" => 312
		},
		DEFAULT => -15,
		GOTOS => {
			'whitespace' => 313
		}
	},
	{#State 296
		ACTIONS => {
			"</#" => 309
		},
		GOTOS => {
			'tag_close_start' => 314
		}
	},
	{#State 297
		ACTIONS => {
			">" => 157
		},
		GOTOS => {
			'tag_open_end' => 315
		}
	},
	{#State 298
		DEFAULT => -103
	},
	{#State 299
		DEFAULT => -158
	},
	{#State 300
		ACTIONS => {
			"]" => 316
		}
	},
	{#State 301
		DEFAULT => -157
	},
	{#State 302
		ACTIONS => {
			"," => 317
		}
	},
	{#State 303
		ACTIONS => {
			"," => 318
		}
	},
	{#State 304
		ACTIONS => {
			")" => 319
		}
	},
	{#State 305
		ACTIONS => {
			"," => 320,
			")" => 321
		}
	},
	{#State 306
		ACTIONS => {
			")" => 322
		}
	},
	{#State 307
		ACTIONS => {
			")" => 323
		}
	},
	{#State 308
		ACTIONS => {
			")" => 324
		}
	},
	{#State 309
		DEFAULT => -111
	},
	{#State 310
		ACTIONS => {
			"if" => 325
		}
	},
	{#State 311
		DEFAULT => -113
	},
	{#State 312
		DEFAULT => -14
	},
	{#State 313
		DEFAULT => -110
	},
	{#State 314
		ACTIONS => {
			"assign" => 327
		},
		GOTOS => {
			'directive_assign_end' => 326
		}
	},
	{#State 315
		DEFAULT => -123,
		GOTOS => {
			'@9-8' => 328
		}
	},
	{#State 316
		DEFAULT => -156
	},
	{#State 317
		ACTIONS => {
			'string' => 329
		}
	},
	{#State 318
		ACTIONS => {
			'string' => 330
		}
	},
	{#State 319
		DEFAULT => -166
	},
	{#State 320
		ACTIONS => {
			'NUMBER' => 331
		}
	},
	{#State 321
		DEFAULT => -180
	},
	{#State 322
		DEFAULT => -161
	},
	{#State 323
		DEFAULT => -165
	},
	{#State 324
		DEFAULT => -164
	},
	{#State 325
		ACTIONS => {
			">" => 266
		},
		GOTOS => {
			'tag_close_end' => 332
		}
	},
	{#State 326
		ACTIONS => {
			">" => 266
		},
		GOTOS => {
			'tag_close_end' => 333
		}
	},
	{#State 327
		DEFAULT => -120
	},
	{#State 328
		ACTIONS => {
			'tag_else' => 8,
			"<#" => 9,
			'variable_verbatim' => 12,
			'string' => 7,
			"\${" => 16
		},
		GOTOS => {
			'tag_assign' => 2,
			'tag_ftl' => 1,
			'content_item' => 4,
			'variable' => 3,
			'tmp_tag_condition' => 13,
			'tag_list' => 5,
			'tag_if' => 14,
			'content' => 334,
			'tag_open_start' => 15,
			'tag' => 10,
			'tag_comment' => 11
		}
	},
	{#State 329
		ACTIONS => {
			")" => 335
		}
	},
	{#State 330
		ACTIONS => {
			")" => 336
		}
	},
	{#State 331
		ACTIONS => {
			")" => 337
		}
	},
	{#State 332
		DEFAULT => -127
	},
	{#State 333
		DEFAULT => -118
	},
	{#State 334
		ACTIONS => {
			"</#" => 309
		},
		GOTOS => {
			'tag_close_start' => 338
		}
	},
	{#State 335
		DEFAULT => -179
	},
	{#State 336
		DEFAULT => -177
	},
	{#State 337
		DEFAULT => -181
	},
	{#State 338
		ACTIONS => {
			"list" => 339
		}
	},
	{#State 339
		ACTIONS => {
			">" => 266
		},
		GOTOS => {
			'tag_close_end' => 340
		}
	},
	{#State 340
		DEFAULT => -124
	}
],
                                  yyrules  =>
[
	[#Rule 0
		 '$start', 2, undef
	],
	[#Rule 1
		 'content', 1, undef
	],
	[#Rule 2
		 'content', 2,
sub
#line 44 "FreeMarkerGrammar.yp"
{
								$_[1] = '' if !defined $_[1];
								$_[2] = '' if !defined $_[2];
								return "$_[1]$_[2]";
							}
	],
	[#Rule 3
		 'content_item', 1, undef
	],
	[#Rule 4
		 'content_item', 1, undef
	],
	[#Rule 5
		 'content_item', 1, undef
	],
	[#Rule 6
		 'content_item', 1, undef
	],
	[#Rule 7
		 'tag', 1,
sub
#line 61 "FreeMarkerGrammar.yp"
{ '' }
	],
	[#Rule 8
		 'tag', 1, undef
	],
	[#Rule 9
		 'tag', 1, undef
	],
	[#Rule 10
		 'tag', 1, undef
	],
	[#Rule 11
		 'tag', 1, undef
	],
	[#Rule 12
		 'tag', 1, undef
	],
	[#Rule 13
		 'tag', 1, undef
	],
	[#Rule 14
		 'whitespace', 1, undef
	],
	[#Rule 15
		 'whitespace', 0, undef
	],
	[#Rule 16
		 'value', 1,
sub
#line 82 "FreeMarkerGrammar.yp"
{ $_[1] }
	],
	[#Rule 17
		 'value', 1, undef
	],
	[#Rule 18
		 'value', 1,
sub
#line 87 "FreeMarkerGrammar.yp"
{ $_[1] }
	],
	[#Rule 19
		 'exp', 1, undef
	],
	[#Rule 20
		 'exp', 1,
sub
#line 93 "FreeMarkerGrammar.yp"
{ $_[0]->{_data}->{$_[1]} }
	],
	[#Rule 21
		 'exp', 3,
sub
#line 96 "FreeMarkerGrammar.yp"
{ $_[0]->{_data}->{$_[1]} = $_[3] }
	],
	[#Rule 22
		 'exp', 1,
sub
#line 99 "FreeMarkerGrammar.yp"
{ 1 }
	],
	[#Rule 23
		 'exp', 1,
sub
#line 102 "FreeMarkerGrammar.yp"
{ 0 }
	],
	[#Rule 24
		 'exp', 3,
sub
#line 104 "FreeMarkerGrammar.yp"
{ $_[1] + $_[3] }
	],
	[#Rule 25
		 'exp', 3,
sub
#line 106 "FreeMarkerGrammar.yp"
{ $_[1] - $_[3] }
	],
	[#Rule 26
		 'exp', 3,
sub
#line 108 "FreeMarkerGrammar.yp"
{ $_[1] * $_[3] }
	],
	[#Rule 27
		 'exp', 3,
sub
#line 110 "FreeMarkerGrammar.yp"
{ $_[1] / $_[3] }
	],
	[#Rule 28
		 'exp', 2,
sub
#line 112 "FreeMarkerGrammar.yp"
{ -$_[2] }
	],
	[#Rule 29
		 'exp', 2,
sub
#line 114 "FreeMarkerGrammar.yp"
{ $_[2] }
	],
	[#Rule 30
		 'exp', 3,
sub
#line 116 "FreeMarkerGrammar.yp"
{ $_[1] ** $_[3] }
	],
	[#Rule 31
		 'exp', 3,
sub
#line 120 "FreeMarkerGrammar.yp"
{ $_[1] % $_[3] }
	],
	[#Rule 32
		 'exp_logic', 1, undef
	],
	[#Rule 33
		 'exp_logic', 3,
sub
#line 126 "FreeMarkerGrammar.yp"
{ $_[1] && $_[3] }
	],
	[#Rule 34
		 'exp_logic', 3,
sub
#line 129 "FreeMarkerGrammar.yp"
{ $_[1] || $_[3] }
	],
	[#Rule 35
		 'exp_logic', 3,
sub
#line 132 "FreeMarkerGrammar.yp"
{ $_[1] && !$_[3] }
	],
	[#Rule 36
		 'exp_logic', 2,
sub
#line 135 "FreeMarkerGrammar.yp"
{ !$_[2] }
	],
	[#Rule 37
		 'exp_logic', 3,
sub
#line 138 "FreeMarkerGrammar.yp"
{ $_[2] }
	],
	[#Rule 38
		 'exp_logic_unexpanded', 1, undef
	],
	[#Rule 39
		 'exp_logic_unexpanded', 3,
sub
#line 144 "FreeMarkerGrammar.yp"
{ "$_[1] && $_[3]" }
	],
	[#Rule 40
		 'exp_logic_unexpanded', 3,
sub
#line 147 "FreeMarkerGrammar.yp"
{ "$_[1] || $_[3]" }
	],
	[#Rule 41
		 'exp_logic_unexpanded', 2,
sub
#line 150 "FreeMarkerGrammar.yp"
{ "!$_[2]" }
	],
	[#Rule 42
		 'exp_logic_unexpanded', 3,
sub
#line 153 "FreeMarkerGrammar.yp"
{ "$_[1] && !$_[3]" }
	],
	[#Rule 43
		 'exp_logic_unexpanded', 3,
sub
#line 156 "FreeMarkerGrammar.yp"
{ "($_[2])" }
	],
	[#Rule 44
		 'exp_condition', 1,
sub
#line 160 "FreeMarkerGrammar.yp"
{ $_[1] }
	],
	[#Rule 45
		 'exp_condition', 3,
sub
#line 163 "FreeMarkerGrammar.yp"
{ return 0 if !defined $_[1]; $_[1] == $_[3] }
	],
	[#Rule 46
		 'exp_condition', 3,
sub
#line 166 "FreeMarkerGrammar.yp"
{ return 0 if !defined $_[1]; $_[1] == $_[3] }
	],
	[#Rule 47
		 'exp_condition', 3,
sub
#line 169 "FreeMarkerGrammar.yp"
{ return 0 if !defined $_[1]; $_[1] eq _unquote($_[3]) }
	],
	[#Rule 48
		 'exp_condition', 3,
sub
#line 172 "FreeMarkerGrammar.yp"
{ return 0 if !defined $_[1]; $_[1] eq _unquote($_[3]) }
	],
	[#Rule 49
		 'exp_condition', 3,
sub
#line 175 "FreeMarkerGrammar.yp"
{ return 0 if !defined $_[1]; $_[1] >= $_[3] }
	],
	[#Rule 50
		 'exp_condition', 3,
sub
#line 178 "FreeMarkerGrammar.yp"
{ return 0 if !defined $_[1]; $_[1] <= $_[3] }
	],
	[#Rule 51
		 'exp_condition', 3,
sub
#line 181 "FreeMarkerGrammar.yp"
{ return 0 if !defined $_[1]; $_[1] > $_[3] }
	],
	[#Rule 52
		 'exp_condition', 3,
sub
#line 184 "FreeMarkerGrammar.yp"
{ return 0 if !defined $_[1]; $_[1] < $_[3] }
	],
	[#Rule 53
		 'exp_condition', 3,
sub
#line 187 "FreeMarkerGrammar.yp"
{ return 0 if !defined $_[1]; $_[1] != $_[3] }
	],
	[#Rule 54
		 'exp_condition', 3,
sub
#line 190 "FreeMarkerGrammar.yp"
{ return 0 if !defined $_[1]; $_[1] ne _unquote($_[3]) }
	],
	[#Rule 55
		 'exp_condition', 2,
sub
#line 193 "FreeMarkerGrammar.yp"
{ defined $_[1] }
	],
	[#Rule 56
		 'exp_condition_unexpanded', 1,
sub
#line 196 "FreeMarkerGrammar.yp"
{ "$_[1]" }
	],
	[#Rule 57
		 'exp_condition_unexpanded', 3,
sub
#line 199 "FreeMarkerGrammar.yp"
{
								if (_isNumber($_[3])) {
									return "$_[1] == $_[3]";
								} else {
									return "$_[1] == '$_[3]'";
								}
							}
	],
	[#Rule 58
		 'exp_condition_unexpanded', 3,
sub
#line 208 "FreeMarkerGrammar.yp"
{
								if (_isNumber($_[3])) {
									return "$_[1] == $_[3]";
								} else {
									return "$_[1] == '$_[3]'";
								}
							}
	],
	[#Rule 59
		 'exp_condition_unexpanded', 3,
sub
#line 217 "FreeMarkerGrammar.yp"
{ "$_[1] = $_[3]" }
	],
	[#Rule 60
		 'exp_condition_unexpanded', 3,
sub
#line 220 "FreeMarkerGrammar.yp"
{ "$_[1] == $_[3]" }
	],
	[#Rule 61
		 'exp_condition_unexpanded', 3,
sub
#line 223 "FreeMarkerGrammar.yp"
{ "$_[1] gte $_[3]" }
	],
	[#Rule 62
		 'exp_condition_unexpanded', 3,
sub
#line 226 "FreeMarkerGrammar.yp"
{ "$_[1] lte $_[3]" }
	],
	[#Rule 63
		 'exp_condition_unexpanded', 3,
sub
#line 229 "FreeMarkerGrammar.yp"
{ "$_[1] gt $_[3]" }
	],
	[#Rule 64
		 'exp_condition_unexpanded', 3,
sub
#line 232 "FreeMarkerGrammar.yp"
{ "$_[1] lt $_[3]" }
	],
	[#Rule 65
		 'exp_condition_unexpanded', 3,
sub
#line 235 "FreeMarkerGrammar.yp"
{
								if (_isNumber($_[3])) {
									return "$_[1] != $_[3]";
								} else {
									return "$_[1] != '$_[3]'";
								}
							}
	],
	[#Rule 66
		 'exp_condition_unexpanded', 3,
sub
#line 244 "FreeMarkerGrammar.yp"
{ "$_[1] != $_[3]" }
	],
	[#Rule 67
		 'exp_condition_unexpanded', 2,
sub
#line 247 "FreeMarkerGrammar.yp"
{ "$_[1]??" }
	],
	[#Rule 68
		 'exp_condition_var', 1,
sub
#line 250 "FreeMarkerGrammar.yp"
{ $_[0]->_value($_[1], 0) }
	],
	[#Rule 69
		 'exp_condition_var', 3,
sub
#line 253 "FreeMarkerGrammar.yp"
{ scalar @{ $_[0]->_value($_[1]) } }
	],
	[#Rule 70
		 'exp_condition_var', 1, undef
	],
	[#Rule 71
		 'exp_condition_var_unexpanded', 1,
sub
#line 260 "FreeMarkerGrammar.yp"
{ "$_[1]" }
	],
	[#Rule 72
		 'exp_condition_var_unexpanded', 3,
sub
#line 263 "FreeMarkerGrammar.yp"
{ "$_[1]?$_[3]" }
	],
	[#Rule 73
		 'exp_condition_var_unexpanded', 1,
sub
#line 266 "FreeMarkerGrammar.yp"
{ "$_[1]" }
	],
	[#Rule 74
		 'op', 1, undef
	],
	[#Rule 75
		 'op', 1, undef
	],
	[#Rule 76
		 'op', 1, undef
	],
	[#Rule 77
		 'op', 1, undef
	],
	[#Rule 78
		 'op', 1, undef
	],
	[#Rule 79
		 'op', 1, undef
	],
	[#Rule 80
		 'op', 1, undef
	],
	[#Rule 81
		 'op', 1, undef
	],
	[#Rule 82
		 'op', 1, undef
	],
	[#Rule 83
		 'op', 1, undef
	],
	[#Rule 84
		 'op', 1, undef
	],
	[#Rule 85
		 'op', 1, undef
	],
	[#Rule 86
		 'op', 1, undef
	],
	[#Rule 87
		 'op', 1, undef
	],
	[#Rule 88
		 'op', 1, undef
	],
	[#Rule 89
		 'op', 1, undef
	],
	[#Rule 90
		 'op', 1, undef
	],
	[#Rule 91
		 'op', 1, undef
	],
	[#Rule 92
		 'op', 1, undef
	],
	[#Rule 93
		 'op', 1, undef
	],
	[#Rule 94
		 'op', 1, undef
	],
	[#Rule 95
		 'op', 1, undef
	],
	[#Rule 96
		 'sequence_item', 1, undef
	],
	[#Rule 97
		 'sequence_item', 1, undef
	],
	[#Rule 98
		 'sequence_item', 1, undef
	],
	[#Rule 99
		 'sequence', 1, undef
	],
	[#Rule 100
		 'sequence', 3,
sub
#line 285 "FreeMarkerGrammar.yp"
{
								my $seq = '';
								$seq .= $_[1] if defined $_[1];
								$seq .= ', ' if defined $_[1] && defined $_[3];
								$seq .= $_[3] if defined $_[3];
								return $seq;
							}
	],
	[#Rule 101
		 'array_str', 2,
sub
#line 294 "FreeMarkerGrammar.yp"
{ '' }
	],
	[#Rule 102
		 'array_str', 3,
sub
#line 297 "FreeMarkerGrammar.yp"
{ "[$_[2]]" }
	],
	[#Rule 103
		 'array_str', 5,
sub
#line 300 "FreeMarkerGrammar.yp"
{
								(my $items = $_[5]) =~ s/^\[(.*)\]$/$1/;
								return "[$_[2], $items]";
							}
	],
	[#Rule 104
		 'expr_assignments', 1, undef
	],
	[#Rule 105
		 'expr_assignments', 2, undef
	],
	[#Rule 106
		 'expr_assignment', 3,
sub
#line 312 "FreeMarkerGrammar.yp"
{ $_[0]->{_data}->{$_[1]} = $_[3] }
	],
	[#Rule 107
		 'tag_open_start', 1,
sub
#line 317 "FreeMarkerGrammar.yp"
{ $_[0]->_pushContext('tagParams') }
	],
	[#Rule 108
		 '@1-1', 0,
sub
#line 323 "FreeMarkerGrammar.yp"
{ $_[0]->_popContext('tagParams') }
	],
	[#Rule 109
		 '@2-2', 0,
sub
#line 324 "FreeMarkerGrammar.yp"
{ $_[0]->_pushContext('whitespace') }
	],
	[#Rule 110
		 'tag_open_end', 4,
sub
#line 326 "FreeMarkerGrammar.yp"
{ $_[0]->_popContext('whitespace') }
	],
	[#Rule 111
		 'tag_close_start', 1, undef
	],
	[#Rule 112
		 '@3-1', 0,
sub
#line 332 "FreeMarkerGrammar.yp"
{ $_[0]->_pushContext('whitespace') }
	],
	[#Rule 113
		 'tag_close_end', 3,
sub
#line 334 "FreeMarkerGrammar.yp"
{ $_[0]->_popContext('whitespace') }
	],
	[#Rule 114
		 '@4-3', 0,
sub
#line 342 "FreeMarkerGrammar.yp"
{ $_[0]->_popContext('assignment') }
	],
	[#Rule 115
		 'tag_assign', 5, undef
	],
	[#Rule 116
		 '@5-3', 0,
sub
#line 348 "FreeMarkerGrammar.yp"
{ $_[0]->_popContext('assignment') }
	],
	[#Rule 117
		 '@6-5', 0,
sub
#line 350 "FreeMarkerGrammar.yp"
{ $_[0]->_pushContext( 'assign' ); }
	],
	[#Rule 118
		 'tag_assign', 10,
sub
#line 355 "FreeMarkerGrammar.yp"
{
								$_[0]->{_data}->{_unquote($_[3])} = $_[7];
								$_[0]->_popContext( 'assign' );
							}
	],
	[#Rule 119
		 'directive_assign', 1,
sub
#line 361 "FreeMarkerGrammar.yp"
{ $_[0]->_pushContext('assignment') }
	],
	[#Rule 120
		 'directive_assign_end', 1, undef
	],
	[#Rule 121
		 '@7-2', 0,
sub
#line 367 "FreeMarkerGrammar.yp"
{ $_[0]->_pushContext('listParams') }
	],
	[#Rule 122
		 '@8-5', 0,
sub
#line 370 "FreeMarkerGrammar.yp"
{ $_[0]->_popContext('listParams') }
	],
	[#Rule 123
		 '@9-8', 0,
sub
#line 373 "FreeMarkerGrammar.yp"
{ $_[0]->_pushContext( 'list' ) }
	],
	[#Rule 124
		 'tag_list', 13,
sub
#line 378 "FreeMarkerGrammar.yp"
{
								$_[0]->_popContext( 'list' );
								my $key = $_[7];
								my $format = $_[10];
								my $result = $_[0]->_renderList( $key, $_[4], $format );
								
								return $result;
							}
	],
	[#Rule 125
		 '@10-2', 0,
sub
#line 390 "FreeMarkerGrammar.yp"
{
								$_[0]->{_workingData}->{ifLevel}++;
								$_[0]->_pushContext('condition');
							}
	],
	[#Rule 126
		 '@11-4', 0,
sub
#line 395 "FreeMarkerGrammar.yp"
{
								$_[0]->_popContext('condition');
							}
	],
	[#Rule 127
		 'tag_if', 10,
sub
#line 403 "FreeMarkerGrammar.yp"
{
								$_[0]->{_workingData}->{ifLevel}--;
								$_[7] =~ s/[[:space:]]+$//s;
								my $block = "<#_if_ $_[4]>$_[7]";
								if ( $_[0]->{_workingData}->{ifLevel} == 0 ) {
									# to prevent parsing of nested if blocks first, first parse level 0, and after that nested if blocks
									return $_[0]->_parseIfBlock( $block );
								} else {
									my $ifBlock = '<#if ' . $_[4] . '>' . $_[7] . '</#if>';
									
									push (@{$_[0]->{_workingData}->{ifBlocks}}, $ifBlock); 
									my $ifBlockId = scalar @{$_[0]->{_workingData}->{ifBlocks}} - 1;
									return '___ifblock' . $ifBlockId . '___';
								}
							}
	],
	[#Rule 128
		 '@12-2', 0,
sub
#line 422 "FreeMarkerGrammar.yp"
{ $_[0]->_pushContext('condition') }
	],
	[#Rule 129
		 '@13-4', 0,
sub
#line 424 "FreeMarkerGrammar.yp"
{ $_[0]->_popContext('condition') }
	],
	[#Rule 130
		 'tmp_tag_condition', 6,
sub
#line 426 "FreeMarkerGrammar.yp"
{ return $_[4] == 1 ? 1 : 0; }
	],
	[#Rule 131
		 'condition', 1, undef
	],
	[#Rule 132
		 'condition_unexpanded', 1, undef
	],
	[#Rule 133
		 '@14-2', 0,
sub
#line 435 "FreeMarkerGrammar.yp"
{ $_[0]->_pushContext('assignment') }
	],
	[#Rule 134
		 '@15-4', 0,
sub
#line 437 "FreeMarkerGrammar.yp"
{ $_[0]->_popContext('assignment') }
	],
	[#Rule 135
		 'tag_ftl', 6,
sub
#line 439 "FreeMarkerGrammar.yp"
{ '' }
	],
	[#Rule 136
		 'expr_ftl_assignments', 1, undef
	],
	[#Rule 137
		 'expr_ftl_assignments', 2, undef
	],
	[#Rule 138
		 'expr_ftl_assignment', 3,
sub
#line 446 "FreeMarkerGrammar.yp"
{ $_[0]->{_data}->{_ftlData}->{$_[1]} = $_[3] }
	],
	[#Rule 139
		 '@16-2', 0,
sub
#line 451 "FreeMarkerGrammar.yp"
{ $_[0]->_pushContext( 'comment' ) }
	],
	[#Rule 140
		 'tag_comment', 6,
sub
#line 455 "FreeMarkerGrammar.yp"
{
								$_[0]->_popContext( 'comment' );
								$_[0]->_popContext('tagParams');
								return '';
							}
	],
	[#Rule 141
		 '@17-1', 0,
sub
#line 463 "FreeMarkerGrammar.yp"
{ $_[0]->_pushContext('variableParams') }
	],
	[#Rule 142
		 'variable', 4,
sub
#line 466 "FreeMarkerGrammar.yp"
{
								$_[0]->_popContext('variableParams');
								undef $_[0]->{_workingData}->{tmpData};
								return $_[0]->_parse( $_[3] );
							}
	],
	[#Rule 143
		 'data', 1,
sub
#line 474 "FreeMarkerGrammar.yp"
{ $_[0]->_value($_[1]) }
	],
	[#Rule 144
		 'data', 1,
sub
#line 477 "FreeMarkerGrammar.yp"
{ $_[0]->{_data} }
	],
	[#Rule 145
		 'data', 1, undef
	],
	[#Rule 146
		 'data', 1, undef
	],
	[#Rule 147
		 'data', 1, undef
	],
	[#Rule 148
		 'data', 1, undef
	],
	[#Rule 149
		 'data', 1, undef
	],
	[#Rule 150
		 'data', 1, undef
	],
	[#Rule 151
		 'type_op', 3,
sub
#line 494 "FreeMarkerGrammar.yp"
{ $_[0]->_value($_[3]) }
	],
	[#Rule 152
		 'type_op', 3,
sub
#line 497 "FreeMarkerGrammar.yp"
{ $_[2] }
	],
	[#Rule 153
		 'type_op', 3,
sub
#line 501 "FreeMarkerGrammar.yp"
{
								my @list = ( @{$_[1]}, @{$_[3]} );
								return \@list;
							}
	],
	[#Rule 154
		 'type_op', 3,
sub
#line 507 "FreeMarkerGrammar.yp"
{ undef }
	],
	[#Rule 155
		 'type_op', 4,
sub
#line 510 "FreeMarkerGrammar.yp"
{
								if ( $_[0]->_context() eq 'listParams' ) {
									my $value = $_[1]->[$_[3]];
									my @list = ($value);
									return \@list;
								} else {
									my $value = $_[1][$_[3]];
									$_[0]->{_workingData}->{tmpData} = $value;
									return $value;
								}
							}
	],
	[#Rule 156
		 'type_op', 6,
sub
#line 523 "FreeMarkerGrammar.yp"
{
								my @list;
								if ( $_[3] > $_[5] ) {
									@list = @{$_[1]}[$_[5]..$_[3]];
									@list = reverse(@list);
								} else {
									@list = @{$_[1]}[$_[3]..$_[5]];
								}
								return \@list;
							}
	],
	[#Rule 157
		 'type_op', 5,
sub
#line 535 "FreeMarkerGrammar.yp"
{
								my $maxlength = scalar @{$_[1]} - 1;
								my @list = @{$_[1]}[$_[3]..$maxlength];
								return \@list;
							}
	],
	[#Rule 158
		 'type_op', 5,
sub
#line 542 "FreeMarkerGrammar.yp"
{
								my @list = @{$_[1]}[0..$_[4]];
								return \@list;
							}
	],
	[#Rule 159
		 'type_op', 4,
sub
#line 548 "FreeMarkerGrammar.yp"
{
								my $d = $_[0]->{_workingData}->{tmpData};
								$d = $_[0]->{_data} if !defined $d;
								my $value = $d->{ _unquote( $_[3] ) };
								$_[0]->{_workingData}->{tmpData} = $value;
								my @list = ($value);
								return \@list;
							}
	],
	[#Rule 160
		 'type_op', 4,
sub
#line 558 "FreeMarkerGrammar.yp"
{
								my $d = $_[0]->{_workingData}->{tmpData};
								$d = $_[0]->{_data} if !defined $d;
								my $value = $d->{ _unquote( $_[3] ) };
								$_[0]->{_workingData}->{tmpData} = $value;
								return $value;
							}
	],
	[#Rule 161
		 'type_op', 6,
sub
#line 567 "FreeMarkerGrammar.yp"
{ join ( _unquote($_[5]), @{$_[1]} ) }
	],
	[#Rule 162
		 'type_op', 3,
sub
#line 570 "FreeMarkerGrammar.yp"
{
								my $sorted = _sort( $_[1] );
								return $sorted;
							}
	],
	[#Rule 163
		 'type_op', 3,
sub
#line 576 "FreeMarkerGrammar.yp"
{ scalar @{$_[1]} }
	],
	[#Rule 164
		 'type_op', 6,
sub
#line 579 "FreeMarkerGrammar.yp"
{
								my $key = _unquote($_[5]);								
								my $isStringSort = 1;
								for (@{$_[1]}) {
									if ( _isNumber($_->{$key}) ) {
										$isStringSort = 0;
										last;
									}
								}
								my @sorted;
								if ($isStringSort) {
									@sorted = sort { lc $$a{$key} cmp lc $$b{$key} } @{$_[1]};
								} else {
									@sorted = sort { $$a{$key} <=> $$b{$key} } @{$_[1]};
								}
								return \@sorted;
							}
	],
	[#Rule 165
		 'type_op', 6,
sub
#line 598 "FreeMarkerGrammar.yp"
{
								# differentiate between numbers and strings
								# this is not fast
								$_[0]->{_workingData}->{$_[1]}->{'seqData'} ||=
								_arrayAsHash($_[1], 1);
    							my $index =  $_[0]->{_workingData}->{$_[1]}->{'seqData'}->{ $_[5] };
    							return -1 if !defined $index;
    							return $index;
							}
	],
	[#Rule 166
		 'type_op', 6,
sub
#line 609 "FreeMarkerGrammar.yp"
{
								# differentiate between numbers and strings
								# this is not fast
								$_[0]->{_workingData}->{$_[1]}->{'seqData'} ||=
								_arrayAsHash($_[1], 1);
    							return 1 if defined $_[0]->{_workingData}->{$_[1]}->{'seqData'}->{ $_[5] };
    							return 0;
							}
	],
	[#Rule 167
		 'type_op', 3,
sub
#line 619 "FreeMarkerGrammar.yp"
{
								my @reversed = reverse @{$_[1]};
								return \@reversed;
							}
	],
	[#Rule 168
		 'type_op', 3,
sub
#line 625 "FreeMarkerGrammar.yp"
{ @{$_[1]}[-1] }
	],
	[#Rule 169
		 'type_op', 3,
sub
#line 628 "FreeMarkerGrammar.yp"
{ @{$_[1]}[0] }
	],
	[#Rule 170
		 'type_op', 3,
sub
#line 632 "FreeMarkerGrammar.yp"
{ _capfirst( $_[1] ) }
	],
	[#Rule 171
		 'type_op', 3,
sub
#line 635 "FreeMarkerGrammar.yp"
{ _capitalize( $_[1] ) }
	],
	[#Rule 172
		 'type_op', 3,
sub
#line 638 "FreeMarkerGrammar.yp"
{ $_[0]->_parse('${' . $_[1] . '}') }
	],
	[#Rule 173
		 'type_op', 3,
sub
#line 641 "FreeMarkerGrammar.yp"
{ _html($_[1]) }
	],
	[#Rule 174
		 'type_op', 3,
sub
#line 644 "FreeMarkerGrammar.yp"
{ _xhtml($_[1]) }
	],
	[#Rule 175
		 'type_op', 3,
sub
#line 647 "FreeMarkerGrammar.yp"
{ length( $_[1] ) }
	],
	[#Rule 176
		 'type_op', 3,
sub
#line 650 "FreeMarkerGrammar.yp"
{ lc $_[1] }
	],
	[#Rule 177
		 'type_op', 8,
sub
#line 653 "FreeMarkerGrammar.yp"
{ _replace( $_[1], _unquote($_[5]), _unquote($_[7]) ) }
	],
	[#Rule 178
		 'type_op', 3,
sub
#line 656 "FreeMarkerGrammar.yp"
{ $_[1] }
	],
	[#Rule 179
		 'type_op', 8,
sub
#line 659 "FreeMarkerGrammar.yp"
{ $_[1] ? _unquote($_[5]) : _unquote($_[7]) }
	],
	[#Rule 180
		 'type_op', 6,
sub
#line 662 "FreeMarkerGrammar.yp"
{ _substring( $_[1], $_[5] ) }
	],
	[#Rule 181
		 'type_op', 8,
sub
#line 665 "FreeMarkerGrammar.yp"
{ _substring( $_[1], $_[5], $_[7] ) }
	],
	[#Rule 182
		 'type_op', 3,
sub
#line 668 "FreeMarkerGrammar.yp"
{ _uncapfirst( $_[1] ) }
	],
	[#Rule 183
		 'type_op', 3,
sub
#line 671 "FreeMarkerGrammar.yp"
{ uc $_[1] }
	],
	[#Rule 184
		 'type_op', 3,
sub
#line 674 "FreeMarkerGrammar.yp"
{
								my @list = _wordlist( $_[1] );
								return \@list;
							}
	],
	[#Rule 185
		 'type_op', 3,
sub
#line 680 "FreeMarkerGrammar.yp"
{ _unquote($_[3]) }
	],
	[#Rule 186
		 'string_op', 1,
sub
#line 684 "FreeMarkerGrammar.yp"
{ _unquote( $_[1] ) }
	],
	[#Rule 187
		 'string_op', 3,
sub
#line 687 "FreeMarkerGrammar.yp"
{
								if (defined $_[3]) {
									return $_[1] . $_[3];
								} else {
									return $_[1];
								}
							}
	],
	[#Rule 188
		 'string_op', 2,
sub
#line 696 "FreeMarkerGrammar.yp"
{ _protect(_unquote( $_[2] )) }
	],
	[#Rule 189
		 'hash', 3,
sub
#line 700 "FreeMarkerGrammar.yp"
{ $_[2] }
	],
	[#Rule 190
		 'hashes', 1,
sub
#line 703 "FreeMarkerGrammar.yp"
{
								$_[0]->{_workingData}->{'hashes'} ||= ();
								push @{$_[0]->{_workingData}->{'hashes'}}, $_[1];
							}
	],
	[#Rule 191
		 'hashes', 3,
sub
#line 709 "FreeMarkerGrammar.yp"
{	
								$_[0]->{_workingData}->{'hashes'} ||= ();
								push @{$_[0]->{_workingData}->{'hashes'}}, $_[3];
							}
	],
	[#Rule 192
		 'hash_op', 1, undef
	],
	[#Rule 193
		 'hash_op', 3,
sub
#line 717 "FreeMarkerGrammar.yp"
{
								my %merged = (%{$_[1]}, %{$_[3]});
								return \%merged;
							}
	],
	[#Rule 194
		 'hashvalue', 3,
sub
#line 723 "FreeMarkerGrammar.yp"
{
								my $local = {
									_unquote($_[1]) => _unquote($_[3])
								};
								return $local;
							}
	],
	[#Rule 195
		 'hashvalues', 1, undef
	],
	[#Rule 196
		 'hashvalues', 3,
sub
#line 733 "FreeMarkerGrammar.yp"
{
								my %merged = (%{$_[1]}, %{$_[3]});
								return \%merged;
							}
	],
	[#Rule 197
		 'array_op', 3,
sub
#line 740 "FreeMarkerGrammar.yp"
{
								my @list = @{$_[0]->{_workingData}->{'hashes'}};
								undef $_[0]->{_workingData}->{'hashes'};
								return \@list;
							}
	],
	[#Rule 198
		 'array_op', 1,
sub
#line 747 "FreeMarkerGrammar.yp"
{ _toList($_[1]) }
	],
	[#Rule 199
		 'array_op', 3,
sub
#line 750 "FreeMarkerGrammar.yp"
{
								my @list;
								if ( $_[1] > $_[3] ) {
									@list = ($_[3]..$_[1]);
									@list = reverse(@list);
								} else {
									@list = ($_[1]..$_[3]);
								}
								return \@list;
							}
	],
	[#Rule 200
		 'array_op', 2,
sub
#line 762 "FreeMarkerGrammar.yp"
{
								my @list = (0..$_[2]);
								return \@list;
							}
	],
	[#Rule 201
		 'array_pos', 1, undef
	],
	[#Rule 202
		 'array_pos', 1,
sub
#line 771 "FreeMarkerGrammar.yp"
{ $_[0]->_value($_[1]) }
	],
	[#Rule 203
		 'func_op', 4,
sub
#line 775 "FreeMarkerGrammar.yp"
{
								my $function = $_[0]->_value($_[1]);
								return undef if !$function;
								my $parameters = $_[0]->_parse( $_[3] );
								
								my @params = ();
								while ($parameters =~ s/(([']+)([^']*)([']+))|((["]+)([^"]*)(["]+))/push @params,_unquote($3||$5)/ge) {}
								
								return &$function(@params);
							}
	]
],
                                  @_);
    bless($self,$class);
}

#line 786 "FreeMarkerGrammar.yp"



use strict;
use warnings;

use Text::Balanced qw (
  gen_delimited_pat
);
my $p_quotes                = gen_delimited_pat(q{'"});    # generates regex
my $PATTERN_PRESERVE_QUOTES = qr/($p_quotes)/;
my $p_number =
'(?:(?i)(?:[+-]?)(?:(?=[0123456789]|[.])(?:[0123456789]*)(?:(?:[.])(?:[0123456789]{0,}))?)(?:(?:[E])(?:(?:[+-]?)(?:[0123456789]+))|))'
  ; #created with: use Regexp::Common 'RE_ALL'; $PATTERN_NUMBER = $RE{num}{real};
my $PATTERN_NUMBER = qr/($p_number)/;

=pod

Initialization of instance variables - not in sub 'new' as this is defined by the parser compiler.

=cut

sub _init {
    my ( $this, $dataRef ) = @_;

    $this->{_context} = undef;
    @{ $this->{_context} } = ();
    $this->{_data} ||= $dataRef;

    # values set in template directive 'ftl'
    $this->{_data}->{_ftlData}                     ||= {};
    $this->{_data}->{_ftlData}->{encoding}         ||= undef;
    $this->{_data}->{_ftlData}->{strip_whitespace} ||= 1;
    $this->{_data}->{_ftlData}->{attributes}       ||= {};

    $this->{_workingData} ||= {};
    $this->{_workingData}->{tmpData}       ||= undef;
    $this->{_workingData}->{ifBlocks}      ||= ();    # array with block contents
    $this->{_workingData}->{ifLevel}       ||= 0;
    $this->{_workingData}->{inTagBrackets} ||= 0;
}

sub _parseIfBlock {
    my ( $this, $text ) = @_;

    my @items = split( /(<#_if_|<#elseif|<#else)(.*?)>(.*?)/, $text );

    # remove first item
    splice @items, 0, 1;

    my $result = '';
    while ( scalar @items ) {

        my ( $tag, $condition, $tmp, $content ) = @items[ 0, 1, 2, 3 ];
        splice @items, 0, 4;

        if ( $this->{_data}->{_ftlData}->{strip_whitespace} == 1 ) {
            _stripWhitespaceAfterTag($content);
            _stripWhitespaceBeforeTag($content);
        }

        my $resultCondition = 0;
        if ( $tag eq '<#else' ) {
            $resultCondition = 1;
        }
        elsif ( defined $condition ) {

            # remove leading and trailing spaces
            _trimSpaces($condition);

            # create a dummy tag so we can use this same parser
            $resultCondition = $this->_parse( "<#_if_ $condition >" );

        }
        if ($resultCondition) {
            $content =~
              s/___ifblock(\d+)___/$this->{_workingData}->{ifBlocks}[$1]/g;
            $result =
              $this->_parse( $content );

            last;
        }
    }

    # remove all if blocks
    $this->{_workingData}->{ifBlocks} = ()
      if $this->{_workingData}->{ifLevel} == 0;

    return $result;
}

sub _value {
    my ( $this, $key, $storeValue ) = @_;

	$storeValue = 1 if !defined $storeValue;
	
    my $value = $this->{_data}->{$key};
    if ( defined $value ) {
        if ( UNIVERSAL::isa( $value, "ARRAY" ) ) {
            $this->{_workingData}->{tmpData} = \@{$value} if $storeValue;
            return \@{$value};
        }
        else {
            $this->{_workingData}->{tmpData} = $value if $storeValue;
            return $value;
        }
    }
    my $d = $this->{_workingData}->{tmpData};
    $d                              = $this->{_data} if !defined $d;
    
    $value                          = $d->{$key};
    $this->{_workingData}->{tmpData} = $value if $storeValue;
    return $value;
}

=pod

Protects string from expansion: adds '<fmg_nop>' string before '{'.

=cut

sub _protect {
    my ($string) = @_;

    return '' if !defined $string;

    $string =~ s/\{/<fmg_nop>{/go;
    return $string;
}

=pod

_renderList( $key, \@list, $format ) -> $renderedList

=cut

sub _renderList {
    my ( $this, $key, $list, $format ) = @_;

	print STDERR "_renderList; key=$key\n"      if ( $this->{debug} || $this->{debugLevel} );
	print STDERR "list=" . Dumper($list) if ( $this->{debug} || $this->{debugLevel} );
	print STDERR "format=$format\n" if ( $this->{debug} || $this->{debugLevel} );
	
    my ( $spaceBeforeItems, $trimmedFormat, $spaceAfterEachItem ) =
      ( '', $format, '' );
	
    if ( $this->{_data}->{_ftlData}->{strip_whitespace} == 1 ) {
        ( $spaceBeforeItems, $trimmedFormat, $spaceAfterEachItem ) =
          $format =~ m/^(\s*?)(.*?)(\s*)$/s;
    }
	
    $trimmedFormat = _unquote($trimmedFormat);

    my $rendered = $spaceBeforeItems;

    foreach my $item ( @{$list} ) {
		
        # temporarily store key value in data
        $this->{_data}->{$key} = $item;

        my $parsedItem =
          $this->_parse( $trimmedFormat );

        # remove after use
        delete $this->{_data}->{$key};
		
        $rendered .= $parsedItem . $spaceAfterEachItem;
    }
    return $rendered;
}

sub _isInsideTag {
    my ($this) = @_;

    return scalar @{ $this->{_context} } > 0;
}

=pod

Takes a string and returns an array ref.

For example:
	my $str = '["whale", "Barbara", "zeppelin", "aardvark", "beetroot"]';
	my $listref = _toList($str);
	
=cut

sub _toList {
    my ($listString) = @_;

    my @list = @{ eval $listString };
    return \@list;
}

sub _pushContext {
    my ( $this, $context ) = @_;

    print STDERR "\t _pushContext:$context\n"
      if ( $this->{debug} || $this->{debugLevel} );

    push @{ $this->{_context} }, $context;
}

sub _popContext {
    my ( $this, $context ) = @_;

    print STDERR "\t _popContext:$context\n"
      if ( $this->{debug} || $this->{debugLevel} );

    if ( defined @{ $this->{_context} }[-1]
        && @{ $this->{_context} }[ $#{ $this->{_context} } ] eq $context )
    {
        pop @{ $this->{_context} };
    }
}

sub _context {
    my ($this) = @_;

    return '' if !defined $this->{_context} || !scalar @{ $this->{_context} };
    return $this->{_context}[-1];
}

# UTIL FUNCTIONS

sub _unquote {
    my ($string) = @_;

    return '' if !defined $string;

    $string =~ s/^(\"|\')(.*)(\1)$/$2/s;
    return $string;
}

# STRING OPERATIONS

sub _substring {
    my ( $str, $from, $to ) = @_;

    my $length = defined $to ? $to - $from : ( length $str ) - $from;
    return substr( $str, $from, $length );
}

sub _capfirst {
    my ($str) = @_;

    $str =~ s/^([[:space:]]*)(\w+)/$1\u$2/;
    return $str;
}

sub _capitalize {
    my ($str) = @_;

    $str =~ s/\b(\w+)\b/\u$1/g;
    return $str;
}

sub _html {
    my ($str) = @_;

    $str =~ s/&/&amp;/go;
    $str =~ s/</&lt;/go;
    $str =~ s/>/&gt;/go;
    $str =~ s/"/&quot;/go;
    return $str;
}

sub _xhtml {
    my ($str) = @_;

    $str =~ s/&/&amp;/go;
    $str =~ s/</&lt;/go;
    $str =~ s/>/&gt;/go;
    $str =~ s/"/&quot;/go;
    $str =~ s/'/&#39;/go;
    return $str;
}

sub _replace {
    my ( $str, $from, $to ) = @_;

    $str =~ s/$from/$to/g;
    return $str;
}

sub _uncapfirst {
    my ($str) = @_;

    $str =~ s/^([[:space:]]*)(\w+)/$1\l$2/;
    return $str;
}

sub _wordlist {
    my ($str) = @_;

    $str =~ s/^[[:space:]]+//so;    # trim at start
    return split( /[[:space:]]+/, $str );
}

# END STRING OPERATIONS

# LIST OPERATIONS

sub _sort {
    my ($listRef) = @_;

    my @sorted = sort { lc($a) cmp lc($b) } @{$listRef};
    return \@sorted;
}

=pod

=cut

sub _interpolateEscapes {
    my ($string) = @_;

    # escaped string: \"
    $string =~ s/\\"/"/go;

    # escaped string: \'
    $string =~ s/\\'/'/go;

    # escaped newline: \n
    $string =~ s/\\n/\n/go;

    # escaped carriage return: \r
    $string =~ s/\\r/\n/go;

    # escaped tab: \t
    $string =~ s/\\t/\t/go;

    # backspace at end of string: \b
    $string =~ s/\\b$/\b /go;

    # backspace: \b
    $string =~ s/\\b/\b/go;

    # form feed: \f
    $string =~ s/\\f/\f/go;

    # less than: \l
    $string =~ s/\\l/</go;

    # greater than: \g
    $string =~ s/\\g/>/go;

    # ampersand: \a
    $string =~ s/\\a/&/go;

    # unicode - not yet supported
    $string =~ s/\\x([0-9a-fA-FX]+)/\\x{$1}/go;

    # escaped backslash: \\
    $string =~ s/\\\\/\\/go;

    return $string;
}

=pod

=cut

sub _trimSpaces {

    #my $text = $_[0]

    $_[0] =~ s/^[[:space:]]+//so;    # trim at start
    $_[0] =~ s/[[:space:]]+$//so;    # trim at end
}

sub _isNumber {

    #my ($input) = @_;

    return !( $_[0] & ~$_[0] );
}

sub _isString {

    # my ($input) = @_;

    return ( $_[0] & ~$_[0] ) ? 1 : 0;
}

=pod

_arrayAsHash( \@array, $quoteStrings ) -> \%hash

Stores an array as hash with the array indices as values.

If $quoteStrings is set to 1, strings are quoted to tell them apart from numbers.

=cut

sub _arrayAsHash {
    my ( $list, $quoteStrings ) = @_;

    my $data  = {};
    my $index = 0;
    if ($quoteStrings) {
        for ( @{$list} ) {
            $data->{ _isString($_) ? "\"$_\"" : $_ } = $index;
            $index++;
        }
    }
    else {
        for ( @{$list} ) {
            $data->{$_} = $index;
            $index++;
        }
    }
    return $data;
}

=pod

Removes whitespace after tags.
Only if the line contains whitespace (spaces or newline).
Only strips the first newline.

=cut

sub _stripWhitespaceAfterTag {

    #my $text = $_[0]

    return ( $_[0] =~ s/^([ \t]+\r|[ \t]+\n|[ \t]+$|[\r\n]{1})//s );
}

sub _stripWhitespaceBeforeTag {

    #my $text = $_[0]

    return ( $_[0] =~ s/([ \t]+\r|[ \t]+\n|[ \t]+$|[\r\n]{1})$//s );
}

# PARSING

=pod

=cut

sub _lexer {

    #	my ( $parser ) = shift;

    return ( '', undef )
      if !defined $_[0]->YYData->{DATA} || $_[0]->YYData->{DATA} eq '';

    for ( $_[0]->YYData->{DATA} ) {

        my $isInsideTag = $_[0]->_isInsideTag();

        print STDERR "_lexer input=$_.\n" if ( $_[0]->{debug} || $_[0]->{debugLevel} );
        print STDERR "\t context=" . $_[0]->_context() . "\n"
          if ( $_[0]->{debug} || $_[0]->{debugLevel} );
        print STDERR "\t is inside tag=" . $isInsideTag . "\n"
          if ( $_[0]->{debug} || $_[0]->{debugLevel} );
        print STDERR "\t if level=" . $_[0]->{_workingData}->{ifLevel} . "\n"
          if ( $_[0]->{debug} || $_[0]->{debugLevel} );
        print STDERR "\t inTagBrackets=" . $_[0]->{_workingData}->{inTagBrackets} . "\n"
          if ( $_[0]->{debug} || $_[0]->{debugLevel} );

        if ( $_[0]->_context() eq 'whitespace' ) {
            if ( $_[0]->{_data}->{_ftlData}->{strip_whitespace} == 1 ) {
                _stripWhitespaceAfterTag($_);
            }
            return ( 'whitespace', '' );
        }

        if ( $_[0]->_context() eq 'condition' ) {
            $_ =~ s/^[ \t]*//;

            return ( 'NUMBER', $1 ) if (s/^$PATTERN_NUMBER//);
            return ( '==',     $1 ) if (s/^(\=\=)\s*//);
            return ( '==',     $1 ) if (s/^(eq)\s*//);
            return ( '&&',     $1 ) if (s/^(&&)\s*//);
            return ( '||',     $1 ) if (s/^(\|\|)\s*//);
            return ( 'gte',    $1 ) if (s/^(\>\=)\s*//);
            return ( 'gte',    $1 ) if (s/^(gte)\s*//);
            return ( 'gte',    $1 ) if (s/^(&gte;)\s*//);
            return ( 'lte',    $1 ) if (s/^(\<\=)\s*//);
            return ( 'lte',    $1 ) if (s/^(lte)\s*//);
            return ( 'lte',    $1 ) if (s/^(&lte;)\s*//);
            return ( 'gt',     $1 ) if (s/^(gt)\s*//);
            return ( 'gt',     $1 ) if (s/^(&gt;)\s*//);
            return ( 'lt',     $1 ) if (s/^(\<)\s*//);
            return ( 'lt',     $1 ) if (s/^(lt)\s*//);
            return ( 'lt',     $1 ) if (s/^(&lt;)\s*//);
            return ( '!=',     $1 ) if (s/^(\!\=)\s*//);
            return ( '!=',     $1 ) if (s/^(ne)\s*//);
            return ( '!',      $1 ) if (s/^(\!)\s*//);
            return ( '=',      $1 ) if (s/^(\=)\s*//);
            return ( '??',     $1 ) if (s/^(\?\?)\s*//);
            return ( '?',      $1 ) if (s/^(\?)\s*//);

            if (s/^(\()\s*//) {

                # make rest of condition safe: convert '>' to 'gt'
                $_ =~ s/^(.*?)\>(.*?)\)/$1gt$2)/;
                return ( '(', $1 );
            }
            return ( ')', $1 ) if (s/^(\))\s*//);
            return ( 'string', _interpolateEscapes($1) )
              if (s/^$PATTERN_PRESERVE_QUOTES//);

            # string operations
            return ( $1, $1 )
              if (
s/^\b(word_list|upper_case|uncap_first|substring|string|replace|lower_case|length|xhtml|html|eval|capitalize|cap_first)\b\s*//
              );

            # sequence operations
            return ( $1, $1 )
              if (
s/^\b(sort_by|sort|size|seq_index_of|seq_contains|reverse|last|join|first)\b\s*//
              );

            return ( 'VAR', $1 ) if (s/^(\w+)//);

           #return ( 'gt', $1 ) if (s/^(\>)\s*//); # not supported by FreeMarker
        }

        # when inside an if block:
        # go deeper with <#if...
        # go up one level with </#if>
        # ignore all other tags, these will be parsed in _parseIfBlock
        if ( $_[0]->{_workingData}->{ifLevel} != 0 ) {
            return ( '>',      '' ) if (s/^\s*>//);
            return ( '<#',     '' ) if (s/^<#(if)/$1/);
            return ( '</#',    '' ) if (s/^<\/#(if)/$1/);
            return ( 'if',     $1 ) if s/^\b(if)\b//;
            return ( 'string', $1 ) if (s/^(.*?)(<(#if|\/#if))/$2/s);
        }
        
        # delay parsing of list contents
        if ( $_[0]->_context() eq 'list' ) {
            return ( '>',      '' ) if (s/^\s*>//);
            return ( '</#',    '' ) if (s/^<\/#(list)/$1/);
            return ( 'list',     $1 ) if s/^\b(list)\b//;
            return ( 'string', $1 ) if (s/^(.*?)(<(#list|\/#list))/$2/s);
        }

        # tags

        if ( $_[0]->{_workingData}->{inTagBrackets} ) {
            return ( '--',     $1 ) if s/^(--)//;
            return ( 'assign', $1 ) if s/^\b(assign)\b//;
            return ( 'list',   $1 ) if s/^\b(list)\b//;
            return ( 'if',     $1 ) if s/^\b(if)\b//;
            return ( '_if_',   $1 ) if (s/^\b(_if_)\b//);
            return ( 'ftl',    $1 ) if (s/^\b(ftl)\b//);
        }

        if ( $_[0]->{_workingData}->{inTagBrackets} && s/^\s*>// ) {
            $_[0]->{_workingData}->{inTagBrackets} = 0;
            return ( '>', '' );
        }
        if (s/^<#//) {
            $_[0]->{_workingData}->{inTagBrackets} = 1;
            return ( '<#', '' );
        }
        if (s/^<\/#//) {
            $_[0]->{_workingData}->{inTagBrackets} = 1;
            return ( '</#', '' );
        }

        return ( 'as', $1 ) if s/^\s*\b(as)\b//;

        # variables
        if ( !$isInsideTag ) {
            return ( '${', '' ) if (s/^\$\{//);
            return ( '}',  '' ) if (s/^\}//);
        }

        if (   $_[0]->_context() eq 'tagParams'
            || $_[0]->_context() eq 'variableParams'
            || $_[0]->_context() eq 'listParams'
            || $_[0]->_context() eq 'assignment' )
        {
            $_ =~ s/^[[:space:]]*//;
            return ( 'NUMBER', $1 )
              if (s/^(\d+)(\.\.)\s*/$2/)
              ;   # with array access - prevent that first dot is seen as number
            return ( '.vars',  $1 ) if (s/^(\.vars)\s*//);
            return ( '..',     $1 ) if (s/^(\.\.)\s*//);
            return ( '.',      $1 ) if (s/^(\.)\s*//);
            return ( '+',      $1 ) if (s/^(\+)\s*//);
            return ( '-',      $1 ) if (s/^(\-)\s*//);
            return ( '*',      $1 ) if (s/^(\*)\s*//);
            return ( '/',      $1 ) if (s/^(\/)\s*//);
            return ( '%',      $1 ) if (s/^(%)\s*//);
            return ( '?',      $1 ) if (s/^(\?)\s*//);
            return ( 'true',   $1 ) if (s/^(\"*true\"*)\s*//);
            return ( 'false',  $1 ) if (s/^(\"*false\"*)\s*//);
            return ( 'NUMBER', $1 ) if (s/^$PATTERN_NUMBER//);

            # string operations
            return ( $1, $1 )
              if (
s/^(word_list|upper_case|uncap_first|substring|string|replace|lower_case|length|xhtml|html|eval|capitalize|cap_first)\s*//
              );

            # sequence operations
            return ( $1, $1 )
              if (
s/^(sort_by|sort|size|seq_index_of|seq_contains|reverse|last|join|first)\s*//
              );

            # other strings
            return ( 'string', _interpolateEscapes($1) )
              if (s/^$PATTERN_PRESERVE_QUOTES//);

            if (   $_[0]->_context() eq 'variableParams'
                || $_[0]->_context() eq 'listParams' )
            {
                return ( 'r',        $1 ) if (s/^\b(r)\b//);
                return ( '!',        $1 ) if (s/^(!)\s*//);
                return ( 'DATA_KEY', $1 ) if (s/^(\w+)//);
            }
            if ( $_[0]->_context() eq 'assignment' ) {
                return ( 'VAR', $1 ) if (s/^(\w+)//);
                return ( '=',   $1 ) if (s/^(\=)\s*//);
            }
            if ( $_[0]->_context() eq 'tagParams' ) {
                return ( 'string', $1 ) if (s/^(\w+)//);
            }
            return ( '=', $1 ) if (s/^(\=)\s*//);
            return ( '[', $1 ) if (s/^(\[)\s*//);
            return ( ']', $1 ) if (s/^(\])\s*//);
            return ( '(', $1 ) if (s/^(\()\s*//);
            return ( ')', $1 ) if (s/^(\))\s*//);
            return ( '{', $1 ) if (s/^(\{)\s*//);
            return ( '}', $1 ) if (s/^(\})//);
            return ( ':', $1 ) if (s/^(:)\s*//);
            return ( ',', $1 ) if (s/^(,)\s*//);
        }

        if ($isInsideTag) {
            return ( 'string', $1 ) if (s/^(.*?)(-->|<\#|<\/\#)/$2/s);
        }
        else {

            return ( 'string', $1 )
              if (s/^(.*?)(<#|\$\{)/$2/s);

            return ( 'string', $1 )
              if (s/^(.*)$//s);
        }
    }
}

sub _error {
    exists $_[0]->YYData->{ERRMSG}
      and do {
        print STDERR $_[0]->YYData->{ERRMSG};
        delete $_[0]->YYData->{ERRMSG};
        return;
      };
    print STDERR "Syntax error\n";
}

sub _parse {
    #my ( $this, $input ) = @_;

    return '' if !defined $_[1] || $_[1] eq '';

    print STDERR "_parse:input=$_[1]\n" if ( $_[0]->{debug} || $_[0]->{debugLevel} );

    my $parser = new Foswiki::Plugins::FreeMarkerPlugin::FreeMarkerParser();

    $parser->{debugLevel}    = $_[0]->{debugLevel};
    $parser->{debug}         = $_[0]->{debug};
    $parser->{_data}          = $_[0]->{_data};
    $parser->{_workingData}   = $_[0]->{_workingData};

    return $parser->parse( $_[1] );
}

=pod

parse ($input, \%data)  -> $result

Takes an input string and returns the parsed result.

param $input: string
param \%data: optional hash of variables that are used with variable substitution


1.	Build data model from <#...></#...> directives (tags).
	All non-scalar data is stored as references.
2.	Invoke function calls (text substitution)
3.	Substitute ${...} variables based on data model

Lingo:

With the example:
	<#assign x>hello</#assign>

assign:		directive
x:			expression (a variable)
hello:		tag content

With the example:
	<#assign x="10">

assign:		operator
x="10":		expression (assignment)


Order of variable substitution is from top to bottom, as illustrated with this example:

	${mouse!"No mouse."}
	<#assign mouse="Jerry">
	${mouse!"No mouse."}  

The output will be:

	No mouse.
	Jerry  

=cut

sub parse {
    #my ( $this, $input, $dataRef ) = @_;

    return '' if !defined $_[1] || $_[1] eq '';
    
    $_[0]->_init( $_[2] );
    $_[0]->{debug} ||= 0;
    $_[0]->{debugLevel} ||= 0;

	use Data::Dumper;
    print STDERR "parse -- input data=" . Dumper($_[0]->{_data}) . "\n" if ( $_[0]->{debug} || $_[0]->{debugLevel} );
    
    print STDERR "parse:input=$_[1]\n" if ( $_[0]->{debug} || $_[0]->{debugLevel} );

    $_[0]->YYData->{DATA} = $_[1];
    my $result = $_[0]->YYParse(
        yylex   => \&_lexer,
        yyerror => \&_error,
        yydebug => $_[0]->{debugLevel}
    );
    $result = '' if !defined $result;
	
	# remove expansion protection
    $result =~ s/<fmg_nop>//go;
    
    print STDERR "parse:result=$result\n" if ( $_[0]->{debug} || $_[0]->{debugLevel} );

    undef $_[0]->{_workingData};
    $_[0]->{data} = $_[0]->{_data};
    undef $_[0]->{_data};
    return $result;
}

=pod

setDebugLevel( $debug, $debugLevel )

=debug=: number
=debugLevel=: number

Set debugging state and the level of debug messages.

Bit Value    Outputs
0x01         Token reading (useful for Lexer debugging)
0x02         States information
0x04         Driver actions (shifts, reduces, accept...)
0x08         Parse Stack dump
0x10         Error Recovery tracing

=cut

sub setDebugLevel {
    my ( $this, $debug, $debugLevel ) = @_;

	$this->{debug} = $debug;
	$this->{debugLevel} = $debugLevel;
}


1;
