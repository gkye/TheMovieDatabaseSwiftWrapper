import Foundation

// swiftlint:disable type_body_length

/// The available supported Countries.
///
/// This listed is composed from calling the configuration/countries endpoint.
public enum Country: String, Codable, Equatable {
    case AD
    case AE
    case AF
    case AG
    case AI
    case AL
    case AM
    case AN
    case AO
    case AQ
    case AR
    case AS
    case AT
    case AU
    case AW
    case AZ
    case BA
    case BB
    case BD
    case BE
    case BF
    case BG
    case BH
    case BI
    case BJ
    case BM
    case BN
    case BO
    case BR
    case BS
    case BT
    case BV
    case BW
    case BY
    case BZ
    case CA
    case CC
    case CD
    case CF
    case CG
    case CH
    case CI
    case CK
    case CL
    case CM
    case CN
    case CO
    case CR
    case CS
    case CU
    case CV
    case CX
    case CY
    case CZ
    case DE
    case DJ
    case DK
    case DM
    case DO
    case DZ
    case EC
    case EE
    case EG
    case EH
    case ER
    case ES
    case ET
    case FI
    case FJ
    case FK
    case FM
    case FO
    case FR
    case GA
    case GB
    case GD
    case GE
    case GF
    case GH
    case GI
    case GL
    case GM
    case GN
    case GP
    case GQ
    case GR
    case GS
    case GT
    case GU
    case GW
    case GY
    case HK
    case HM
    case HN
    case HR
    case HT
    case HU
    case ID
    case IE
    case IL
    case IN
    case IO
    case IQ
    case IR
    case IS
    case IT
    case JM
    case JO
    case JP
    case KE
    case KG
    case KH
    case KI
    case KM
    case KN
    case KP
    case KR
    case KW
    case KY
    case KZ
    case LA
    case LB
    case LC
    case LI
    case LK
    case LR
    case LS
    case LT
    case LU
    case LV
    case LY
    case MA
    case MC
    case MD
    case ME
    case MG
    case MH
    case MK
    case ML
    case MM
    case MN
    case MO
    case MP
    case MQ
    case MR
    case MS
    case MT
    case MU
    case MV
    case MW
    case MX
    case MY
    case MZ
    case NA
    case NC
    case NE
    case NF
    case NG
    case NI
    case NL
    case NO
    case NP
    case NR
    case NU
    case NZ
    case OM
    case PA
    case PE
    case PF
    case PG
    case PH
    case PK
    case PL
    case PM
    case PN
    case PR
    case PS
    case PT
    case PW
    case PY
    case QA
    case RE
    case RO
    case RS
    case RU
    case RW
    case SA
    case SB
    case SC
    case SD
    case SE
    case SG
    case SH
    case SI
    case SJ
    case SK
    case SL
    case SM
    case SN
    case SO
    case SR
    case SS
    case ST
    case SU
    case SV
    case SY
    case SZ
    case TC
    case TD
    case TF
    case TG
    case TH
    case TJ
    case TK
    case TL
    case TM
    case TN
    case TO
    case TR
    case TT
    case TV
    case TW
    case TZ
    case UA
    case UG
    case UM
    case US
    case UY
    case UZ
    case VA
    case VC
    case VE
    case VG
    case VI
    case VN
    case VU
    case WF
    case WS
    case XC
    case XG
    case XK
    case YE
    case YT
    case YU
    case ZA
    case ZM
    case ZW

