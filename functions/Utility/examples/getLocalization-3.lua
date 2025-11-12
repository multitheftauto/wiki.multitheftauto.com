local languageCodes = {
	['ar_SA'] = 'ar',
	['bg_BG'] = 'bg',
	['da_DK'] = 'da',
	['de_DE'] = 'de',
	['el_GR'] = 'el',
	['es_ES'] = 'es',
	['fr_FR'] = 'fr',
	['hr_HR'] = 'hr',
	['hu_HU'] = 'hu',
	['id_ID'] = 'id',
	['it_IT'] = 'it',
	['lt_LT'] = 'lt',
	['nb_NO'] = 'nb',
	['nl_NL'] = 'nl',
	['pl_PL'] = 'pl',
	['pt_PT'] = 'pt_BR',
	['ro_RO'] = 'ro',
	['ru_RU'] = 'ru',
	['sl_SL'] = 'sl',
	['sv_SE'] = 'sv',
	['tr_TR'] = 'tr',
	['uk_UA'] = 'uk',
	['vi_VN'] = 'vi',
}

function getLanguageCode(c)
	return languageCodes[c] or c
end

code = getLanguageCode(getLocalization().code)