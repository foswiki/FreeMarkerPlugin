####################################################################
#
#    This file was generated using Parse::Yapp version 1.05.
#
#        Don't edit this file, use source file instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
####################################################################
package FreeMarkerGrammar;
use vars qw ( @ISA );
use strict;

@ISA= qw ( Parse::Yapp::Driver );
use Parse::Yapp::Driver;



sub new {
        my($class)=shift;
        ref($class)
    and $class=ref($class);

    my($self)=$class->SUPER::new( yyversion => '1.05',
                                  yystates =>
[
	{#State 0
		ACTIONS => {
			'tag_else' => 10,
			"<#" => 11,
			'string' => 9,
			"\${" => 14
		},
		GOTOS => {
			'tag_assign' => 2,
			'tag_ftl' => 1,
			'content_item' => 4,
			'variable' => 3,
			'tag_list' => 6,
			'tmp_tag_condition' => 5,
			'content' => 8,
			'tag_if' => 7,
			'tag_open_start' => 12,
			'tag' => 13,
			'tag_comment' => 15
		}
	},
	{#State 1
		DEFAULT => -11
	},
	{#State 2
		DEFAULT => -6
	},
	{#State 3
		DEFAULT => -4
	},
	{#State 4
		ACTIONS => {
			'tag_else' => 10,
			"<#" => 11,
			'string' => 9,
			"\${" => 14
		},
		DEFAULT => -1,
		GOTOS => {
			'tag_assign' => 2,
			'tag_ftl' => 1,
			'content_item' => 4,
			'variable' => 3,
			'tag_list' => 6,
			'tmp_tag_condition' => 5,
			'content' => 16,
			'tag_if' => 7,
			'tag_open_start' => 12,
			'tag' => 13,
			'tag_comment' => 15
		}
	},
	{#State 5
		DEFAULT => -10
	},
	{#State 6
		DEFAULT => -7
	},
	{#State 7
		DEFAULT => -8
	},
	{#State 8
		ACTIONS => {
			'' => 17
		}
	},
	{#State 9
		DEFAULT => -5
	},
	{#State 10
		DEFAULT => -9
	},
	{#State 11
		DEFAULT => -106
	},
	{#State 12
		ACTIONS => {
			"if" => 20,
			"list" => 22,
			"ftl" => 18,
			"assign" => 23,
			"_if_" => 19,
			"--" => 24
		},
		GOTOS => {
			'directive_assign' => 21
		}
	},
	{#State 13
		DEFAULT => -3
	},
	{#State 14
		DEFAULT => -140,
		GOTOS => {
			'@17-1' => 25
		}
	},
	{#State 15
		DEFAULT => -12
	},
	{#State 16
		DEFAULT => -2
	},
	{#State 17
		DEFAULT => 0
	},
	{#State 18
		DEFAULT => -132,
		GOTOS => {
			'@14-2' => 26
		}
	},
	{#State 19
		DEFAULT => -127,
		GOTOS => {
			'@12-2' => 27
		}
	},
	{#State 20
		DEFAULT => -124,
		GOTOS => {
			'@10-2' => 28
		}
	},
	{#State 21
		ACTIONS => {
			'VAR' => 31
		},
		GOTOS => {
			'expr_assignments' => 30,
			'expr_assignment' => 29
		}
	},
	{#State 22
		DEFAULT => -120,
		GOTOS => {
			'@7-2' => 32
		}
	},
	{#State 23
		DEFAULT => -118
	},
	{#State 24
		DEFAULT => -138,
		GOTOS => {
			'@16-2' => 33
		}
	},
	{#State 25
		ACTIONS => {
			"-" => 36,
			".." => 34,
			".vars" => 46,
			"+" => 39,
			'DATA_KEY' => 38,
			"{" => 47,
			'string' => 40,
			"(" => 54,
			'VAR' => 56,
			"r" => 55,
			"false" => 57,
			"true" => 41,
			"[" => 42,
			'NUMBER' => 43
		},
		GOTOS => {
			'exp' => 44,
			'array_str' => 35,
			'hash_op' => 45,
			'array_pos' => 37,
			'type_op' => 48,
			'data' => 49,
			'func_op' => 50,
			'array_op' => 52,
			'hash' => 51,
			'string_op' => 53
		}
	},
	{#State 26
		ACTIONS => {
			'VAR' => 59
		},
		GOTOS => {
			'expr_ftl_assignments' => 60,
			'expr_ftl_assignment' => 58
		}
	},
	{#State 27
		ACTIONS => {
			"(" => 66,
			"!" => 61,
			'VAR' => 67,
			'NUMBER' => 62
		},
		GOTOS => {
			'exp_condition' => 64,
			'exp_condition_var' => 65,
			'exp_logic' => 63,
			'condition' => 68
		}
	},
	{#State 28
		ACTIONS => {
			"(" => 75,
			"!" => 70,
			'VAR' => 76,
			'NUMBER' => 72
		},
		GOTOS => {
			'exp_logic_unexpanded' => 71,
			'exp_condition_unexpanded' => 73,
			'exp_condition_var_unexpanded' => 69,
			'condition_unexpanded' => 74
		}
	},
	{#State 29
		ACTIONS => {
			'VAR' => 78
		},
		DEFAULT => -103,
		GOTOS => {
			'expr_assignments' => 77,
			'expr_assignment' => 29
		}
	},
	{#State 30
		DEFAULT => -113,
		GOTOS => {
			'@4-3' => 79
		}
	},
	{#State 31
		ACTIONS => {
			"=" => 80
		},
		DEFAULT => -115,
		GOTOS => {
			'@5-3' => 81
		}
	},
	{#State 32
		ACTIONS => {
			"-" => 36,
			".." => 34,
			".vars" => 46,
			"+" => 39,
			'DATA_KEY' => 38,
			"{" => 47,
			'string' => 40,
			"(" => 54,
			'VAR' => 56,
			"r" => 55,
			"false" => 57,
			"true" => 41,
			"[" => 42,
			'NUMBER' => 43
		},
		GOTOS => {
			'exp' => 44,
			'array_str' => 35,
			'hash_op' => 45,
			'array_pos' => 37,
			'type_op' => 48,
			'data' => 82,
			'func_op' => 50,
			'array_op' => 52,
			'hash' => 51,
			'string_op' => 53
		}
	},
	{#State 33
		ACTIONS => {
			'string' => 83
		}
	},
	{#State 34
		ACTIONS => {
			'DATA_KEY' => 85,
			'NUMBER' => 86
		},
		GOTOS => {
			'array_pos' => 84
		}
	},
	{#State 35
		DEFAULT => -198
	},
	{#State 36
		ACTIONS => {
			"-" => 36,
			'VAR' => 56,
			"+" => 39,
			"false" => 57,
			"true" => 41,
			'NUMBER' => 87
		},
		GOTOS => {
			'exp' => 88
		}
	},
	{#State 37
		ACTIONS => {
			".." => 89
		}
	},
	{#State 38
		ACTIONS => {
			".." => -202,
			"(" => 90
		},
		DEFAULT => -142
	},
	{#State 39
		ACTIONS => {
			"-" => 36,
			'VAR' => 56,
			"+" => 39,
			"false" => 57,
			"true" => 41,
			'NUMBER' => 87
		},
		GOTOS => {
			'exp' => 91
		}
	},
	{#State 40
		DEFAULT => -185
	},
	{#State 41
		DEFAULT => -21
	},
	{#State 42
		ACTIONS => {
			"-" => 36,
			"+" => 39,
			"{" => 47,
			'string' => 94,
			'VAR' => 56,
			"false" => 57,
			"true" => 41,
			"[" => 95,
			'NUMBER' => 87,
			"]" => 96
		},
		GOTOS => {
			'hash' => 51,
			'exp' => 97,
			'array_str' => 92,
			'sequence_item' => 99,
			'hash_op' => 98,
			'sequence' => 93,
			'hashes' => 100
		}
	},
	{#State 43
		ACTIONS => {
			".." => -201
		},
		DEFAULT => -18
	},
	{#State 44
		ACTIONS => {
			"-" => 101,
			"+" => 102,
			"/" => 106,
			"%" => 103,
			"^" => 104,
			"*" => 105
		},
		DEFAULT => -149
	},
	{#State 45
		ACTIONS => {
			"+" => 107
		},
		DEFAULT => -146
	},
	{#State 46
		DEFAULT => -143
	},
	{#State 47
		ACTIONS => {
			'string' => 108
		},
		GOTOS => {
			'hashvalue' => 109,
			'hashvalues' => 110
		}
	},
	{#State 48
		DEFAULT => -145
	},
	{#State 49
		ACTIONS => {
			"}" => 111,
			"!" => 113,
			"?" => 115,
			"+" => 112,
			"[" => 114,
			"." => 116
		}
	},
	{#State 50
		DEFAULT => -148
	},
	{#State 51
		DEFAULT => -192
	},
	{#State 52
		DEFAULT => -147
	},
	{#State 53
		ACTIONS => {
			"+" => 117
		},
		DEFAULT => -144
	},
	{#State 54
		ACTIONS => {
			"-" => 36,
			".." => 34,
			".vars" => 46,
			"+" => 39,
			'DATA_KEY' => 38,
			"{" => 47,
			'string' => 40,
			"(" => 54,
			'VAR' => 56,
			"r" => 55,
			"false" => 57,
			"true" => 41,
			"[" => 42,
			'NUMBER' => 43
		},
		GOTOS => {
			'exp' => 44,
			'array_str' => 35,
			'hash_op' => 45,
			'array_pos' => 37,
			'type_op' => 48,
			'data' => 118,
			'func_op' => 50,
			'array_op' => 52,
			'hash' => 51,
			'string_op' => 53
		}
	},
	{#State 55
		ACTIONS => {
			'string' => 119
		}
	},
	{#State 56
		ACTIONS => {
			"=" => 120
		},
		DEFAULT => -19
	},
	{#State 57
		DEFAULT => -22
	},
	{#State 58
		ACTIONS => {
			'VAR' => 59
		},
		DEFAULT => -135,
		GOTOS => {
			'expr_ftl_assignments' => 121,
			'expr_ftl_assignment' => 58
		}
	},
	{#State 59
		ACTIONS => {
			"=" => 122
		}
	},
	{#State 60
		DEFAULT => -133,
		GOTOS => {
			'@15-4' => 123
		}
	},
	{#State 61
		ACTIONS => {
			"(" => 66,
			"!" => 61,
			'VAR' => 67,
			'NUMBER' => 62
		},
		GOTOS => {
			'exp_condition' => 64,
			'exp_condition_var' => 65,
			'exp_logic' => 124
		}
	},
	{#State 62
		DEFAULT => -69
	},
	{#State 63
		ACTIONS => {
			"!" => 125,
			"&&" => 127,
			"||" => 126
		},
		DEFAULT => -130
	},
	{#State 64
		DEFAULT => -31
	},
	{#State 65
		ACTIONS => {
			"!=" => 131,
			"gte" => 132,
			"==" => 129,
			"lte" => 128,
			"=" => 134,
			"??" => 133,
			"gt" => 135,
			"lt" => 130
		},
		DEFAULT => -43
	},
	{#State 66
		ACTIONS => {
			"(" => 66,
			"!" => 61,
			'VAR' => 67,
			'NUMBER' => 62
		},
		GOTOS => {
			'exp_condition' => 64,
			'exp_condition_var' => 65,
			'exp_logic' => 136
		}
	},
	{#State 67
		ACTIONS => {
			"?" => 137
		},
		DEFAULT => -67
	},
	{#State 68
		DEFAULT => -128,
		GOTOS => {
			'@13-4' => 138
		}
	},
	{#State 69
		ACTIONS => {
			"!=" => 142,
			"gte" => 143,
			"==" => 140,
			"lte" => 139,
			"=" => 145,
			"??" => 144,
			"gt" => 146,
			"lt" => 141
		},
		DEFAULT => -55
	},
	{#State 70
		ACTIONS => {
			"(" => 75,
			"!" => 70,
			'VAR' => 76,
			'NUMBER' => 72
		},
		GOTOS => {
			'exp_logic_unexpanded' => 147,
			'exp_condition_unexpanded' => 73,
			'exp_condition_var_unexpanded' => 69
		}
	},
	{#State 71
		ACTIONS => {
			"!" => 148,
			"&&" => 150,
			"||" => 149
		},
		DEFAULT => -131
	},
	{#State 72
		DEFAULT => -72
	},
	{#State 73
		DEFAULT => -37
	},
	{#State 74
		DEFAULT => -125,
		GOTOS => {
			'@11-4' => 151
		}
	},
	{#State 75
		ACTIONS => {
			"(" => 75,
			"!" => 70,
			'VAR' => 76,
			'NUMBER' => 72
		},
		GOTOS => {
			'exp_logic_unexpanded' => 152,
			'exp_condition_unexpanded' => 73,
			'exp_condition_var_unexpanded' => 69
		}
	},
	{#State 76
		ACTIONS => {
			"?" => 153
		},
		DEFAULT => -70
	},
	{#State 77
		DEFAULT => -104
	},
	{#State 78
		ACTIONS => {
			"=" => 80
		}
	},
	{#State 79
		ACTIONS => {
			">" => 155
		},
		GOTOS => {
			'tag_open_end' => 154
		}
	},
	{#State 80
		ACTIONS => {
			"-" => 36,
			".." => 34,
			".vars" => 46,
			"+" => 39,
			'DATA_KEY' => 38,
			"{" => 47,
			'string' => 40,
			"(" => 54,
			'VAR' => 56,
			"r" => 55,
			"false" => 57,
			"true" => 41,
			"[" => 42,
			'NUMBER' => 43
		},
		GOTOS => {
			'exp' => 44,
			'array_str' => 35,
			'hash_op' => 45,
			'array_pos' => 37,
			'type_op' => 48,
			'data' => 156,
			'func_op' => 50,
			'array_op' => 52,
			'hash' => 51,
			'string_op' => 53
		}
	},
	{#State 81
		ACTIONS => {
			">" => 155
		},
		GOTOS => {
			'tag_open_end' => 157
		}
	},
	{#State 82
		ACTIONS => {
			"!" => 113,
			"?" => 115,
			"+" => 112,
			"[" => 114,
			"as" => 158,
			"." => 116
		}
	},
	{#State 83
		ACTIONS => {
			"--" => 159
		}
	},
	{#State 84
		DEFAULT => -200
	},
	{#State 85
		DEFAULT => -202
	},
	{#State 86
		DEFAULT => -201
	},
	{#State 87
		DEFAULT => -18
	},
	{#State 88
		ACTIONS => {
			"-" => 101,
			"+" => 102,
			"%" => 103,
			"^" => 104,
			"*" => 105,
			"/" => 106
		},
		DEFAULT => -27
	},
	{#State 89
		ACTIONS => {
			'DATA_KEY' => 85,
			'NUMBER' => 86
		},
		GOTOS => {
			'array_pos' => 160
		}
	},
	{#State 90
		ACTIONS => {
			'string' => 161
		}
	},
	{#State 91
		ACTIONS => {
			"-" => 101,
			"+" => 102,
			"%" => 103,
			"^" => 104,
			"*" => 105,
			"/" => 106
		},
		DEFAULT => -28
	},
	{#State 92
		DEFAULT => -95
	},
	{#State 93
		ACTIONS => {
			"]" => 162
		}
	},
	{#State 94
		DEFAULT => -97
	},
	{#State 95
		ACTIONS => {
			"-" => 36,
			"+" => 39,
			'string' => 94,
			'VAR' => 56,
			"false" => 57,
			"true" => 41,
			"[" => 95,
			'NUMBER' => 87,
			"]" => 96
		},
		GOTOS => {
			'exp' => 97,
			'array_str' => 92,
			'sequence_item' => 99,
			'sequence' => 93
		}
	},
	{#State 96
		DEFAULT => -100
	},
	{#State 97
		ACTIONS => {
			"-" => 101,
			"+" => 102,
			"/" => 106,
			"%" => 103,
			"^" => 104,
			"*" => 105
		},
		DEFAULT => -96
	},
	{#State 98
		ACTIONS => {
			"+" => 107
		},
		DEFAULT => -190
	},
	{#State 99
		ACTIONS => {
			"," => 163
		},
		DEFAULT => -98
	},
	{#State 100
		ACTIONS => {
			"," => 164,
			"]" => 165
		}
	},
	{#State 101
		ACTIONS => {
			"-" => 36,
			'VAR' => 56,
			"+" => 39,
			"false" => 57,
			"true" => 41,
			'NUMBER' => 87
		},
		GOTOS => {
			'exp' => 166
		}
	},
	{#State 102
		ACTIONS => {
			"-" => 36,
			'VAR' => 56,
			"+" => 39,
			"false" => 57,
			"true" => 41,
			'NUMBER' => 87
		},
		GOTOS => {
			'exp' => 167
		}
	},
	{#State 103
		ACTIONS => {
			"-" => 36,
			'VAR' => 56,
			"+" => 39,
			"false" => 57,
			"true" => 41,
			'NUMBER' => 87
		},
		GOTOS => {
			'exp' => 168
		}
	},
	{#State 104
		ACTIONS => {
			"-" => 36,
			'VAR' => 56,
			"+" => 39,
			"false" => 57,
			"true" => 41,
			'NUMBER' => 87
		},
		GOTOS => {
			'exp' => 169
		}
	},
	{#State 105
		ACTIONS => {
			"-" => 36,
			'VAR' => 56,
			"+" => 39,
			"false" => 57,
			"true" => 41,
			'NUMBER' => 87
		},
		GOTOS => {
			'exp' => 170
		}
	},
	{#State 106
		ACTIONS => {
			"-" => 36,
			'VAR' => 56,
			"+" => 39,
			"false" => 57,
			"true" => 41,
			'NUMBER' => 87
		},
		GOTOS => {
			'exp' => 171
		}
	},
	{#State 107
		ACTIONS => {
			"{" => 47
		},
		GOTOS => {
			'hash' => 172
		}
	},
	{#State 108
		ACTIONS => {
			":" => 173
		}
	},
	{#State 109
		DEFAULT => -195
	},
	{#State 110
		ACTIONS => {
			"}" => 174,
			"," => 175
		}
	},
	{#State 111
		DEFAULT => -141
	},
	{#State 112
		ACTIONS => {
			"-" => 36,
			".." => 34,
			".vars" => 46,
			"+" => 39,
			'DATA_KEY' => 38,
			"{" => 47,
			'string' => 40,
			"(" => 54,
			'VAR' => 56,
			"r" => 55,
			"false" => 57,
			"true" => 41,
			"[" => 42,
			'NUMBER' => 43
		},
		GOTOS => {
			'exp' => 44,
			'array_str' => 35,
			'hash_op' => 45,
			'array_pos' => 37,
			'type_op' => 48,
			'data' => 176,
			'func_op' => 50,
			'array_op' => 52,
			'hash' => 51,
			'string_op' => 53
		}
	},
	{#State 113
		ACTIONS => {
			"-" => 36,
			".." => 34,
			".vars" => 46,
			"+" => 39,
			'DATA_KEY' => 38,
			"{" => 47,
			'string' => 40,
			"(" => 54,
			'VAR' => 56,
			"r" => 55,
			"false" => 57,
			"true" => 41,
			"[" => 42,
			'NUMBER' => 43
		},
		GOTOS => {
			'exp' => 44,
			'array_str' => 35,
			'hash_op' => 45,
			'array_pos' => 37,
			'type_op' => 48,
			'data' => 177,
			'func_op' => 50,
			'array_op' => 52,
			'hash' => 51,
			'string_op' => 53
		}
	},
	{#State 114
		ACTIONS => {
			".." => 178,
			"-" => 36,
			'DATA_KEY' => 180,
			"+" => 39,
			'string' => 181,
			'VAR' => 56,
			"false" => 57,
			"true" => 41,
			'NUMBER' => 43,
			"]" => 182
		},
		GOTOS => {
			'exp' => 183,
			'array_pos' => 179
		}
	},
	{#State 115
		ACTIONS => {
			"sort" => 185,
			"reverse" => 184,
			"xhtml" => 186,
			"replace" => 189,
			"string" => 188,
			"upper_case" => 187,
			"length" => 190,
			"eval" => 191,
			"seq_contains" => 192,
			"lower_case" => 193,
			"html" => 194,
			"substring" => 195,
			"join" => 196,
			"uncap_first" => 197,
			"cap_first" => 198,
			"first" => 199,
			"seq_index_of" => 201,
			"word_list" => 200,
			"sort_by" => 203,
			"last" => 202,
			"size" => 204,
			"capitalize" => 205
		}
	},
	{#State 116
		ACTIONS => {
			'DATA_KEY' => 206
		}
	},
	{#State 117
		ACTIONS => {
			"-" => 36,
			".." => 34,
			".vars" => 46,
			"+" => 39,
			'DATA_KEY' => 38,
			"{" => 47,
			'string' => 207,
			"(" => 54,
			'VAR' => 56,
			"r" => 55,
			"false" => 57,
			"true" => 41,
			"[" => 42,
			'NUMBER' => 43
		},
		GOTOS => {
			'exp' => 44,
			'array_str' => 35,
			'hash_op' => 45,
			'array_pos' => 37,
			'type_op' => 48,
			'data' => 208,
			'func_op' => 50,
			'array_op' => 52,
			'hash' => 51,
			'string_op' => 53
		}
	},
	{#State 118
		ACTIONS => {
			"!" => 113,
			"?" => 115,
			"+" => 112,
			"[" => 114,
			"." => 116,
			")" => 209
		}
	},
	{#State 119
		DEFAULT => -188
	},
	{#State 120
		ACTIONS => {
			"-" => 36,
			'VAR' => 56,
			"+" => 39,
			"false" => 57,
			"true" => 41,
			'NUMBER' => 87
		},
		GOTOS => {
			'exp' => 210
		}
	},
	{#State 121
		DEFAULT => -136
	},
	{#State 122
		ACTIONS => {
			"-" => 36,
			".." => 34,
			".vars" => 46,
			"+" => 39,
			'DATA_KEY' => 38,
			"{" => 47,
			'string' => 40,
			"(" => 54,
			'VAR' => 56,
			"r" => 55,
			"false" => 57,
			"true" => 41,
			"[" => 42,
			'NUMBER' => 43
		},
		GOTOS => {
			'exp' => 44,
			'array_str' => 35,
			'hash_op' => 45,
			'array_pos' => 37,
			'type_op' => 48,
			'data' => 211,
			'func_op' => 50,
			'array_op' => 52,
			'hash' => 51,
			'string_op' => 53
		}
	},
	{#State 123
		ACTIONS => {
			">" => 155
		},
		GOTOS => {
			'tag_open_end' => 212
		}
	},
	{#State 124
		ACTIONS => {
			"!" => 125,
			"&&" => 127,
			"||" => 126
		},
		DEFAULT => -35
	},
	{#State 125
		ACTIONS => {
			"(" => 66,
			"!" => 61,
			'VAR' => 67,
			'NUMBER' => 62
		},
		GOTOS => {
			'exp_condition' => 64,
			'exp_condition_var' => 65,
			'exp_logic' => 213
		}
	},
	{#State 126
		ACTIONS => {
			"(" => 66,
			"!" => 61,
			'VAR' => 67,
			'NUMBER' => 62
		},
		GOTOS => {
			'exp_condition' => 64,
			'exp_condition_var' => 65,
			'exp_logic' => 214
		}
	},
	{#State 127
		ACTIONS => {
			"(" => 66,
			"!" => 61,
			'VAR' => 67,
			'NUMBER' => 62
		},
		GOTOS => {
			'exp_condition' => 64,
			'exp_condition_var' => 65,
			'exp_logic' => 215
		}
	},
	{#State 128
		ACTIONS => {
			"-" => 36,
			'VAR' => 56,
			"+" => 39,
			"false" => 57,
			"true" => 41,
			'NUMBER' => 87
		},
		GOTOS => {
			'exp' => 216
		}
	},
	{#State 129
		ACTIONS => {
			"-" => 36,
			'VAR' => 56,
			"+" => 39,
			"false" => 57,
			"true" => 41,
			'string' => 217,
			'NUMBER' => 87
		},
		GOTOS => {
			'exp' => 218
		}
	},
	{#State 130
		ACTIONS => {
			"-" => 36,
			'VAR' => 56,
			"+" => 39,
			"false" => 57,
			"true" => 41,
			'NUMBER' => 87
		},
		GOTOS => {
			'exp' => 219
		}
	},
	{#State 131
		ACTIONS => {
			"-" => 36,
			'VAR' => 56,
			"+" => 39,
			"false" => 57,
			"true" => 41,
			'string' => 220,
			'NUMBER' => 87
		},
		GOTOS => {
			'exp' => 221
		}
	},
	{#State 132
		ACTIONS => {
			"-" => 36,
			'VAR' => 56,
			"+" => 39,
			"false" => 57,
			"true" => 41,
			'NUMBER' => 87
		},
		GOTOS => {
			'exp' => 222
		}
	},
	{#State 133
		DEFAULT => -54
	},
	{#State 134
		ACTIONS => {
			"-" => 36,
			'VAR' => 56,
			"+" => 39,
			"false" => 57,
			"true" => 41,
			'string' => 223,
			'NUMBER' => 87
		},
		GOTOS => {
			'exp' => 224
		}
	},
	{#State 135
		ACTIONS => {
			"-" => 36,
			'VAR' => 56,
			"+" => 39,
			"false" => 57,
			"true" => 41,
			'NUMBER' => 87
		},
		GOTOS => {
			'exp' => 225
		}
	},
	{#State 136
		ACTIONS => {
			"!" => 125,
			"&&" => 127,
			"||" => 126,
			")" => 226
		}
	},
	{#State 137
		ACTIONS => {
			"size" => 227
		}
	},
	{#State 138
		ACTIONS => {
			">" => 155
		},
		GOTOS => {
			'tag_open_end' => 228
		}
	},
	{#State 139
		ACTIONS => {
			"-" => 36,
			'VAR' => 56,
			"+" => 39,
			"false" => 57,
			"true" => 41,
			'NUMBER' => 87
		},
		GOTOS => {
			'exp' => 229
		}
	},
	{#State 140
		ACTIONS => {
			"-" => 36,
			'VAR' => 56,
			"+" => 39,
			"false" => 57,
			"true" => 41,
			'string' => 230,
			'NUMBER' => 87
		},
		GOTOS => {
			'exp' => 231
		}
	},
	{#State 141
		ACTIONS => {
			"-" => 36,
			'VAR' => 56,
			"+" => 39,
			"false" => 57,
			"true" => 41,
			'NUMBER' => 87
		},
		GOTOS => {
			'exp' => 232
		}
	},
	{#State 142
		ACTIONS => {
			"-" => 36,
			'VAR' => 56,
			"+" => 39,
			"false" => 57,
			"true" => 41,
			'string' => 233,
			'NUMBER' => 87
		},
		GOTOS => {
			'exp' => 234
		}
	},
	{#State 143
		ACTIONS => {
			"-" => 36,
			'VAR' => 56,
			"+" => 39,
			"false" => 57,
			"true" => 41,
			'NUMBER' => 87
		},
		GOTOS => {
			'exp' => 235
		}
	},
	{#State 144
		DEFAULT => -66
	},
	{#State 145
		ACTIONS => {
			"-" => 36,
			'VAR' => 56,
			"+" => 39,
			"false" => 57,
			"true" => 41,
			'string' => 236,
			'NUMBER' => 87
		},
		GOTOS => {
			'exp' => 237
		}
	},
	{#State 146
		ACTIONS => {
			"-" => 36,
			'VAR' => 56,
			"+" => 39,
			"false" => 57,
			"true" => 41,
			'NUMBER' => 87
		},
		GOTOS => {
			'exp' => 238
		}
	},
	{#State 147
		ACTIONS => {
			"!" => 148,
			"&&" => 150,
			"||" => 149
		},
		DEFAULT => -40
	},
	{#State 148
		ACTIONS => {
			"(" => 75,
			"!" => 70,
			'VAR' => 76,
			'NUMBER' => 72
		},
		GOTOS => {
			'exp_logic_unexpanded' => 239,
			'exp_condition_unexpanded' => 73,
			'exp_condition_var_unexpanded' => 69
		}
	},
	{#State 149
		ACTIONS => {
			"(" => 75,
			"!" => 70,
			'VAR' => 76,
			'NUMBER' => 72
		},
		GOTOS => {
			'exp_logic_unexpanded' => 240,
			'exp_condition_unexpanded' => 73,
			'exp_condition_var_unexpanded' => 69
		}
	},
	{#State 150
		ACTIONS => {
			"(" => 75,
			"!" => 70,
			'VAR' => 76,
			'NUMBER' => 72
		},
		GOTOS => {
			'exp_logic_unexpanded' => 241,
			'exp_condition_unexpanded' => 73,
			'exp_condition_var_unexpanded' => 69
		}
	},
	{#State 151
		ACTIONS => {
			">" => 155
		},
		GOTOS => {
			'tag_open_end' => 242
		}
	},
	{#State 152
		ACTIONS => {
			"!" => 148,
			"&&" => 150,
			"||" => 149,
			")" => 243
		}
	},
	{#State 153
		ACTIONS => {
			"sort" => 245,
			"reverse" => 244,
			"xhtml" => 246,
			"upper_case" => 249,
			"string" => 248,
			"replace" => 247,
			"length" => 250,
			"eval" => 251,
			"seq_contains" => 252,
			"lower_case" => 253,
			"html" => 254,
			"substring" => 255,
			"join" => 256,
			"first" => 257,
			"cap_first" => 258,
			"uncap_first" => 259,
			"word_list" => 261,
			"seq_index_of" => 260,
			"sort_by" => 263,
			"last" => 262,
			"size" => 264,
			"capitalize" => 265
		},
		GOTOS => {
			'op' => 266
		}
	},
	{#State 154
		DEFAULT => -114
	},
	{#State 155
		DEFAULT => -107,
		GOTOS => {
			'@1-1' => 267
		}
	},
	{#State 156
		ACTIONS => {
			"!" => 113,
			"?" => 115,
			"+" => 112,
			"[" => 114,
			"." => 116
		},
		DEFAULT => -105
	},
	{#State 157
		DEFAULT => -116,
		GOTOS => {
			'@6-5' => 268
		}
	},
	{#State 158
		DEFAULT => -121,
		GOTOS => {
			'@8-5' => 269
		}
	},
	{#State 159
		ACTIONS => {
			">" => 271
		},
		GOTOS => {
			'tag_close_end' => 270
		}
	},
	{#State 160
		DEFAULT => -199
	},
	{#State 161
		ACTIONS => {
			")" => 272
		}
	},
	{#State 162
		DEFAULT => -101
	},
	{#State 163
		ACTIONS => {
			"-" => 36,
			"+" => 39,
			'string' => 94,
			'VAR' => 56,
			"true" => 41,
			"false" => 57,
			"[" => 95,
			'NUMBER' => 87
		},
		GOTOS => {
			'exp' => 97,
			'array_str' => 92,
			'sequence_item' => 99,
			'sequence' => 274
		}
	},
	{#State 164
		ACTIONS => {
			"{" => 47
		},
		GOTOS => {
			'hash' => 51,
			'hash_op' => 275
		}
	},
	{#State 165
		DEFAULT => -197
	},
	{#State 166
		ACTIONS => {
			"%" => 103,
			"^" => 104,
			"*" => 105,
			"/" => 106
		},
		DEFAULT => -24
	},
	{#State 167
		ACTIONS => {
			"%" => 103,
			"^" => 104,
			"*" => 105,
			"/" => 106
		},
		DEFAULT => -23
	},
	{#State 168
		ACTIONS => {
			"^" => 104
		},
		DEFAULT => -30
	},
	{#State 169
		DEFAULT => -29
	},
	{#State 170
		ACTIONS => {
			"^" => 104
		},
		DEFAULT => -25
	},
	{#State 171
		ACTIONS => {
			"^" => 104
		},
		DEFAULT => -26
	},
	{#State 172
		DEFAULT => -193
	},
	{#State 173
		ACTIONS => {
			"-" => 36,
			".." => 34,
			"+" => 39,
			'DATA_KEY' => 85,
			'string' => 276,
			'VAR' => 56,
			"false" => 57,
			"true" => 41,
			"[" => 42,
			'NUMBER' => 43
		},
		GOTOS => {
			'array_op' => 279,
			'exp' => 277,
			'array_str' => 35,
			'array_pos' => 37,
			'value' => 278
		}
	},
	{#State 174
		DEFAULT => -189
	},
	{#State 175
		ACTIONS => {
			'string' => 108
		},
		GOTOS => {
			'hashvalue' => 280
		}
	},
	{#State 176
		ACTIONS => {
			"?" => 115,
			"[" => 114,
			"." => 116
		},
		DEFAULT => -152
	},
	{#State 177
		ACTIONS => {
			"?" => 115,
			"+" => 112,
			"!" => 113,
			"[" => 114,
			"." => 116
		},
		DEFAULT => -184
	},
	{#State 178
		ACTIONS => {
			'DATA_KEY' => 85,
			'NUMBER' => 86
		},
		GOTOS => {
			'array_pos' => 281
		}
	},
	{#State 179
		ACTIONS => {
			".." => 282
		}
	},
	{#State 180
		ACTIONS => {
			"]" => 283
		},
		DEFAULT => -202
	},
	{#State 181
		ACTIONS => {
			"]" => 284
		}
	},
	{#State 182
		DEFAULT => -153
	},
	{#State 183
		ACTIONS => {
			"-" => 101,
			"^" => 104,
			"*" => 105,
			"+" => 102,
			"/" => 106,
			"%" => 103,
			"]" => 285
		}
	},
	{#State 184
		DEFAULT => -166
	},
	{#State 185
		DEFAULT => -161
	},
	{#State 186
		DEFAULT => -173
	},
	{#State 187
		DEFAULT => -182
	},
	{#State 188
		ACTIONS => {
			"(" => 286
		},
		DEFAULT => -177
	},
	{#State 189
		ACTIONS => {
			"(" => 287
		}
	},
	{#State 190
		DEFAULT => -174
	},
	{#State 191
		DEFAULT => -171
	},
	{#State 192
		ACTIONS => {
			"(" => 288
		}
	},
	{#State 193
		DEFAULT => -175
	},
	{#State 194
		DEFAULT => -172
	},
	{#State 195
		ACTIONS => {
			"(" => 289
		}
	},
	{#State 196
		ACTIONS => {
			"(" => 290
		}
	},
	{#State 197
		DEFAULT => -181
	},
	{#State 198
		DEFAULT => -169
	},
	{#State 199
		DEFAULT => -168
	},
	{#State 200
		DEFAULT => -183
	},
	{#State 201
		ACTIONS => {
			"(" => 291
		}
	},
	{#State 202
		DEFAULT => -167
	},
	{#State 203
		ACTIONS => {
			"(" => 292
		}
	},
	{#State 204
		DEFAULT => -162
	},
	{#State 205
		DEFAULT => -170
	},
	{#State 206
		DEFAULT => -150
	},
	{#State 207
		DEFAULT => -185
	},
	{#State 208
		ACTIONS => {
			"?" => 115,
			"[" => 114,
			"." => 116
		},
		DEFAULT => -187
	},
	{#State 209
		DEFAULT => -151
	},
	{#State 210
		DEFAULT => -20
	},
	{#State 211
		ACTIONS => {
			"!" => 113,
			"?" => 115,
			"+" => 112,
			"[" => 114,
			"." => 116
		},
		DEFAULT => -137
	},
	{#State 212
		DEFAULT => -134
	},
	{#State 213
		ACTIONS => {
			"!" => 125,
			"&&" => 127,
			"||" => 126
		},
		DEFAULT => -34
	},
	{#State 214
		DEFAULT => -33
	},
	{#State 215
		ACTIONS => {
			"||" => 126
		},
		DEFAULT => -32
	},
	{#State 216
		ACTIONS => {
			"-" => 101,
			"+" => 102,
			"/" => 106,
			"%" => 103,
			"^" => 104,
			"*" => 105
		},
		DEFAULT => -49
	},
	{#State 217
		DEFAULT => -47
	},
	{#State 218
		ACTIONS => {
			"-" => 101,
			"+" => 102,
			"/" => 106,
			"%" => 103,
			"^" => 104,
			"*" => 105
		},
		DEFAULT => -45
	},
	{#State 219
		ACTIONS => {
			"-" => 101,
			"+" => 102,
			"/" => 106,
			"%" => 103,
			"^" => 104,
			"*" => 105
		},
		DEFAULT => -51
	},
	{#State 220
		DEFAULT => -53
	},
	{#State 221
		ACTIONS => {
			"-" => 101,
			"+" => 102,
			"/" => 106,
			"%" => 103,
			"^" => 104,
			"*" => 105
		},
		DEFAULT => -52
	},
	{#State 222
		ACTIONS => {
			"-" => 101,
			"+" => 102,
			"/" => 106,
			"%" => 103,
			"^" => 104,
			"*" => 105
		},
		DEFAULT => -48
	},
	{#State 223
		DEFAULT => -46
	},
	{#State 224
		ACTIONS => {
			"-" => 101,
			"+" => 102,
			"/" => 106,
			"%" => 103,
			"^" => 104,
			"*" => 105
		},
		DEFAULT => -44
	},
	{#State 225
		ACTIONS => {
			"-" => 101,
			"+" => 102,
			"/" => 106,
			"%" => 103,
			"^" => 104,
			"*" => 105
		},
		DEFAULT => -50
	},
	{#State 226
		DEFAULT => -36
	},
	{#State 227
		DEFAULT => -68
	},
	{#State 228
		DEFAULT => -129
	},
	{#State 229
		ACTIONS => {
			"-" => 101,
			"+" => 102,
			"/" => 106,
			"%" => 103,
			"^" => 104,
			"*" => 105
		},
		DEFAULT => -61
	},
	{#State 230
		DEFAULT => -59
	},
	{#State 231
		ACTIONS => {
			"-" => 101,
			"+" => 102,
			"/" => 106,
			"%" => 103,
			"^" => 104,
			"*" => 105
		},
		DEFAULT => -57
	},
	{#State 232
		ACTIONS => {
			"-" => 101,
			"+" => 102,
			"/" => 106,
			"%" => 103,
			"^" => 104,
			"*" => 105
		},
		DEFAULT => -63
	},
	{#State 233
		DEFAULT => -65
	},
	{#State 234
		ACTIONS => {
			"-" => 101,
			"+" => 102,
			"/" => 106,
			"%" => 103,
			"^" => 104,
			"*" => 105
		},
		DEFAULT => -64
	},
	{#State 235
		ACTIONS => {
			"-" => 101,
			"+" => 102,
			"/" => 106,
			"%" => 103,
			"^" => 104,
			"*" => 105
		},
		DEFAULT => -60
	},
	{#State 236
		DEFAULT => -58
	},
	{#State 237
		ACTIONS => {
			"-" => 101,
			"+" => 102,
			"/" => 106,
			"%" => 103,
			"^" => 104,
			"*" => 105
		},
		DEFAULT => -56
	},
	{#State 238
		ACTIONS => {
			"-" => 101,
			"+" => 102,
			"/" => 106,
			"%" => 103,
			"^" => 104,
			"*" => 105
		},
		DEFAULT => -62
	},
	{#State 239
		ACTIONS => {
			"!" => 148,
			"&&" => 150,
			"||" => 149
		},
		DEFAULT => -41
	},
	{#State 240
		DEFAULT => -39
	},
	{#State 241
		ACTIONS => {
			"||" => 149
		},
		DEFAULT => -38
	},
	{#State 242
		ACTIONS => {
			'tag_else' => 10,
			"<#" => 11,
			'string' => 9,
			"\${" => 14
		},
		GOTOS => {
			'tag_assign' => 2,
			'tag_ftl' => 1,
			'content_item' => 4,
			'variable' => 3,
			'tmp_tag_condition' => 5,
			'tag_list' => 6,
			'tag_if' => 7,
			'content' => 293,
			'tag_open_start' => 12,
			'tag' => 13,
			'tag_comment' => 15
		}
	},
	{#State 243
		DEFAULT => -42
	},
	{#State 244
		DEFAULT => -91
	},
	{#State 245
		DEFAULT => -87
	},
	{#State 246
		DEFAULT => -81
	},
	{#State 247
		DEFAULT => -78
	},
	{#State 248
		DEFAULT => -77
	},
	{#State 249
		DEFAULT => -74
	},
	{#State 250
		DEFAULT => -80
	},
	{#State 251
		DEFAULT => -83
	},
	{#State 252
		DEFAULT => -90
	},
	{#State 253
		DEFAULT => -79
	},
	{#State 254
		DEFAULT => -82
	},
	{#State 255
		DEFAULT => -76
	},
	{#State 256
		DEFAULT => -93
	},
	{#State 257
		DEFAULT => -94
	},
	{#State 258
		DEFAULT => -85
	},
	{#State 259
		DEFAULT => -75
	},
	{#State 260
		DEFAULT => -89
	},
	{#State 261
		DEFAULT => -73
	},
	{#State 262
		DEFAULT => -92
	},
	{#State 263
		DEFAULT => -86
	},
	{#State 264
		DEFAULT => -88
	},
	{#State 265
		DEFAULT => -84
	},
	{#State 266
		DEFAULT => -71
	},
	{#State 267
		DEFAULT => -108,
		GOTOS => {
			'@2-2' => 294
		}
	},
	{#State 268
		ACTIONS => {
			'tag_else' => 10,
			"<#" => 11,
			'string' => 9,
			"\${" => 14
		},
		GOTOS => {
			'tag_assign' => 2,
			'tag_ftl' => 1,
			'content_item' => 4,
			'variable' => 3,
			'tmp_tag_condition' => 5,
			'tag_list' => 6,
			'tag_if' => 7,
			'content' => 295,
			'tag_open_start' => 12,
			'tag' => 13,
			'tag_comment' => 15
		}
	},
	{#State 269
		ACTIONS => {
			'string' => 296
		}
	},
	{#State 270
		DEFAULT => -139
	},
	{#State 271
		DEFAULT => -111,
		GOTOS => {
			'@3-1' => 297
		}
	},
	{#State 272
		DEFAULT => -203
	},
	{#State 273
		ACTIONS => {
			"[" => 95
		},
		GOTOS => {
			'array_str' => 298
		}
	},
	{#State 274
		DEFAULT => -99
	},
	{#State 275
		ACTIONS => {
			"+" => 107
		},
		DEFAULT => -191
	},
	{#State 276
		DEFAULT => -17
	},
	{#State 277
		ACTIONS => {
			"-" => 101,
			"+" => 102,
			"/" => 106,
			"%" => 103,
			"^" => 104,
			"*" => 105
		},
		DEFAULT => -16
	},
	{#State 278
		DEFAULT => -194
	},
	{#State 279
		DEFAULT => -15
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
			'DATA_KEY' => 85,
			"]" => 301,
			'NUMBER' => 86
		},
		GOTOS => {
			'array_pos' => 300
		}
	},
	{#State 283
		DEFAULT => -159
	},
	{#State 284
		DEFAULT => -158
	},
	{#State 285
		DEFAULT => -154
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
			"-" => 36,
			".." => 34,
			"+" => 39,
			'DATA_KEY' => 85,
			'string' => 276,
			'VAR' => 56,
			"false" => 57,
			"true" => 41,
			"[" => 42,
			'NUMBER' => 43
		},
		GOTOS => {
			'array_op' => 279,
			'exp' => 277,
			'array_str' => 35,
			'array_pos' => 37,
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
			"-" => 36,
			".." => 34,
			"+" => 39,
			'DATA_KEY' => 85,
			'string' => 276,
			'VAR' => 56,
			"false" => 57,
			"true" => 41,
			"[" => 42,
			'NUMBER' => 43
		},
		GOTOS => {
			'array_op' => 279,
			'exp' => 277,
			'array_str' => 35,
			'array_pos' => 37,
			'value' => 307
		}
	},
	{#State 292
		ACTIONS => {
			"-" => 36,
			".." => 34,
			"+" => 39,
			'DATA_KEY' => 85,
			'string' => 276,
			'VAR' => 56,
			"false" => 57,
			"true" => 41,
			"[" => 42,
			'NUMBER' => 43
		},
		GOTOS => {
			'array_op' => 279,
			'exp' => 277,
			'array_str' => 35,
			'array_pos' => 37,
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
		DEFAULT => -14,
		GOTOS => {
			'whitespace' => 311
		}
	},
	{#State 295
		ACTIONS => {
			"</#" => 309
		},
		GOTOS => {
			'tag_close_start' => 313
		}
	},
	{#State 296
		ACTIONS => {
			">" => 155
		},
		GOTOS => {
			'tag_open_end' => 314
		}
	},
	{#State 297
		ACTIONS => {
			"whitespace" => 312
		},
		DEFAULT => -14,
		GOTOS => {
			'whitespace' => 315
		}
	},
	{#State 298
		DEFAULT => -102
	},
	{#State 299
		DEFAULT => -157
	},
	{#State 300
		ACTIONS => {
			"]" => 316
		}
	},
	{#State 301
		DEFAULT => -156
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
		DEFAULT => -110
	},
	{#State 310
		ACTIONS => {
			"if" => 325
		}
	},
	{#State 311
		DEFAULT => -109
	},
	{#State 312
		DEFAULT => -13
	},
	{#State 313
		ACTIONS => {
			"assign" => 327
		},
		GOTOS => {
			'directive_assign_end' => 326
		}
	},
	{#State 314
		DEFAULT => -122,
		GOTOS => {
			'@9-8' => 328
		}
	},
	{#State 315
		DEFAULT => -112
	},
	{#State 316
		DEFAULT => -155
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
		DEFAULT => -165
	},
	{#State 320
		ACTIONS => {
			'NUMBER' => 331
		}
	},
	{#State 321
		DEFAULT => -179
	},
	{#State 322
		DEFAULT => -160
	},
	{#State 323
		DEFAULT => -164
	},
	{#State 324
		DEFAULT => -163
	},
	{#State 325
		ACTIONS => {
			">" => 271
		},
		GOTOS => {
			'tag_close_end' => 332
		}
	},
	{#State 326
		ACTIONS => {
			">" => 271
		},
		GOTOS => {
			'tag_close_end' => 333
		}
	},
	{#State 327
		DEFAULT => -119
	},
	{#State 328
		ACTIONS => {
			'tag_else' => 10,
			"<#" => 11,
			'string' => 9,
			"\${" => 14
		},
		GOTOS => {
			'tag_assign' => 2,
			'tag_ftl' => 1,
			'content_item' => 4,
			'variable' => 3,
			'tmp_tag_condition' => 5,
			'tag_list' => 6,
			'tag_if' => 7,
			'content' => 334,
			'tag_open_start' => 12,
			'tag' => 13,
			'tag_comment' => 15
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
		DEFAULT => -126
	},
	{#State 333
		DEFAULT => -117
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
		DEFAULT => -178
	},
	{#State 336
		DEFAULT => -176
	},
	{#State 337
		DEFAULT => -180
	},
	{#State 338
		ACTIONS => {
			"list" => 339
		}
	},
	{#State 339
		ACTIONS => {
			">" => 271
		},
		GOTOS => {
			'tag_close_end' => 340
		}
	},
	{#State 340
		DEFAULT => -123
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
		 'tag', 1,
sub
#line 59 "FreeMarkerGrammar.yp"
{ '' }
	],
	[#Rule 7
		 'tag', 1, undef
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
		 'whitespace', 1, undef
	],
	[#Rule 14
		 'whitespace', 0, undef
	],
	[#Rule 15
		 'value', 1,
sub
#line 80 "FreeMarkerGrammar.yp"
{ $_[1] }
	],
	[#Rule 16
		 'value', 1, undef
	],
	[#Rule 17
		 'value', 1,
sub
#line 85 "FreeMarkerGrammar.yp"
{ $_[1] }
	],
	[#Rule 18
		 'exp', 1, undef
	],
	[#Rule 19
		 'exp', 1,
sub
#line 91 "FreeMarkerGrammar.yp"
{ $_[0]->{data}->{$_[1]} }
	],
	[#Rule 20
		 'exp', 3,
sub
#line 94 "FreeMarkerGrammar.yp"
{ $_[0]->{data}->{$_[1]} = $_[3] }
	],
	[#Rule 21
		 'exp', 1,
sub
#line 97 "FreeMarkerGrammar.yp"
{ 1 }
	],
	[#Rule 22
		 'exp', 1,
sub
#line 100 "FreeMarkerGrammar.yp"
{ 0 }
	],
	[#Rule 23
		 'exp', 3,
sub
#line 102 "FreeMarkerGrammar.yp"
{ $_[1] + $_[3] }
	],
	[#Rule 24
		 'exp', 3,
sub
#line 104 "FreeMarkerGrammar.yp"
{ $_[1] - $_[3] }
	],
	[#Rule 25
		 'exp', 3,
sub
#line 106 "FreeMarkerGrammar.yp"
{ $_[1] * $_[3] }
	],
	[#Rule 26
		 'exp', 3,
sub
#line 108 "FreeMarkerGrammar.yp"
{ $_[1] / $_[3] }
	],
	[#Rule 27
		 'exp', 2,
sub
#line 110 "FreeMarkerGrammar.yp"
{ -$_[2] }
	],
	[#Rule 28
		 'exp', 2,
sub
#line 112 "FreeMarkerGrammar.yp"
{ $_[2] }
	],
	[#Rule 29
		 'exp', 3,
sub
#line 114 "FreeMarkerGrammar.yp"
{ $_[1] ** $_[3] }
	],
	[#Rule 30
		 'exp', 3,
sub
#line 118 "FreeMarkerGrammar.yp"
{ $_[1] % $_[3] }
	],
	[#Rule 31
		 'exp_logic', 1, undef
	],
	[#Rule 32
		 'exp_logic', 3,
sub
#line 124 "FreeMarkerGrammar.yp"
{ $_[1] && $_[3] }
	],
	[#Rule 33
		 'exp_logic', 3,
sub
#line 127 "FreeMarkerGrammar.yp"
{ $_[1] || $_[3] }
	],
	[#Rule 34
		 'exp_logic', 3,
sub
#line 130 "FreeMarkerGrammar.yp"
{ $_[1] && !$_[3] }
	],
	[#Rule 35
		 'exp_logic', 2,
sub
#line 133 "FreeMarkerGrammar.yp"
{ !$_[2] }
	],
	[#Rule 36
		 'exp_logic', 3,
sub
#line 136 "FreeMarkerGrammar.yp"
{ $_[2] }
	],
	[#Rule 37
		 'exp_logic_unexpanded', 1, undef
	],
	[#Rule 38
		 'exp_logic_unexpanded', 3,
sub
#line 142 "FreeMarkerGrammar.yp"
{ "$_[1] && $_[3]" }
	],
	[#Rule 39
		 'exp_logic_unexpanded', 3,
sub
#line 145 "FreeMarkerGrammar.yp"
{ "$_[1] || $_[3]" }
	],
	[#Rule 40
		 'exp_logic_unexpanded', 2,
sub
#line 148 "FreeMarkerGrammar.yp"
{ "!$_[2]" }
	],
	[#Rule 41
		 'exp_logic_unexpanded', 3,
sub
#line 151 "FreeMarkerGrammar.yp"
{ "$_[1] && !$_[3]" }
	],
	[#Rule 42
		 'exp_logic_unexpanded', 3,
sub
#line 154 "FreeMarkerGrammar.yp"
{ "($_[2])" }
	],
	[#Rule 43
		 'exp_condition', 1,
sub
#line 158 "FreeMarkerGrammar.yp"
{ $_[1] }
	],
	[#Rule 44
		 'exp_condition', 3,
sub
#line 161 "FreeMarkerGrammar.yp"
{ $_[1] == $_[3] }
	],
	[#Rule 45
		 'exp_condition', 3,
sub
#line 164 "FreeMarkerGrammar.yp"
{ $_[1] == $_[3] }
	],
	[#Rule 46
		 'exp_condition', 3,
sub
#line 167 "FreeMarkerGrammar.yp"
{ $_[1] eq _unquote($_[3]) }
	],
	[#Rule 47
		 'exp_condition', 3,
sub
#line 170 "FreeMarkerGrammar.yp"
{ $_[1] eq _unquote($_[3]) }
	],
	[#Rule 48
		 'exp_condition', 3,
sub
#line 173 "FreeMarkerGrammar.yp"
{ $_[1] >= $_[3] }
	],
	[#Rule 49
		 'exp_condition', 3,
sub
#line 176 "FreeMarkerGrammar.yp"
{ $_[1] <= $_[3] }
	],
	[#Rule 50
		 'exp_condition', 3,
sub
#line 179 "FreeMarkerGrammar.yp"
{ $_[1] > $_[3] }
	],
	[#Rule 51
		 'exp_condition', 3,
sub
#line 182 "FreeMarkerGrammar.yp"
{ $_[1] < $_[3] }
	],
	[#Rule 52
		 'exp_condition', 3,
sub
#line 185 "FreeMarkerGrammar.yp"
{ $_[1] != $_[3] }
	],
	[#Rule 53
		 'exp_condition', 3,
sub
#line 188 "FreeMarkerGrammar.yp"
{ $_[1] ne _unquote($_[3]) }
	],
	[#Rule 54
		 'exp_condition', 2,
sub
#line 191 "FreeMarkerGrammar.yp"
{ defined $_[1] }
	],
	[#Rule 55
		 'exp_condition_unexpanded', 1,
sub
#line 194 "FreeMarkerGrammar.yp"
{ "$_[1]" }
	],
	[#Rule 56
		 'exp_condition_unexpanded', 3,
sub
#line 197 "FreeMarkerGrammar.yp"
{ "$_[1] == $_[3]" }
	],
	[#Rule 57
		 'exp_condition_unexpanded', 3,
sub
#line 200 "FreeMarkerGrammar.yp"
{ "$_[1] == $_[3]" }
	],
	[#Rule 58
		 'exp_condition_unexpanded', 3,
sub
#line 203 "FreeMarkerGrammar.yp"
{ "$_[1] = $_[3]" }
	],
	[#Rule 59
		 'exp_condition_unexpanded', 3,
sub
#line 206 "FreeMarkerGrammar.yp"
{ "$_[1] == $_[3]" }
	],
	[#Rule 60
		 'exp_condition_unexpanded', 3,
sub
#line 209 "FreeMarkerGrammar.yp"
{ "$_[1] gte $_[3]" }
	],
	[#Rule 61
		 'exp_condition_unexpanded', 3,
sub
#line 212 "FreeMarkerGrammar.yp"
{ "$_[1] lte $_[3]" }
	],
	[#Rule 62
		 'exp_condition_unexpanded', 3,
sub
#line 215 "FreeMarkerGrammar.yp"
{ "$_[1] gt $_[3]" }
	],
	[#Rule 63
		 'exp_condition_unexpanded', 3,
sub
#line 218 "FreeMarkerGrammar.yp"
{ "$_[1] lt $_[3]" }
	],
	[#Rule 64
		 'exp_condition_unexpanded', 3,
sub
#line 221 "FreeMarkerGrammar.yp"
{ "$_[1] != $_[3]" }
	],
	[#Rule 65
		 'exp_condition_unexpanded', 3,
sub
#line 224 "FreeMarkerGrammar.yp"
{ "$_[1] != $_[3]" }
	],
	[#Rule 66
		 'exp_condition_unexpanded', 2,
sub
#line 227 "FreeMarkerGrammar.yp"
{ "$_[1]??" }
	],
	[#Rule 67
		 'exp_condition_var', 1,
sub
#line 230 "FreeMarkerGrammar.yp"
{ $_[0]->_value($_[1]) }
	],
	[#Rule 68
		 'exp_condition_var', 3,
sub
#line 233 "FreeMarkerGrammar.yp"
{ scalar @{ $_[0]->_value($_[1]) } }
	],
	[#Rule 69
		 'exp_condition_var', 1, undef
	],
	[#Rule 70
		 'exp_condition_var_unexpanded', 1,
sub
#line 240 "FreeMarkerGrammar.yp"
{ "$_[1]" }
	],
	[#Rule 71
		 'exp_condition_var_unexpanded', 3,
sub
#line 243 "FreeMarkerGrammar.yp"
{ "$_[1]?$_[3]" }
	],
	[#Rule 72
		 'exp_condition_var_unexpanded', 1,
sub
#line 246 "FreeMarkerGrammar.yp"
{ "$_[1]" }
	],
	[#Rule 73
		 'op', 1, undef
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
		 'sequence_item', 1, undef
	],
	[#Rule 96
		 'sequence_item', 1, undef
	],
	[#Rule 97
		 'sequence_item', 1, undef
	],
	[#Rule 98
		 'sequence', 1, undef
	],
	[#Rule 99
		 'sequence', 3,
sub
#line 265 "FreeMarkerGrammar.yp"
{
								my $seq = '';
								$seq .= $_[1] if defined $_[1];
								$seq .= ', ' if defined $_[1] && defined $_[3];
								$seq .= $_[3] if defined $_[3];
								return $seq;
							}
	],
	[#Rule 100
		 'array_str', 2,
sub
#line 274 "FreeMarkerGrammar.yp"
{ '' }
	],
	[#Rule 101
		 'array_str', 3,
sub
#line 277 "FreeMarkerGrammar.yp"
{ "[$_[2]]" }
	],
	[#Rule 102
		 'array_str', 5,
sub
#line 280 "FreeMarkerGrammar.yp"
{
								(my $items = $_[5]) =~ s/^\[(.*)\]$/$1/;
								return "[$_[2], $items]";
							}
	],
	[#Rule 103
		 'expr_assignments', 1, undef
	],
	[#Rule 104
		 'expr_assignments', 2, undef
	],
	[#Rule 105
		 'expr_assignment', 3,
sub
#line 292 "FreeMarkerGrammar.yp"
{ $_[0]->{data}->{$_[1]} = $_[3] }
	],
	[#Rule 106
		 'tag_open_start', 1,
sub
#line 297 "FreeMarkerGrammar.yp"
{ $_[0]->_pushContext('tagParams') }
	],
	[#Rule 107
		 '@1-1', 0,
sub
#line 303 "FreeMarkerGrammar.yp"
{ $_[0]->_popContext('tagParams') }
	],
	[#Rule 108
		 '@2-2', 0,
sub
#line 304 "FreeMarkerGrammar.yp"
{ $_[0]->_pushContext('whitespace') }
	],
	[#Rule 109
		 'tag_open_end', 4,
sub
#line 306 "FreeMarkerGrammar.yp"
{ $_[0]->_popContext('whitespace') }
	],
	[#Rule 110
		 'tag_close_start', 1, undef
	],
	[#Rule 111
		 '@3-1', 0,
sub
#line 312 "FreeMarkerGrammar.yp"
{ $_[0]->_pushContext('whitespace') }
	],
	[#Rule 112
		 'tag_close_end', 3,
sub
#line 314 "FreeMarkerGrammar.yp"
{ $_[0]->_popContext('whitespace') }
	],
	[#Rule 113
		 '@4-3', 0,
sub
#line 322 "FreeMarkerGrammar.yp"
{ $_[0]->_popContext('assignment') }
	],
	[#Rule 114
		 'tag_assign', 5, undef
	],
	[#Rule 115
		 '@5-3', 0,
sub
#line 328 "FreeMarkerGrammar.yp"
{ $_[0]->_popContext('assignment') }
	],
	[#Rule 116
		 '@6-5', 0,
sub
#line 330 "FreeMarkerGrammar.yp"
{ $_[0]->_pushContext( 'assign' ); }
	],
	[#Rule 117
		 'tag_assign', 10,
sub
#line 335 "FreeMarkerGrammar.yp"
{
							    # parse the contents
								$_[0]->{data}->{_unquote($_[3])} = $_[0]->_parse( $_[7] );
								$_[0]->_popContext( 'assign' );
							}
	],
	[#Rule 118
		 'directive_assign', 1,
sub
#line 342 "FreeMarkerGrammar.yp"
{ $_[0]->_pushContext('assignment') }
	],
	[#Rule 119
		 'directive_assign_end', 1, undef
	],
	[#Rule 120
		 '@7-2', 0,
sub
#line 348 "FreeMarkerGrammar.yp"
{ $_[0]->_pushContext('listParams') }
	],
	[#Rule 121
		 '@8-5', 0,
sub
#line 351 "FreeMarkerGrammar.yp"
{ $_[0]->_popContext('listParams') }
	],
	[#Rule 122
		 '@9-8', 0,
sub
#line 354 "FreeMarkerGrammar.yp"
{ $_[0]->_pushContext( 'list' ) }
	],
	[#Rule 123
		 'tag_list', 13,
sub
#line 359 "FreeMarkerGrammar.yp"
{
								$_[0]->_popContext( 'list' );
								my $key = $_[7];
								my $format = _unquote( $_[10] );
								my $result = $_[0]->_renderList( $key, $_[4], $format );
								
								return $result;
							}
	],
	[#Rule 124
		 '@10-2', 0,
sub
#line 371 "FreeMarkerGrammar.yp"
{
								$_[0]->{workingData}->{ifLevel}++;
								$_[0]->_pushContext('condition');
							}
	],
	[#Rule 125
		 '@11-4', 0,
sub
#line 376 "FreeMarkerGrammar.yp"
{
								$_[0]->_popContext('condition');
							}
	],
	[#Rule 126
		 'tag_if', 10,
sub
#line 384 "FreeMarkerGrammar.yp"
{
								$_[0]->{workingData}->{ifLevel}--;
								$_[7] =~ s/[[:space:]]+$//s;
								my $block = "<#_if_ $_[4]>$_[7]";
								if ( $_[0]->{workingData}->{ifLevel} == 0 ) {
									# to prevent parsing of nested if blocks first, first parse level 0, and after that nested if blocks
									return $_[0]->_parseIfBlock( $block );
								} else {
									my $ifBlock = '<#if ' . $_[4] . '>' . $_[7] . '</#if>';
									
									push (@{$_[0]->{workingData}->{ifBlocks}}, $ifBlock); 
									my $ifBlockId = scalar @{$_[0]->{workingData}->{ifBlocks}} - 1;
									return '___ifblock' . $ifBlockId . '___';
								}
							}
	],
	[#Rule 127
		 '@12-2', 0,
sub
#line 403 "FreeMarkerGrammar.yp"
{ $_[0]->_pushContext('condition') }
	],
	[#Rule 128
		 '@13-4', 0,
sub
#line 405 "FreeMarkerGrammar.yp"
{ $_[0]->_popContext('condition') }
	],
	[#Rule 129
		 'tmp_tag_condition', 6,
sub
#line 407 "FreeMarkerGrammar.yp"
{ return $_[4] == 1 ? 1 : 0; }
	],
	[#Rule 130
		 'condition', 1, undef
	],
	[#Rule 131
		 'condition_unexpanded', 1, undef
	],
	[#Rule 132
		 '@14-2', 0,
sub
#line 416 "FreeMarkerGrammar.yp"
{ $_[0]->_pushContext('assignment') }
	],
	[#Rule 133
		 '@15-4', 0,
sub
#line 418 "FreeMarkerGrammar.yp"
{ $_[0]->_popContext('assignment') }
	],
	[#Rule 134
		 'tag_ftl', 6,
sub
#line 420 "FreeMarkerGrammar.yp"
{ '' }
	],
	[#Rule 135
		 'expr_ftl_assignments', 1, undef
	],
	[#Rule 136
		 'expr_ftl_assignments', 2, undef
	],
	[#Rule 137
		 'expr_ftl_assignment', 3,
sub
#line 427 "FreeMarkerGrammar.yp"
{ $_[0]->{data}->{_ftlData}->{$_[1]} = $_[3] }
	],
	[#Rule 138
		 '@16-2', 0,
sub
#line 432 "FreeMarkerGrammar.yp"
{ $_[0]->_pushContext( 'comment' ) }
	],
	[#Rule 139
		 'tag_comment', 6,
sub
#line 436 "FreeMarkerGrammar.yp"
{
								$_[0]->_popContext( 'comment' );
								$_[0]->_popContext('tagParams');
								return '';
							}
	],
	[#Rule 140
		 '@17-1', 0,
sub
#line 444 "FreeMarkerGrammar.yp"
{ $_[0]->_pushContext('variableParams') }
	],
	[#Rule 141
		 'variable', 4,
sub
#line 447 "FreeMarkerGrammar.yp"
{
								$_[0]->_popContext('variableParams');
								undef $_[0]->{workingData}->{tmpData};
								return $_[3];
							}
	],
	[#Rule 142
		 'data', 1,
sub
#line 455 "FreeMarkerGrammar.yp"
{ $_[0]->_value($_[1]) }
	],
	[#Rule 143
		 'data', 1,
sub
#line 458 "FreeMarkerGrammar.yp"
{ $_[0]->{data} }
	],
	[#Rule 144
		 'data', 1, undef
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
		 'type_op', 3,
sub
#line 475 "FreeMarkerGrammar.yp"
{ $_[0]->_value($_[3]) }
	],
	[#Rule 151
		 'type_op', 3,
sub
#line 478 "FreeMarkerGrammar.yp"
{ $_[2] }
	],
	[#Rule 152
		 'type_op', 3,
sub
#line 482 "FreeMarkerGrammar.yp"
{
								print "QQQ 1\n";
								my @list = ( @{$_[1]}, @{$_[3]} );
								return \@list;
							}
	],
	[#Rule 153
		 'type_op', 3,
sub
#line 489 "FreeMarkerGrammar.yp"
{ undef }
	],
	[#Rule 154
		 'type_op', 4,
sub
#line 492 "FreeMarkerGrammar.yp"
{
								if ( $_[0]->_context() eq 'listParams' ) {
									my $value = $_[1]->[$_[3]];
									my @list = ($value);
									return \@list;
								} else {
									my $value = $_[1][$_[3]];
									$_[0]->{workingData}->{tmpData} = $value;
									return $value;
								}
							}
	],
	[#Rule 155
		 'type_op', 6,
sub
#line 505 "FreeMarkerGrammar.yp"
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
	[#Rule 156
		 'type_op', 5,
sub
#line 517 "FreeMarkerGrammar.yp"
{
								my $maxlength = scalar @{$_[1]} - 1;
								my @list = @{$_[1]}[$_[3]..$maxlength];
								return \@list;
							}
	],
	[#Rule 157
		 'type_op', 5,
sub
#line 524 "FreeMarkerGrammar.yp"
{
								my @list = @{$_[1]}[0..$_[4]];
								return \@list;
							}
	],
	[#Rule 158
		 'type_op', 4,
sub
#line 530 "FreeMarkerGrammar.yp"
{
								my $d = $_[0]->{workingData}->{tmpData};
								$d = $_[0]->{data} if !defined $d;
								my $value = $d->{ _unquote( $_[3] ) };
								$_[0]->{workingData}->{tmpData} = $value;
								my @list = ($value);
								return \@list;
							}
	],
	[#Rule 159
		 'type_op', 4,
sub
#line 540 "FreeMarkerGrammar.yp"
{
								my $d = $_[0]->{workingData}->{tmpData};
								$d = $_[0]->{data} if !defined $d;
								my $value = $d->{ _unquote( $_[3] ) };
								$_[0]->{workingData}->{tmpData} = $value;
								return $value;
							}
	],
	[#Rule 160
		 'type_op', 6,
sub
#line 549 "FreeMarkerGrammar.yp"
{ join ( _unquote($_[5]), @{$_[1]} ) }
	],
	[#Rule 161
		 'type_op', 3,
sub
#line 552 "FreeMarkerGrammar.yp"
{
								my $sorted = _sort( $_[1] );
								return $sorted;
							}
	],
	[#Rule 162
		 'type_op', 3,
sub
#line 558 "FreeMarkerGrammar.yp"
{ scalar @{$_[1]} }
	],
	[#Rule 163
		 'type_op', 6,
sub
#line 561 "FreeMarkerGrammar.yp"
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
	[#Rule 164
		 'type_op', 6,
sub
#line 580 "FreeMarkerGrammar.yp"
{
								# differentiate between numbers and strings
								# this is not fast
								$_[0]->{workingData}->{$_[1]}->{'seqData'} ||=
								_arrayAsHash($_[1], 1);
    							my $index =  $_[0]->{workingData}->{$_[1]}->{'seqData'}->{ $_[5] };
    							return -1 if !defined $index;
    							return $index;
							}
	],
	[#Rule 165
		 'type_op', 6,
sub
#line 591 "FreeMarkerGrammar.yp"
{
								# differentiate between numbers and strings
								# this is not fast
								$_[0]->{workingData}->{$_[1]}->{'seqData'} ||=
								_arrayAsHash($_[1], 1);
    							return 1 if defined $_[0]->{workingData}->{$_[1]}->{'seqData'}->{ $_[5] };
    							return 0;
							}
	],
	[#Rule 166
		 'type_op', 3,
sub
#line 601 "FreeMarkerGrammar.yp"
{
								my @reversed = reverse @{$_[1]};
								return \@reversed;
							}
	],
	[#Rule 167
		 'type_op', 3,
sub
#line 607 "FreeMarkerGrammar.yp"
{ @{$_[1]}[-1] }
	],
	[#Rule 168
		 'type_op', 3,
sub
#line 610 "FreeMarkerGrammar.yp"
{ @{$_[1]}[0] }
	],
	[#Rule 169
		 'type_op', 3,
sub
#line 614 "FreeMarkerGrammar.yp"
{ _capfirst( $_[1] ) }
	],
	[#Rule 170
		 'type_op', 3,
sub
#line 617 "FreeMarkerGrammar.yp"
{ _capitalize( $_[1] ) }
	],
	[#Rule 171
		 'type_op', 3,
sub
#line 620 "FreeMarkerGrammar.yp"
{ $_[0]->_parse('${' . $_[1] . '}') }
	],
	[#Rule 172
		 'type_op', 3,
sub
#line 623 "FreeMarkerGrammar.yp"
{ _html($_[1]) }
	],
	[#Rule 173
		 'type_op', 3,
sub
#line 626 "FreeMarkerGrammar.yp"
{ _xhtml($_[1]) }
	],
	[#Rule 174
		 'type_op', 3,
sub
#line 629 "FreeMarkerGrammar.yp"
{ length( $_[1] ) }
	],
	[#Rule 175
		 'type_op', 3,
sub
#line 632 "FreeMarkerGrammar.yp"
{ lc $_[1] }
	],
	[#Rule 176
		 'type_op', 8,
sub
#line 635 "FreeMarkerGrammar.yp"
{ _replace( $_[1], _unquote($_[5]), _unquote($_[7]) ) }
	],
	[#Rule 177
		 'type_op', 3,
sub
#line 638 "FreeMarkerGrammar.yp"
{ $_[1] }
	],
	[#Rule 178
		 'type_op', 8,
sub
#line 641 "FreeMarkerGrammar.yp"
{ $_[1] ? _unquote($_[5]) : _unquote($_[7]) }
	],
	[#Rule 179
		 'type_op', 6,
sub
#line 644 "FreeMarkerGrammar.yp"
{ _substring( $_[1], $_[5] ) }
	],
	[#Rule 180
		 'type_op', 8,
sub
#line 647 "FreeMarkerGrammar.yp"
{ _substring( $_[1], $_[5], $_[7] ) }
	],
	[#Rule 181
		 'type_op', 3,
sub
#line 650 "FreeMarkerGrammar.yp"
{ _uncapfirst( $_[1] ) }
	],
	[#Rule 182
		 'type_op', 3,
sub
#line 653 "FreeMarkerGrammar.yp"
{ uc $_[1] }
	],
	[#Rule 183
		 'type_op', 3,
sub
#line 656 "FreeMarkerGrammar.yp"
{
								my @list = _wordlist( $_[1] );
								return \@list;
							}
	],
	[#Rule 184
		 'type_op', 3,
sub
#line 662 "FreeMarkerGrammar.yp"
{ _unquote($_[3]) }
	],
	[#Rule 185
		 'string_op', 1,
sub
#line 666 "FreeMarkerGrammar.yp"
{
								return $_[0]->_parse(_unquote( $_[1] ));
							}
	],
	[#Rule 186
		 'string_op', 3,
sub
#line 671 "FreeMarkerGrammar.yp"
{ print "QQQ 2\n"; return $_[1] . _unquote($_[3]) }
	],
	[#Rule 187
		 'string_op', 3,
sub
#line 674 "FreeMarkerGrammar.yp"
{ print "QQQ 3\n"; return $_[1] . $_[3] }
	],
	[#Rule 188
		 'string_op', 2,
sub
#line 677 "FreeMarkerGrammar.yp"
{ _unquote( $_[2] ) }
	],
	[#Rule 189
		 'hash', 3,
sub
#line 681 "FreeMarkerGrammar.yp"
{ $_[2] }
	],
	[#Rule 190
		 'hashes', 1,
sub
#line 684 "FreeMarkerGrammar.yp"
{
								$_[0]->{workingData}->{'hashes'} ||= ();
								push @{$_[0]->{workingData}->{'hashes'}}, $_[1];
							}
	],
	[#Rule 191
		 'hashes', 3,
sub
#line 690 "FreeMarkerGrammar.yp"
{	
								$_[0]->{workingData}->{'hashes'} ||= ();
								push @{$_[0]->{workingData}->{'hashes'}}, $_[3];
							}
	],
	[#Rule 192
		 'hash_op', 1, undef
	],
	[#Rule 193
		 'hash_op', 3,
sub
#line 698 "FreeMarkerGrammar.yp"
{
								my %merged = (%{$_[1]}, %{$_[3]});
								return \%merged;
							}
	],
	[#Rule 194
		 'hashvalue', 3,
sub
#line 704 "FreeMarkerGrammar.yp"
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
#line 714 "FreeMarkerGrammar.yp"
{
								my %merged = (%{$_[1]}, %{$_[3]});
								return \%merged;
							}
	],
	[#Rule 197
		 'array_op', 3,
sub
#line 721 "FreeMarkerGrammar.yp"
{
								my @list = @{$_[0]->{workingData}->{'hashes'}};
								undef $_[0]->{workingData}->{'hashes'};
								return \@list;
							}
	],
	[#Rule 198
		 'array_op', 1,
sub
#line 728 "FreeMarkerGrammar.yp"
{ _toList($_[1]) }
	],
	[#Rule 199
		 'array_op', 3,
sub
#line 731 "FreeMarkerGrammar.yp"
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
#line 743 "FreeMarkerGrammar.yp"
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
#line 752 "FreeMarkerGrammar.yp"
{ $_[0]->_value($_[1]) }
	],
	[#Rule 203
		 'func_op', 4,
sub
#line 756 "FreeMarkerGrammar.yp"
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

#line 767 "FreeMarkerGrammar.yp"



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

sub new is not defined because that would be overwritten when this code is compiled.

Additional attributes to set:

=data=
=workingData=
=debugLevel= (number)
=debug= (bool)

=cut

sub _init {
    my ( $this, $dataRef ) = @_;

    $this->{context} = undef;
    @{ $this->{context} } = ();
    $this->{data} ||= $dataRef;

    # values set in template directive 'ftl'
    $this->{data}->{_ftlData}                     ||= {};
    $this->{data}->{_ftlData}->{encoding}         ||= undef;
    $this->{data}->{_ftlData}->{strip_whitespace} ||= 1;
    $this->{data}->{_ftlData}->{attributes}       ||= {};

    $this->{workingData} ||= {};
    $this->{workingData}->{tmpData}       ||= undef;
    $this->{workingData}->{ifBlocks}      ||= ();    # array with block contents
    $this->{workingData}->{ifLevel}       ||= 0;
    $this->{workingData}->{inTagBrackets} ||= 0;
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

        if ( $this->{data}->{_ftlData}->{strip_whitespace} == 1 ) {
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
              s/___ifblock(\d+)___/$this->{workingData}->{ifBlocks}[$1]/g;
            $result =
              $this->_parse( $content );

            last;
        }
    }

    # remove all if blocks
    $this->{workingData}->{ifBlocks} = ()
      if $this->{workingData}->{ifLevel} == 0;

    return $result;
}

sub _value {
    my ( $this, $key ) = @_;

    my $value = $this->{data}->{$key};
    if ( defined $value ) {
        if ( UNIVERSAL::isa( $value, "ARRAY" ) ) {
            $this->{workingData}->{tmpData} = \@{$value};
            return \@{$value};
        }
        else {
            $this->{workingData}->{tmpData} = $value;
            return $value;
        }
    }
    my $d = $this->{workingData}->{tmpData};
    $d                              = $this->{data} if !defined $d;
    $value                          = $d->{$key};
    $this->{workingData}->{tmpData} = $value;
    return $value;
}

=pod

_renderList( $key, \@list, $format ) -> $renderedList

=cut

sub _renderList {
    my ( $this, $key, $list, $format ) = @_;

	print STDERR "_renderList; key=$key\n"      if ( $this->{debug} || $this->{debugLevel} );
	
    my ( $spaceBeforeItems, $trimmedFormat, $spaceAfterEachItem ) =
      ( '', $format, '' );

    if ( $this->{data}->{_ftlData}->{strip_whitespace} == 1 ) {
        ( $spaceBeforeItems, $trimmedFormat, $spaceAfterEachItem ) =
          $format =~ m/^(\s*?)(.*?)(\s*)$/;
    }

    $trimmedFormat = _unquote($trimmedFormat);

    my $rendered = $spaceBeforeItems;

    foreach my $item ( @{$list} ) {

        # temporarily store key value in data
        $this->{data}->{$key} = $item;

        my $parsedItem =
          $this->_parse( $trimmedFormat );

        # remove after use
        delete $this->{data}->{$key};

        $rendered .= $parsedItem . $spaceAfterEachItem;
    }
    return $rendered;
}

sub _isInsideTag {
    my ($this) = @_;

    return scalar @{ $this->{context} } > 0;
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

    push @{ $this->{context} }, $context;
}

sub _popContext {
    my ( $this, $context ) = @_;

    print STDERR "\t _popContext:$context\n"
      if ( $this->{debug} || $this->{debugLevel} );

    if ( defined @{ $this->{context} }[-1]
        && @{ $this->{context} }[ $#{ $this->{context} } ] eq $context )
    {
        pop @{ $this->{context} };
    }
}

sub _context {
    my ($this) = @_;

    return '' if !defined $this->{context} || !scalar @{ $this->{context} };
    return $this->{context}[-1];
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
        print STDERR "\t if level=" . $_[0]->{workingData}->{ifLevel} . "\n"
          if ( $_[0]->{debug} || $_[0]->{debugLevel} );
        print STDERR "\t inTagBrackets=" . $_[0]->{workingData}->{inTagBrackets} . "\n"
          if ( $_[0]->{debug} || $_[0]->{debugLevel} );

        if ( $_[0]->_context() eq 'whitespace' ) {
            if ( $_[0]->{data}->{_ftlData}->{strip_whitespace} == 1 ) {
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
s/^(word_list|upper_case|uncap_first|substring|string|replace|lower_case|length|xhtml|html|eval|capitalize|cap_first)\s*//
              );

            # sequence operations
            return ( $1, $1 )
              if (
s/^(sort_by|sort|size|seq_index_of|seq_contains|reverse|last|join|first)\s*//
              );

            return ( 'VAR', $1 ) if (s/^(\w+)//);

           #return ( 'gt', $1 ) if (s/^(\>)\s*//); # not supported by FreeMarker
        }

        # when inside an if block:
        # go deeper with <#if...
        # go up one level with </#if>
        # ignore all other tags, these will be parsed in _parseIfBlock
        if ( $_[0]->{workingData}->{ifLevel} != 0 ) {
            return ( '>',      '' ) if (s/^\s*>//);
            return ( '<#',     '' ) if (s/^<#(if)/$1/);
            return ( '</#',    '' ) if (s/^<\/#(if)/$1/);
            return ( 'if',     $1 ) if s/^\b(if)\b//;
            return ( 'string', $1 ) if (s/^(.*?)(<(#if|\/#if))/$2/s);
        }

        # tags

        if ( $_[0]->{workingData}->{inTagBrackets} ) {
            return ( '--',     $1 ) if s/^(--)//;
            return ( 'assign', $1 ) if s/^\b(assign)\b//;
            return ( 'list',   $1 ) if s/^\b(list)\b//;
            return ( 'if',     $1 ) if s/^\b(if)\b//;
            return ( '_if_',   $1 ) if (s/^\b(_if_)\b//);
            return ( 'ftl',    $1 ) if (s/^\b(ftl)\b//);
        }

        if ( $_[0]->{workingData}->{inTagBrackets} && s/^\s*>// ) {
            $_[0]->{workingData}->{inTagBrackets} = 0;
            return ( '>', '' );
        }
        if (s/^<#//) {
            $_[0]->{workingData}->{inTagBrackets} = 1;
            return ( '<#', '' );
        }
        if (s/^<\/#//) {
            $_[0]->{workingData}->{inTagBrackets} = 1;
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

=pod

parse ($input, \%vars)  -> $result

Takes an input string and returns the parsed result.

param $input: string
param \%vars: optional hash of variables that are used with variable substitution


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
    my ( $this, $input, $dataRef ) = @_;

    return '' if !defined $input || $input eq '';
    
    $this->_init( $dataRef );
    $this->{debug} ||= 0;
    $this->{debugLevel} ||= 0;

	use Data::Dumper;
    print STDERR "parse -- input data=" . Dumper($this->{data}) . "\n" if ( $this->{debug} || $this->{debugLevel} );
    
    print STDERR "parse:input=$input\n" if ( $this->{debug} || $this->{debugLevel} );

    $this->YYData->{DATA} = $input;
    my $result = $this->YYParse(
        yylex   => \&_lexer,
        yyerror => \&_error,
        yydebug => $this->{debugLevel}
    );
    $result = '' if !defined $result;

    print STDERR "parse:result=$result\n" if ( $this->{debug} || $this->{debugLevel} );

    undef $this->{workingData};
    return $result;
}

sub _parse {
    my ( $this, $input ) = @_;

    return '' if !defined $input || $input eq '';

    my $parser = new Foswiki::Plugins::FreeMarkerPlugin::FreeMarkerParser();

    $parser->{debugLevel}    = $this->{debugLevel};
    $parser->{debug}         = $this->{debug};
    $parser->{data}          = $this->{data};
    $parser->{workingData}   = $this->{workingData};

    return $parser->parse( $input );
}

1;