    /// The english name of a country.
    public var englishName: String {
        switch self {
        case .AD: return "Andorra"
        case .AE: return "United Arab Emirates"
        case .AF: return "Afghanistan"
        case .AG: return "Antigua and Barbuda"
        case .AI: return "Anguilla"
        case .AL: return "Albania"
        case .AM: return "Armenia"
        case .AN: return "Netherlands Antilles"
        case .AO: return "Angola"
        case .AQ: return "Antarctica"
        case .AR: return "Argentina"
        case .AS: return "American Samoa"
        case .AT: return "Austria"
        case .AU: return "Australia"
        case .AW: return "Aruba"
        case .AZ: return "Azerbaijan"
        case .BA: return "Bosnia and Herzegovina"
        case .BB: return "Barbados"
        case .BD: return "Bangladesh"
        case .BE: return "Belgium"
        case .BF: return "Burkina Faso"
        case .BG: return "Bulgaria"
        case .BH: return "Bahrain"
        case .BI: return "Burundi"
        case .BJ: return "Benin"
        case .BM: return "Bermuda"
        case .BN: return "Brunei Darussalam"
        case .BO: return "Bolivia"
        case .BR: return "Brazil"
        case .BS: return "Bahamas"
        case .BT: return "Bhutan"
        case .BV: return "Bouvet Island"
        case .BW: return "Botswana"
        case .BY: return "Belarus"
        case .BZ: return "Belize"
        case .CA: return "Canada"
        case .CC: return "Cocos  Islands"
        case .CD: return "Congo"
        case .CF: return "Central African Republic"
        case .CG: return "Congo"
        case .CH: return "Switzerland"
        case .CI: return "Cote D'Ivoire"
        case .CK: return "Cook Islands"
        case .CL: return "Chile"
        case .CM: return "Cameroon"
        case .CN: return "China"
        case .CO: return "Colombia"
        case .CR: return "Costa Rica"
        case .CS: return "Serbia and Montenegro"
        case .CU: return "Cuba"
        case .CV: return "Cape Verde"
        case .CX: return "Christmas Island"
        case .CY: return "Cyprus"
        case .CZ: return "Czech Republic"
        case .DE: return "Germany"
        case .DJ: return "Djibouti"
        case .DK: return "Denmark"
        case .DM: return "Dominica"
        case .DO: return "Dominican Republic"
        case .DZ: return "Algeria"
        case .EC: return "Ecuador"
        case .EE: return "Estonia"
        case .EG: return "Egypt"
        case .EH: return "Western Sahara"
        case .ER: return "Eritrea"
        case .ES: return "Spain"
        case .ET: return "Ethiopia"
        case .FI: return "Finland"
        case .FJ: return "Fiji"
        case .FK: return "Falkland Islands"
        case .FM: return "Micronesia"
        case .FO: return "Faeroe Islands"
        case .FR: return "France"
        case .GA: return "Gabon"
        case .GB: return "United Kingdom"
        case .GD: return "Grenada"
        case .GE: return "Georgia"
        case .GF: return "French Guiana"
        case .GH: return "Ghana"
        case .GI: return "Gibraltar"
        case .GL: return "Greenland"
        case .GM: return "Gambia"
        case .GN: return "Guinea"
        case .GP: return "Guadaloupe"
        case .GQ: return "Equatorial Guinea"
        case .GR: return "Greece"
        case .GS: return "South Georgia and the South Sandwich Islands"
        case .GT: return "Guatemala"
        case .GU: return "Guam"
        case .GW: return "Guinea-Bissau"
        case .GY: return "Guyana"
        case .HK: return "Hong Kong"
        case .HM: return "Heard and McDonald Islands"
        case .HN: return "Honduras"
        case .HR: return "Croatia"
        case .HT: return "Haiti"
        case .HU: return "Hungary"
        case .ID: return "Indonesia"
        case .IE: return "Ireland"
        case .IL: return "Israel"
        case .IN: return "India"
        case .IO: return "British Indian Ocean Territory"
        case .IQ: return "Iraq"
        case .IR: return "Iran"
        case .IS: return "Iceland"
        case .IT: return "Italy"
        case .JM: return "Jamaica"
        case .JO: return "Jordan"
        case .JP: return "Japan"
        case .KE: return "Kenya"
        case .KG: return "Kyrgyz Republic"
        case .KH: return "Cambodia"
        case .KI: return "Kiribati"
        case .KM: return "Comoros"
        case .KN: return "St. Kitts and Nevis"
        case .KP: return "North Korea"
        case .KR: return "South Korea"
        case .KW: return "Kuwait"
        case .KY: return "Cayman Islands"
        case .KZ: return "Kazakhstan"
        case .LA: return "Lao People's Democratic Republic"
        case .LB: return "Lebanon"
        case .LC: return "St. Lucia"
        case .LI: return "Liechtenstein"
        case .LK: return "Sri Lanka"
        case .LR: return "Liberia"
        case .LS: return "Lesotho"
        case .LT: return "Lithuania"
        case .LU: return "Luxembourg"
        case .LV: return "Latvia"
        case .LY: return "Libyan Arab Jamahiriya"
        case .MA: return "Morocco"
        case .MC: return "Monaco"
        case .MD: return "Moldova"
        case .ME: return "Montenegro"
        case .MG: return "Madagascar"
        case .MH: return "Marshall Islands"
        case .MK: return "Macedonia"
        case .ML: return "Mali"
        case .MM: return "Myanmar"
        case .MN: return "Mongolia"
        case .MO: return "Macao"
        case .MP: return "Northern Mariana Islands"
        case .MQ: return "Martinique"
        case .MR: return "Mauritania"
        case .MS: return "Montserrat"
        case .MT: return "Malta"
        case .MU: return "Mauritius"
        case .MV: return "Maldives"
        case .MW: return "Malawi"
        case .MX: return "Mexico"
        case .MY: return "Malaysia"
        case .MZ: return "Mozambique"
        case .NA: return "Namibia"
        case .NC: return "New Caledonia"
        case .NE: return "Niger"
        case .NF: return "Norfolk Island"
        case .NG: return "Nigeria"
        case .NI: return "Nicaragua"
        case .NL: return "Netherlands"
        case .NO: return "Norway"
        case .NP: return "Nepal"
        case .NR: return "Nauru"
        case .NU: return "Niue"
        case .NZ: return "New Zealand"
        case .OM: return "Oman"
        case .PA: return "Panama"
        case .PE: return "Peru"
        case .PF: return "French Polynesia"
        case .PG: return "Papua New Guinea"
        case .PH: return "Philippines"
        case .PK: return "Pakistan"
        case .PL: return "Poland"
        case .PM: return "St. Pierre and Miquelon"
        case .PN: return "Pitcairn Island"
        case .PR: return "Puerto Rico"
        case .PS: return "Palestinian Territory"
        case .PT: return "Portugal"
        case .PW: return "Palau"
        case .PY: return "Paraguay"
        case .QA: return "Qatar"
        case .RE: return "Reunion"
        case .RO: return "Romania"
        case .RS: return "Serbia"
        case .RU: return "Russia"
        case .RW: return "Rwanda"
        case .SA: return "Saudi Arabia"
        case .SB: return "Solomon Islands"
        case .SC: return "Seychelles"
        case .SD: return "Sudan"
        case .SE: return "Sweden"
        case .SG: return "Singapore"
        case .SH: return "St. Helena"
        case .SI: return "Slovenia"
        case .SJ: return "Svalbard & Jan Mayen Islands"
        case .SK: return "Slovakia"
        case .SL: return "Sierra Leone"
        case .SM: return "San Marino"
        case .SN: return "Senegal"
        case .SO: return "Somalia"
        case .SR: return "Suriname"
        case .SS: return "South Sudan"
        case .ST: return "Sao Tome and Principe"
        case .SU: return "Soviet Union"
        case .SV: return "El Salvador"
        case .SY: return "Syrian Arab Republic"
        case .SZ: return "Swaziland"
        case .TC: return "Turks and Caicos Islands"
        case .TD: return "Chad"
        case .TF: return "French Southern Territories"
        case .TG: return "Togo"
        case .TH: return "Thailand"
        case .TJ: return "Tajikistan"
        case .TK: return "Tokelau"
        case .TL: return "Timor-Leste"
        case .TM: return "Turkmenistan"
        case .TN: return "Tunisia"
        case .TO: return "Tonga"
        case .TR: return "Turkey"
        case .TT: return "Trinidad and Tobago"
        case .TV: return "Tuvalu"
        case .TW: return "Taiwan"
        case .TZ: return "Tanzania"
        case .UA: return "Ukraine"
        case .UG: return "Uganda"
        case .UM: return "United States Minor Outlying Islands"
        case .US: return "United States of America"
        case .UY: return "Uruguay"
        case .UZ: return "Uzbekistan"
        case .VA: return "Holy See"
        case .VC: return "St. Vincent and the Grenadines"
        case .VE: return "Venezuela"
        case .VG: return "British Virgin Islands"
        case .VI: return "US Virgin Islands"
        case .VN: return "Vietnam"
        case .VU: return "Vanuatu"
        case .WF: return "Wallis and Futuna Islands"
        case .WS: return "Samoa"
        case .XC: return "Czechoslovakia"
        case .XG: return "East Germany"
        case .XK: return "Kosovo"
        case .YE: return "Yemen"
        case .YT: return "Mayotte"
        case .YU: return "Yugoslavia"
        case .ZA: return "South Africa"
        case .ZM: return "Zambia"
        case .ZW: return "Zimbabwe"
        }
    }

