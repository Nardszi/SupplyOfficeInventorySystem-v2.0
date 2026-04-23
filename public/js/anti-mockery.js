/**
 * Anti-Mockery Filter
 * Blocks profanity, slurs, and troll input in ALL form fields across all panels.
 * Uses event delegation — works on static forms, hidden panels, and dynamically added rows.
 * Standalone whole-word detection only — adding letters around a blocked word bypasses it.
 */
(function () {
    'use strict';

    const BLOCKED = [
        // ── Filipino / Tagalog ──────────────────────────────────────────────
        'putang','putangina','putanginamo','putanginayo','putanginapo',
        'puta','puto','putahin','putahan',
        'punyeta','punyetahin','punyetahan',
        'pakyu','pakyo','pakyuhin','pakyuhan',
        'gago','gaga','gagong','gagohin',
        'bobo','boba','bobong','bobohin',
        'tanga','tangina','tanginamo','tanginahin',
        'ulol','ulul','uluhin','ululin',
        'inutil','inutilin',
        'lintik','lintikan','lintikhin',
        'leche','letse','letcheng','lechehin',
        'siraulo','siraulohin',
        'tarantado','tarantadong','tarantadohin',
        'bwisit','bwiset','bwisitin','bwisithin',
        'hayop','hayup','hayupin','hayopin',
        'kupal','kupaling','kupalin',
        'itot','itotin','itotan','nagitot','nag-itot',
        'iyot','iyotin','iyotan','nagiyot',
        'kantot','kantotin','kantutan','nagkantot',
        'jakol','jakulin','jakulan','nagjakol',
        'tamod','tamodin','tamodan',
        'chupa','chupahin','chupain',
        'libog','libugin','libugan','malibog',
        'suso','susohin','susohan',
        'pekpek','pekpekin',
        'titi','titihin','titiin',
        'tite','titehin',
        'burat','buratin',
        'etits','etitsin',
        'otin','otinin',
        'bayag','bayagin',
        'puke','pukehin',
        'puki','pukin',
        'bilat','bilatin',
        'hindot','hindotin','hindutan','naghindot',
        'pokpok','pokpokin','pokpokan',
        'malandi','malandihin',
        'burikat','burikatin',
        'engot','engotngot','engotin',
        'ungas','unggas','ungasin',
        'mangmang','mangmangngot','mangmangin',
        'duwag','duwaging','duwagin',
        'walangkwenta','walangsilbi','walangpake','walangpakialam',
        'putcha','putragis',
        'yawa','yawang','yawahin',
        'hudas','hudasin',
        'demonyo','demonyohin',
        'ampota','amputahin','amputahan',
        'bogo','bogoin','bogohin',
        'buang','buangin',
        'buwisit','buwisitin',
        'estupido','estupida','estupiduhin',
        'gunggong','gunggongin',
        'hangal','hangalin',
        'hunghang','hunghanghin',
        'imbisil','imbisilin',
        'kabayo','kabayohin',
        'kamote','kamotein',
        'katangahan','katangahin',
        'kingina','kinginamo',
        'kurakot','kurakutin',
        'loko','lokong','lokohin',
        'lutang','lutangin',
        'manyak','manyakin',
        'mugto','mugtuhin',
        'pakingshet','pakingshetan',
        'panget','pangetin',
        'pasaway','pasawayin',
        'plastik','plastikin',
        'salbabida','salbabidahin',
        'shunga','shungahin',
        'sinungaling','sinungalingin',
        'sipsip','sipsipin',
        'tamad','tamarin',
        'tonto','tontohin',
        'torpe','torpehin',
        'traydor','traydorin',
        'tsismoso','tsismosa','tsismosain',
        'walanghiya','walanghiyain',
        'yabang','yabangin',
        'yamot','yamutin',

        // ── Bisaya / Cebuano ────────────────────────────────────────────────
        'yawa','yawaa','yawang',
        'buang','buanga','buangi',
        'boang','boanga',
        'pisti','pistia','pistiha',
        'atay','atayi',
        'giatay','giataya',        'gibuang','gibuanga',
        'hubog','huboga',
        'kayat','kayata',
        'libog','liboga',
        'luod','luoda',
        'maot','maota',
        'pakyas','pakyasa',
        'iyot','iyotan','iyotin','nagiyot',
        'pisok','pisoka','pisokan',
        'ukay','ukayan','ukayin',
        'kiri','kiria','kirian',
        'lintod','lintoda',
        'piste','pistea',
        'supak','supaka',
        'uwaw','uwawa',
        'wagtang','wagtanga',
        'yuta','yutaa',

        // ── Ilokano ─────────────────────────────────────────────────────────
        'pukingina','pukingmo','pukinginamo',
        'puking','saksak','saksaken','saksakmo',
        'ulbod','ulbodmo',
        'kinnak','kinnakmo',
        'napakaputangina','napakabobo','napakagago',

        // ── Hiligaynon / Ilonggo ────────────────────────────────────────────
        'taemo','taena',
        'ihimo',
        'baboymo',
        'idomo',
        'amaw','amawmo',
        'baho','bahomo',
        'bastos','bastosmo',
        'malain','malainmo',
        'malaot','malaotmo',
        'walaymo',
        'pakyasmo',

        // ── English profanity ───────────────────────────────────────────────
        'sex','sexy','sexting','sexed','sexup','sexytime','sexchat','sextape','sexvideo',
        'suck','sucker','sucking','sucked','suckup','suckface','suckass','suckdick','suckcock','suckme',
        'blowjob','blowjobs','blow job','bjing',
        'handjob','handjobs','hand job','hjing',
        'cumshot','cumshots','cum shot','cum','cumming','cummed','cumface','cumslut','cumwhore','cumdump',
        'jizz','jizzing','jizzed','jizzface','jizzshot',
        'orgasm','orgasms','orgasming','orgasmed',
        'erection','erections','boner','boners',
        'masturbate','masturbating','masturbated','masturbation','masturbator',
        'dildo','dildos','vibrator','vibrators',
        'analsex','anal sex','analfuck','analplay',
        'oralsex','oral sex',
        'vagina','vaginas','vaginal',
        'penis','penises','penile',
        'testicle','testicles','testicular','ballsack','nutsack',
        'nipple','nipples','nippling',
        'boob','boobs','boobies','booby','tit','tits','titties','titty',
        'naked','nudity','nude','nudes','nudie',
        'porn','porno','pornography','pornographic','porntube','pornhub','xvideos','xnxx','redtube',
        'horny','horniness','horndog',
        'kinky','kinks',
        'fetish','fetishes','fetishist',
        'threesome','foursome','gangbang','gang bang','orgy','orgies',
        'stripper','stripping','stripped','stripclub','strip club',
        'escorting',
        'onlyfans','only fans','fansly',
        'camgirl','camgirls','camboy','camboys','camshow',
        'sexworker','sex worker','sexwork','sex work',
        'fuck','fucker','fuckers','fucking','fucked','fuckup','fuckface','fuckhead','fuckwit','fuckboy',
        'motherfucker','motherfucking',
        'shit','shitty','shithead','shitface','shithole','bullshit','horseshit','dipshit','apeshit','batshit',
        'asshole','assholes','asshat','asswipe','jackass','smartass','dumbass','fatass',
        'bitch','bitches','bitchy','bitching','bitchass',
        'bastard','bastards',
        'cunt','cunts','cunty','cuntface',
        'dick','dickhead','dickface','dickwad','dickweed','dickish',
        'cock','cockhead','cockface','cocksucker',
        'pussy','pussies','pussyface',
        'whore','whores','whorish','whorebag',
        'slut','sluts','slutty','slutbag',
        'skank','skanky','skanks',
        'hoe','hoes','hoebag',
        'thot','thotty',
        'nigger','niggers','nigga','niggas',
        'faggot','faggots','fag','fags',
        'dyke','dykes',
        'tranny','trannies',
        'retard','retards','retarded',
        'spastic','spaz','spazz',
        'moron','morons','moronic',
        'idiot','idiots','idiotic',
        'imbecile','imbeciles',
        'cretin','cretins',
        'dumbfuck','dumbshit','dumbcunt',
        'numbnuts','numbskull','numbnut',
        'prick','pricks',
        'twat','twats','twatface',
        'wanker','wankers','wank','wanking',
        'tosser','tossers',
        'bellend','bellends',
        'knobhead','knob','knobs',
        'minge','minges',
        'pillock','pillocks',
        'plonker','plonkers',
        'arsehole','arseholes','arse',
        'bugger','buggers','buggering',
        'crap','crappy','crapper',
        'piss','pissy','pissed','pisser','pisshead',
        'damn','damned','damnit','goddamn','goddamnit',
        'stfu','gtfo','kys','kms','fml',
        'spook','coon','chink','gook','wetback','beaner',
        'cracker','honky','kike','hymie',
        'raghead','towelhead','zipperhead',
        'halfbreed','mongrel','degenerate','subhuman','vermin',
        'scum','scumbag','scummy','filth','filthy',
        'lowlife','scoundrel','thug','thugs',
        'pimp','pimping','hooker','prostitute',        'rape','rapist','raping','raped',
        'molest','molester','molesting','molested',
        'pedophile','pedo','groomer','grooming','predator',
        'stalker','stalking','harass','harassment',
        'bully','bullying','bullied',
        'suicide','suicidal',
        'bomb','bombing','bomber','terrorist','terrorism',
        'nazi','fascist','racist','sexist','homophobe','transphobe',
        // Sexual violence & misconduct
        'sexual assault','sexualassault','sexual abuse','sexualabuse',
        'sexual harassment','sexualharassment','sexual violence','sexualviolence',
        'date rape','daterape','gang rape','gangrape','marital rape','maritalrape',
        'statutory rape','statutoryrape',
        'rape culture','rapeculture',
        'rapist','rapists','raping','raped','rapedfantasy',
        'molested','molestation','molestations','child molester','childmolester',
        'groped','groping','groper','gropers',
        'fondled','fondling','fondler',
        'nonconsensual','non consensual','non-consensual',
        'coerced','coercion','coercive',
        'voyeur','voyeurism','voyeuristic',
        'exhibitionist','exhibitionism',
        'peeping tom','peepingtom',
        // Cheating / NTR / infidelity
        'cheating','cheater','cheaters','cheat','cheated',
        'ntr','netorare','netori','netorase',
        'cuckold','cuck','cucked','cucking','cuckoldry','cuckoldress',
        'hotwife','hot wife','hotwifing','hot wifing',
        'affair','affairs','extramarital','extra marital',
        'infidelity','unfaithful','unfaithfulness',
        'adultery','adulterous','adulterer','adulteress',
        'homewrecker','home wrecker','homewrecking',
        'side chick','sidechick','side piece','sidepiece',
        'mistress',
        'twotiming','two-timing',
        'backstabber','backstabbing','backstab',

        // ── Gen Z / internet slang used mockingly ───────────────────────────
        'skibidi','skibiditoilet','skibidibop',
        'rizz','rizzler','rizzed',
        'sigma','sigmagrindset','sigmarule','sigmamale',
        'gigachad','chad','chadding',
        'hentai','hentaibro','hentaiboy',
        'goon','gooning','gooner','goonbro','goonmode',
        'edging','edger',
        'coomer','coomerbrain','coom',
        'doomer','doomscroll',
        'mewing','mewer','jawmewing',
        'looksmaxxing','looksmaxx','looksmaxxer',
        'mogging','mog','mogger','mogged',
        'inceldom','incelcore','incelpost',
        'redpill','redpilled','bluepill','blackpill','blackpilled',
        'npcbrain','npcmode',
        'basedgod','basedmode',
        'cringepost','cringelord',
        'soyboy','soyjak',
        'gigabased','ultrabased',
        'nocap','cappin','capping',
        'bussin','bussing',
        'slayqueen',
        'maincharacter',
        'delulu','delululu',
        'rentfree',
        'caughtin4k',
        'lratiobozo',
        'bozomode','bozoclown',
        'vibecheck','failedvibecheck',
        'sussybaka','sussyamogus',
        'amogus','amongus',
        'okboomer',
        'yeet','yeeted','yeeting',
        'poggers','pogchamp',
        'kekw',
        'copium','hopium',
        'malding','mald','baldmald',
        'seethe','seething',
        'copemore','copeharder',
        'bigbraintime',
        'galaxybrain',
        'smoothbrain',
        'roomtemperatureiq',

        // ── Adult content creator names (full names + misspellings only) ────
        // Leet variants are caught automatically by the normalizer
        'sweetie fox','sweetiefox','sweety fox','sweetyfox','sweetie foxx','sweetie faux','sweetiefaux','sweetie faox','sweetiefaox','sweetie fawx',
        'alex adams','alexadams','alexa adams','alex addams','alex adaams','alex adamss','alex adems','alex adums','alexadamss','alex adaams',
        'angela white','angelawhite','angela whyte','angela wite','angela whit','angelawhyte','angela wight','angela wh1te','angelawhit','angela whitte',
        'bonnie blue','bonnieblue','bonny blue','bonnie blu','bonnie bloo','bonniebluu','bonny blu','bonnieblu','bonnie bleu','bonnie bllue',
        'lana rhoades','lanarhoades','lana roads','lana rhoadez','lana roadz','lana rhoads','lanarhoads','lana rhoadess','lana rhoaades','lana rhoades',
        'johnny sins','johnnysins','johnny syns','johnny sinns','johnny sinz','johnny sines','johnnysines','johnny sinss','johnny sines','johnnysins',
        'violet myers','violetmyers','violet meyers','violet mires','violet myerss','violetmeyers','violet myres','violet meyrs','violet myerz','violet myyers',
        'eva elfie','evaelfie','eva elfi','eva elf','eva elfee','eva elfey','evaelfi','eva elfye','eva elfii','eva elfie',
        'lily phillips','lilyphillips','lilly phillips','lily philips','lily fillips','lily phillipss','lily philipss','lilyphilips','lily phillps','lily phillipz',
        'jordi el nino polla','jordinino','jordi polla','jordi el nino','jordi nino polla','jordi el nino poll','jordi elnino','jordi el nino pol','jordi elnino polla','jordi el ninopolla',
        'lexi luna','lexiluna','lexxi luna','lexi loona','lexi lunna','lexilunna','lexi lunaa','lexxi lunna','lexi luuna','lexi lunah',
        'mia malkova','miamalkova','miaa malkova','mia malcova','mia malkov','mia malkovaa','mia malkovah','miamalkova','mia malkovva','mia malkova',
        'maximo garcia','maximogarcia','maximo garsia','maximo garzia','maximo garcea','maximogarsia','maximo garica','maximo garciaa','maximo garciia','maximo garciia',
        'jak knife','jakknife','jack knife','jak nife','jak knif','jak kniife','jack nife','jakk knife','jak knyfe','jak kniife',
        'cory chase','corychase','corey chase','cory chace','cory chas','cory chasse','corey chace','cory chaase','cory chaze','corychace',
        'natasha nice','natashanice','natassia nice','natasha nicee','natasha nise','natasha niice','natashanicee','natasha nyce','natasha nicce','natasha niice',
        'yasmina khan','yasminkhan','yazmina khan','yasmeena khan','yasmina kahn','yasmina khaan','yazmina kahn','yasmeena kahn','yasmina khann','yasmina khaan',
        'sisi rose','sisirose','cici rose','sissy rose','sisi roze','sisi rrose','cici roze','sissy roze','sisirose','sisi rosee',
        'lena paul','lenapaul','lenna paul','lena paull','lena pawl','lena pall','lennapaul','lena paulll','lena poul','lena paull',
        'alina angel','alinaangel','aleena angel','alina angell','alina anjel','alinaangell','alina anngel','alina angeel','alina angell','alina angell',
        'mariana martix','marianamartix','marianna martix','mariana matrix','mariana martyx','mariana martiix','marianamatrix','mariana martixs','mariana martix','mariana martixs',
        'hailey rose max fills','haileyroseandmaxfills','hailey rose and max fills','hailey rose maxfills','hailey rosemax fills','hailey rose max fill','hailey rose max filles','hailey rose max fillss','hailey roseandmax','hailey rose and max',
        'elly clutch','ellyclutch','eli clutch','elly klutch','elly cluch','elly clutchh','elly kluutch','elly clutsh','ellyclutsh','elly clutchh',
        'valentina nappi','valentinanappi','valentina nappy','valentina napi','valentina nappii','valentina napii','valentinanappy','valentina naapi','valentina napppi','valentina nappi',
        'skylar vox','skylarvox','skyler vox','skylar voxx','skylar vocks','skylarvox','skylar voox','skylar vokx','skylar voxxx','skylar voxx',
        'blake blossom','blakeblossom','black blossom','blake blossum','blake blosssom','blake bloosom','blakeblossum','blake blosomm','blake blossomm','blake blossom',
        'molly little','mollylittle','mollie little','molly litle','molly litttle','molly littlee','mollylittle','molly litlle','molly littl','molly littlee',
        'tru kait','trukait','true kait','tru kate','true kate','tru kayt','trukate','tru kaite','true kayt','tru kaiit',
        'jessica sodi','jessicasodi','jessika sodi','jessica sody','jessica sodii','jessica sodie','jessikasodi','jessica soddy','jessica soodi','jessica sodii',
        'savannah bond','savannahbond','savanna bond','savannah bonde','savannah bondd','savanna bonde','savannahbonde','savannah bonnd','savannah boond','savannah bondd',
        'sky bri','skybri','sky bree','sky bry','sky brii','skybree','sky brri','sky brii','sky bri','sky bree',
        'alexis fawx','alexisfawx','alexis fox','alexis fawxx','alexis faux','alexis fawxxx','alexisfaux','alexis fawwx','alexis fawxs','alexis fawxx',
        'coco lovelock','cocolovelock','koko lovelock','coco lovelok','coco lovelocck','coco lovelockk','koko lovelok','coco loveloock','coco lovelocck','coco lovelokk',
        'eva lovia','evalovia','eva lovya','eva loviah','eva lovvia','eva lovyah','evalovya','eva loviah','eva lovvia','eva lovyaa',
        'eliza ibarra','elizaibarra','elisa ibarra','eliza ybarra','eliza ibarrra','eliza ibaraa','elisaibarra','eliza ibarraa','eliza ibara','eliza ibarrra',
        'danner mendez','dannermendez','danner menedez','danner mendezz','danner menndez','dannermendezz','danner mendezs','danner menddez','danner mendezz','danner mendez',
        'dani daniels','danidaniels','danny daniels','dani daniel','dani danielss','dani daniells','dannydaniels','dani danielss','dani daniells','dani danielzz',
        'tatiana alvarez','tatianaalvarez','tatianna alvarez','tatiana alverez','tatiana alvarezz','tatiana alvarrez','tatiannaalvarez','tatiana alvarezs','tatiana alvarezz','tatiana alvarrez',
        'adriana chechik','adrianachechik','adrianna chechik','adriana chechick','adriana chechikk','adriana chechick','adriannachechik','adriana chechikk','adriana chechikc','adriana chechikk',
        'alexis texas','alexistexas','alexis tex','alexis texass','alexis texaas','alexis texazz','alexistexass','alexis texaas','alexis texazz','alexis texaass',
        'elsa jean','elsajean','elsa jeen','elsa jeann','elsa jeean','elsajeen','elsa jeann','elsa jeean','elsa jeann','elsa jeen',
        'kenzie reeves','kenziereeves','kenzy reeves','kenzie reeve','kenzie reeeves','kenzie reevess','kenzyreeves','kenzie reevves','kenzie reevees','kenzie reevess',
        'danika mori','danikamori','danyka mori','danika morey','danika morii','danika morri','danykamori','danika mori','danika morri','danika moriee',
        'frances bentley','francesbentley','france bentley','frances bently','frances bentleyy','frances bentlley','francesbently','frances bentleyy','frances bentlley','frances bentleyy',
        'alyx star','alyxstar','alix star','alex star','alyx starr','alyx staar','alixstar','alyx starr','alyx staar','alyx starrr',
        'kendra lust','kendralust','kendra lustt','kendra lusth','kendra lusst','kendralustt','kendra lusst','kendra lustt','kendra lusth','kendra lustt',
        'anny walker','annywalker','annie walker','anny walkker','anny walkerr','anny walkeer','anniewalker','anny walkker','anny walkerr','anny walkeer',
        'salome gil','salomegil','salome gill','salome giil','salome gilll','salome giill','salomegill','salome giil','salome gilll','salome giill',
        'leolulu','le olulu','leolululemon','le ololou','leoluluu','le oluulu','leoluulu','le oluluu','leoluluu','le oluuluu',
        'antonio mallorca','antoniomallorca','antonio mallorqua','antonio mayorca','antonio malorca','antonio mallorka','antoniomayorca','antonio malorca','antonio mallorka','antonio mallorcaa',
        'leana lovings','leanalovings','leanna lovings','leana loving','leana lovingss','leana lovinngs','leannalovings','leana lovingss','leana lovinngs','leana lovingss',
        'hazel moore','hazelmoore','hazel more','hazel mooore','hazel mooree','hazel moorre','hazelmore','hazel mooree','hazel moorre','hazel moorree',
        'little tina','littletina','lil tina','little teen','little tiina','little tinaa','littleteen','little tiina','little tinaa','little tiinaa',
        'polly yangs','pollyyangs','polly yang','polly yangz','polly yanggs','polly yaangs','pollyyangz','polly yanggs','polly yaangs','polly yanggss',
        'msbreewc','ms bree wc','msbree wc','ms breewc','msbreewcc','ms bree wcc','msbreewcc','ms bree wcc','msbreewcc','ms breewcc',
        'elle lee','ellelee','ellie lee','elle llee','elle leee','ellieleee','elle llee','elle leee','elle leeee','elle leee',
        'willow ryder','willowryder','willow rider','willow ryde','willow ryderr','willow ryyder','willowrider','willow ryderr','willow ryyder','willow rydeer',
        'lisa ann','lisaann','lisa anne','lisa annn','lisa aann','lisaanne','lisa annn','lisa aann','lisa annnn','lisa aanne',

        // ── Fictional / troll names ─────────────────────────────────────────
        'batman','spiderman','superman','ironman','thanos','deadpool',
        'wolverine','hulk','thor','loki','venom','carnage',
        'borat','shrek','donkey','gollum','smeagol','gandalf',
        'voldemort','dumbledore','hermione','draco',
        'darth','vader','yoda','palpatine','skywalker',

        // ── Placeholder / troll inputs ──────────────────────────────────────
        'admin123','password','123456','qwerty','asdfgh',
        'testuser','fakeuser','noname','anonymous','nobody',
        'hacker','hackerman','h4cker','1337','leet',
        'trollface','troll','trololol','lolol','hahaha','hehehehe',
        'yolo','swag','swagg','drip',
        'simp','simping','incel','loser',
        'karen','boomer','zoomer','doomer','coomer',
        'brainlet',
        'dummyuser','placeholder','fakeaccount','fakename',
        'xxxxx','aaaaa','bbbbb','ccccc','zzzzz','11111','00000',
        'asdf','qwer','zxcv','poiuy','lkjhg',
        'testtest',
        'faker','randomuser','randomname',
        'user1','user2','user123',
        'helloworld',
        'abcde','abcdef','abcdefg',
        'xyzzy',
        'foobar','foobaz',
        'lmao','lmfao','rofl','roflmao',
        'bruh','bruhhh','bruhhhh',
        'noob','n00b','noobie',
        'pwned','owned','rekt',
        'ggez',
        'clownface','clownworld',
        'stupido','stupida',
        'dumber','dumbest',
        'losers',
        'patheticloser',
        'creepy','creeper',
        'perverted',
        'psychotic','maniac',
        'freaky','freakshow',
        'weirdo','weirdie',
    ];

    // ── Leet-speak normalizer ────────────────────────────────────────────────
    function normalize(str) {
        return str
            .toLowerCase()
            .replace(/4/g,  'a')
            .replace(/3/g,  'e')
            .replace(/1/g,  'i')
            .replace(/0/g,  'o')
            .replace(/5/g,  's')
            .replace(/7/g,  't')
            .replace(/8/g,  'b')
            .replace(/\$/g, 's')
            .replace(/@/g,  'a')
            .replace(/!/g,  'i')
            .replace(/\+/g, 't')
            .replace(/\|/g, 'i')
            .replace(/ph/g, 'f')
            .replace(/[^a-z]/g, '');
    }

    function containsBlocked(value) {
        if (!value || !value.trim()) return false;

        // Split into individual words for standalone single-word detection
        const words = value.toLowerCase().replace(/[^a-z0-9\s]/g, ' ').split(/\s+/).filter(Boolean);
        const normWords = words.map(normalize);

        // Also normalize the full input (spaces removed) for multi-word phrase detection
        const normFull = normalize(value);

        for (const blocked of BLOCKED) {
            const normBlocked = normalize(blocked);
            // Single-word entry: must match a standalone word exactly
            if (!blocked.includes(' ') && normWords.includes(normBlocked)) return true;
            // Multi-word entry: check if the normalized phrase appears in the normalized full input
            if (blocked.includes(' ') && normFull.includes(normBlocked)) return true;
        }
        return false;
    }

    // ── Visual feedback ──────────────────────────────────────────────────────
    function flagField(input, bad) {
        if (bad) {
            input.style.borderColor = '#dc2626';
            input.style.boxShadow   = '0 0 0 3px rgba(220,38,38,.15)';
            let msg = input.parentNode.querySelector('.am-error[data-for="' + (input.name || '_') + '"]');
            if (!msg) {
                msg = document.createElement('div');
                msg.className = 'am-error';
                msg.dataset.for = input.name || '_';
                msg.style.cssText = 'color:#dc2626;font-size:12px;margin-top:3px';
                input.parentNode.appendChild(msg);
            }
            msg.textContent = '⚠ Inappropriate input detected.';
        } else {
            input.style.borderColor = '';
            input.style.boxShadow   = '';
            const msg = input.parentNode.querySelector('.am-error[data-for="' + (input.name || '_') + '"]');
            if (msg) msg.remove();
        }
    }

    function isWatchedInput(el) {
        if (!el || !el.tagName) return false;
        const tag = el.tagName.toLowerCase();
        if (tag === 'textarea') return true;
        if (tag === 'input') {
            const t = (el.type || 'text').toLowerCase();
            return ['text', 'email', 'search'].includes(t);
        }
        return false;
    }

    // ── Event delegation — covers all panels, static and dynamic ────────────
    document.addEventListener('input', function (e) {
        if (!isWatchedInput(e.target)) return;
        flagField(e.target, containsBlocked(e.target.value));
    }, true);

    document.addEventListener('submit', function (e) {
        const form = e.target;
        if (!form || form.tagName !== 'FORM') return;
        let blocked = false;
        form.querySelectorAll('input[type="text"], input[type="email"], input[type="search"], textarea').forEach(input => {
            const bad = containsBlocked(input.value);
            flagField(input, bad);
            if (bad) blocked = true;
        });
        if (blocked) {
            e.preventDefault();
            e.stopImmediatePropagation();
            const first = form.querySelector('.am-error');
            if (first) first.scrollIntoView({ behavior: 'smooth', block: 'center' });
        }
    }, true);

})();