    /// The native name, defaults to English Name.
    public var nativeName: String {
        switch self {
        case .AG: return "Antigua & Barbuda"
        case .BA: return "Bosnia & Herzegovina"
        case .BN: return "Brunei"
        case .CC: return "Cocos (Keeling) Islands"
        case .CD: return "Democratic Republic of the Congo (Kinshasa)"
        case .CG: return "Republic of the Congo (Brazzaville)"
        case .CI: return "Côte d’Ivoire"
        case .FO: return "Faroe Islands"
        case .GP: return "Guadeloupe"
        case .GS: return "South Georgia & South Sandwich Islands"
        case .HK: return "Hong Kong SAR China"
        case .HM: return "Heard & McDonald Islands"
        case .KG: return "Kyrgyzstan"
        case .KN: return "St. Kitts & Nevis"
        case .LA: return "Laos"
        case .LY: return "Libya"
        case .MM: return "Myanmar (Burma)"
        case .MO: return "Macau SAR China"
        case .PM: return "St. Pierre & Miquelon"
        case .PN: return "Pitcairn Islands"
        case .PS: return "Palestinian Territories"
        case .RE: return "Réunion"
        case .SJ: return "Svalbard & Jan Mayen"
        case .ST: return "São Tomé & Príncipe"
        case .SY: return "Syria"
        case .SZ: return "Eswatini (Swaziland)"
        case .TC: return "Turks & Caicos Islands"
        case .TT: return "Trinidad & Tobago"
        case .UM: return "U.S. Outlying Islands"
        case .US: return "United States"
        case .VA: return "Vatican City"
        case .VC: return "St. Vincent & Grenadines"
        case .VI: return "U.S. Virgin Islands"
        case .WF: return "Wallis & Futuna"
        default: return self.englishName
        }
    }
}
// swiftlint:enable type_body_length
