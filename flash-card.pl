#!/usr/bin/env perl
# SPDX-License-Identifier: GPL-3.0-or-later
# dutch/english flashcard program
# Copyright (C) 2014, 2015, 2018, 2019 Eric Herman <eric@freesa.org>

use strict;
use warnings;

# dutch to english sentences may have more than one translation in either
# direction, that's fine, the script handles that.
my $nl_to_en = [

    # misc_sentences from my friends
    [
        'De beste stuurlui staan aan wal.' =>
          'The best helmsmen stand on the dock'
    ],
    [ 'De beste stuurlui staan aan wal.' => 'Being an armchair general.' ],
    [
        'Ik zou mijn eigen whisky willen maken.' =>
          'I would like to make my own whisky.'
    ],
    [
        'Ik zou op en ballon safari willen gaan.' =>
          'I would like to go on a balloon safari'
    ],
    [
        'I zou naar de top van een rokende vulkaan om te klimmen' =>
          'I would like to climb to the top of a smoking volcano'
    ],

    [ 'Uit je dak!' => 'Crazy!' ],
    [
        'Wat doe je het liefst in je vrije tijd?' =>
          'What do you prefer in your spare time?'
    ],
    [ 'Ga je tegelmatic sporten?' => 'Do you exercise regularly?' ],
    [
        'Nee, maar op vakantie find ik buiten dingen leuk.' =>
          'No, but on vacation I find outdoor things nice.'
    ],
    [ 'Waar ga je het liefst uit eten'   => 'Where do you like to eat out?' ],
    [ 'Wat voor werk doe je?'            => 'What do you do for work?' ],
    [ 'Ik ben een computer programmeur.' => 'I am a computer programmer.' ],
    [
        'Hoeveel dagen per week werk je?' =>
          'How many days per week do you work?'
    ],
    [ 'Ik werk vijf dagen per week' => 'I work five days per week.' ],
    [
        'Hoe laat begin en eindig je met je werk?' =>
          'What time do you begin and end work?'
    ],
    [
        'Ik begin werk rond negen uur en ik laat ongeveer vijf.' =>
          "I begin work around nine o'clock and I leave about five."
    ],
    [
        "Welke diploma's of wat voor graad heb je?" =>
          "What diplomas or what degrees do you have?"
    ],
    [
        'Ik heb geen formeel onderwijs, ik ben autodidact.' =>
          'I have no formal education, I am self-taught.'
    ],
    [
        'Waar heb je in het verleden gewerkt?' =>
          'where have you worked in the past?'
    ],
    [
        'In het verleden werkt ik in Duitsland.' =>
          'In the past, I worked in Germany.'
    ],
    [
        'Wat find je leuk aan je huidige baan?' =>
          'What do you like about your current job?'
    ],
    [
        "Ik vind mijn collega's heel leuk en het werk interessant." =>
          "I find my colleagues very nice and the work interresting."
    ],
    [
        'Wat is een voordeel en nadeel van je werk?' =>
          'What is an advantage and disadvantage of your work?'
    ],
    [
        'Het geld is goed, maar het werk is moeilijk' =>
          'The money is good, but the work is hard'
    ],
    [
        'Waarom heb je voor jouw baan gekozen?' =>
          'Why did you choose your job?'
    ],
    [
        'Het is wat ik altijd al wilde doen.' =>
          'It is what I always wanted to do.'
    ],
    [
        'Wat wilde je worden, toen je kind was?' =>
          'What did you want to be when you were a child?'
    ],
    [ 'Ik wilde computers programmeren.' => 'I wanted to program computers.' ],
    [ 'Wat voor verk deed je vader?' => 'What did your father do for work?' ],
    [
        'Ik heb hetzelfde beroep als mijn vader.' =>
          'I have the same profression as my father.'
    ],
    [ 'Wat voor werk doet je moeder?' => 'What does your mother do for work?' ],
    [ 'Mijn moeder is een vroedvrouw.' => 'My mother is a midwife' ],
    [
        'Wat voor werk doet je broer of zus?' =>
          'What does your brother or sister do for work?'
    ],
    [
        'Mijn zus is een professor in de biochemie.' =>
          'My sister is a professor of biochemistry.'
    ],
    [
        'Werk je weleens in het weekeinde?' =>
          'Do you sometimes work on the weekend?'
    ],
    [
        'Ik moet zelden in het weekend werken.' =>
          'I seldom have to work on the weekends.'
    ],
    [
        'Moet je voor je werk veel vergaderen?' =>
          'Do you have to go to a lot of meetings for work?'
    ],
    [
        'De meeste vergaderingen zijn eigenlijk nuttig.' =>
          'Most of the meetings are actually useful.'
    ],
    [
        "Kun je met je collega's opschieten?" =>
          "Can you get along with your colleagues?"
    ],
    [
        "Ik opschieten echt goed met mijn collega's." =>
          "I get along really well with my colleagues."
    ],
    [ 'Kun je met je bass opschieten?' => 'Can you get along with your boss?' ],
    [
        'Mijn baas steunt mij en ik steun hem.' =>
          'My boss supports me and I support him.'
    ],
    [
        'Van de mensen die je kent, wie heeft de leukste baan?' =>
          'Of the people you know, who has the best job?'
    ],
    [ 'Mijn vader is gepensioneerd.' => 'My father is retired.' ],
    [
        'Welke banen worden te weinig betaald?' =>
          'What jobs are paid too little?'
    ],
    [ 'Leraren worden te weinig betaald.' => 'Teachers are paid too little.' ],
    [ 'Welke banen worden te veel betaald?' => 'What jobs are paid too much?' ],
    [
        'Sommige atleten zijn te veel betaald.' =>
          'Some athletes are paid too much.'
    ],
    [ 'Beschrijf je droombaan.' => 'Describe your dream job.' ],
    [
        "Ik zou graag met pensioen gaan en werken aan mijn projecten." =>
          "I would like to retire and work on my projects."
    ],
    [
        'Deze informatie is van groot belang.' =>
          'This information is of great importance.'
    ],
    [ 'Vriendelijkheid is zijn zwakke punt.' => 'Kindness is his weak point.' ],
    [ 'Ik vond zijn huis met moeite.' => 'I found his house with difficulty.' ],
    [ 'Ik ben een student.'           => 'I am a student.' ],
    [ 'Jij bent een student.'         => 'You are a student.' ],
    [ 'Ben jij een student?'          => 'Are you a student?' ],
    [ 'Hij is een baby.'              => 'He is a baby.' ],
    [ 'Zij is een kind.'              => 'She is a child.' ],
    [ 'Wij zijn studenten.'           => 'We are students.' ],
    [ 'Jullie zijn studenten.'        => 'You are students.' ],
    [ 'Zij zijn studenten.'           => 'They are students.' ],
    [ 'Het nummer is nul.'            => 'The number is zero.' ],
    [ 'Wat betekenen de woorden?'     => 'What do the words mean?' ],
    [ 'Maak de opdrachten.'           => 'Do the assignments.' ],
    [ 'Trek een lijn.'                => 'Draw a line.' ],
    [ 'Kies het goede antwoord.'      => 'Choose the correct answer.' ],
    [ 'Het is ochtend.'               => 'It is morning.' ],
    [ 'Het is middag'                 => 'It is afternoon.' ],
    [ 'Het is avond.'                 => 'It is evening.' ],
    [ 'De trein is ver.'              => 'The train is far.' ],
    [ 'De man luistert.'              => 'The man listens.' ],
    [ 'De vrouw praat.'               => 'The woman talks.' ],
    [ 'De vrouw helpt de man.'        => 'The woman helps the man.' ],
    [ 'Hij geeft informatie.'         => 'He gives information.' ],
    [ 'Het water is diep.'            => 'The water is deep.' ],
    [ 'De pen is in de pot'           => 'The pen is in the pot.' ],
    [ 'De pot is achter de stoel.'    => 'The pot is behind the chair.' ],
    [ 'De pot is op de stoel.'        => 'The pot is on the chair.' ],
    [ 'De jas hangt over de stoel.'   => 'The coat hangs over the chair.' ],
    [ 'De pot is voor de stoel.'      => 'The pot is in front of the chair.' ],
    [ 'De pot is onder de stoel.'     => 'The pot is under the chair.' ],
    [ 'De pot is naast de stoel.'     => 'The pot is next to the chair.' ],
    [ 'De pot is tussen de stoelen.'  => 'The pot is between the chairs.' ],
    [ 'Zij woont in dit huis.'        => 'She lives in this house.' ],
    [ 'De vrouw verkoopt brood.'      => 'The woman sells bread.' ],
    [ 'De auto is duur'               => 'The car is expensive.' ],
    [ 'De jas kost zestig euro.'      => 'The coat costs sixty euro.' ],
    [ 'Met je oren kun je horen.'     => 'With your ears you can hear.' ],
    [ 'Met je ogen kun je zien.'      => 'With your eyes you can see.' ],
    [ 'Ik werk in dit bedrijf.'       => 'I work in this company.' ],
    [ 'Ik werk in dit gebouw.'        => 'I work in this building.' ],
    [ 'Ik ben bij dit bedrijf.'       => "I'm in this company." ],
    [ 'Ik werk voor dit bedrijf.'     => 'I work for this company.' ],
    [ 'De deur is open.'              => 'The door is open.' ],
    [ 'De deur is dicht.'             => 'The door is closed.' ],
    [ 'Ik heet Eric'                  => 'I am called Eric.' ],
    [ 'Wat is jouw baan?'             => 'What is your job?' ],
    [ 'Ik werk in een ziekenhuis.'    => 'I work in a hospital.' ],
    [ 'De auto is snel.'              => 'The car is fast.' ],
    [ 'De man is langzaam.'           => 'The man is slow.' ],
    [ 'De vrouw geeft een boek.'      => 'The woman gives a book.' ],
    [ 'De man krijgt een boek.'       => 'The man gets a book.' ],
    [ 'De man is ziek.'               => 'The man is sick.' ],
    [ 'De man is beter.'              => 'The man is better.' ],
    [ 'De vrouw kijkt naar de man.'   => 'The woman looks at the man.' ],
    [ 'Deze auto is oud.'             => 'This car is old.' ],
    [ 'Deze auto is nieuw.'           => 'This car is new.' ],
    [ 'De vrouw is binnen.'           => 'The woman is inside.' ],
    [ 'De vrouw is buiten.'           => 'The woman is outside.' ],
    [ 'Deze plaats heet Eemnes.'      => 'This place is called Eemnes.' ],
    [
        'De man heeft anderen kleren dan de vrouw.' =>
          'The man has different clothes than the woman.'
    ],
    [ 'Zij is blij.'   => 'She is happy.' ],
    [ 'zij is alleen.' => 'She is alone.' ],
    [
        'Er zit een aantal mensen op de bank.' =>
          'There are a number of people on the couch.'
    ],
    [ 'Zij weet het antwoord.'      => 'She knows the answer.' ],
    [ 'De vrouw is na de man.'      => 'The woman is after the man.' ],
    [ 'De taart is zoet.'           => 'The cake is sweet.' ],
    [ 'De citroen is zuur.'         => 'The lemon is sour.' ],
    [ 'De soep is te zout.'         => 'The soup is too salty.' ],
    [ 'Het is laat.'                => 'It is late.' ],
    [ 'Het is vroeg.'               => 'It is early.' ],
    [ 'De les is tot 10 uur.'       => "The lesson is until 10 o'clock" ],
    [ 'Zij eet om 12 uur.'          => "She eats at 12 o'clock" ],
    [ 'Wat doet de jongen?'         => 'What is the boy doing?' ],
    [ 'Zij gaan op vakantie.'       => 'They go on vacation.' ],
    [ 'De bloem is mooi.'           => 'The flower is beautiful.' ],
    [ 'Zij zijn thuis.'             => 'They are at home.' ],
    [ 'Hij is vanavond niet thuis.' => 'He is not home tonight.' ],
    [ 'Het is druk op straat.'      => 'It is busy on the street.' ],
    [ 'Zij zorgt voor de vrouw.'    => 'She takes care of the woman.' ],
    [ 'Je moet hier lopen.'         => 'You must walk here.' ],
    [ 'Dit is slecht.'              => 'This is bad.' ],
    [ 'Ik gebruik een pen.'         => 'I use a pen.' ],
    [ 'De vrouw heeft alles.'       => 'The woman has everything.' ],
    [ 'De man heeft niks.'          => 'The man has nothing.' ],
    [ 'Welke soort tomaat wil je?'  => 'What kind of tomato do you want?' ],
    [ 'De vrouw is sterk.'          => 'The woman is strong.' ],
    [ 'Wij noemen de baby Anna.'    => 'We call the baby Anna.' ],
    [ "De vrouw zegt 'Hoi!'"        => 'The woman says, "Hi!"' ],
    [ 'Wat betekent dit?'           => 'What does this mean?' ],
    [
        'Het is koud. Daarom heeft zij een jas aan.' =>
          'It is cold. Therefor she has a coat on.'
    ],
    [ 'Hij gaat. Zij blift.'          => 'He goes. She stays.' ],
    [ 'Goed eten is belangrijk.'      => 'Good food is important.' ],
    [ 'De jongen is bang'             => 'The boy is afraid.' ],
    [ 'De vrouw staat in het midden.' => 'The woman stands in the middle.' ],
    [ 'De man vindt het jammer.'      => 'The man finds it a bummer.' ],
    [ 'De man is teleurgesteld.'      => 'The man is disappointed.' ],
    [ 'De vrouw is klaar met werken.' => 'The woman is done with work.' ],
    [ 'Ik zal me even voorstellen.'   => "I'll introduce myself." ],

    [ 'Ik kan me dat moeilijk voorstellen.' => 'I find that hard to imagine.' ],

    [ 'De software heeft geen fouten.' => 'The software has no bugs.' ],
    [ 'De baas maakt geen fouten.'     => 'The boss makes no mistakes.' ],
    [ 'Het antwoord is fout.'          => 'The answer is wrong.' ],

    [ 'Het meer is diep.' => 'The lake is deep.' ],
    [
        'Hij heeft veel boeken, maar ik heb er meer.' =>
          'He has many books but I have more.'
    ],
    [ 'Zij hebben meer kinderen.' => 'They have more kids.' ],
    [ 'Meer dood dan levend.'     => 'More dead than alive.' ],
    [ 'Wie waren er nog meer?'    => 'Who else was there?' ],
    [ 'Je moet wat meer lachen.'  => 'You have to laugh more often.' ],
    [ 'Hij kon niet meer werken'  => "He could't work anymore." ],
    [ 'Het schip is gemeerd.'     => 'The ship has moored.' ],

    [ 'De doos is vol.'        => 'The box is full.' ],
    [ 'Hij zit vol'            => 'He is sated.' ],
    [ 'Het zit vol met mieren' => 'It is full of ants.' ],
    [ 'Het glas is half vol'   => 'The glass is half full.' ],

    [ 'De trein is geel en blauw.'       => 'The train is yellow and blue.' ],
    [ 'De regenboog heeft zeven kleuren' => 'The rainbow has seven colors.' ],

    [ 'De bol is rond.'                 => 'The sphere is round.' ],
    [ 'Honderd is een rond getal.'      => 'Hundred is a round number.' ],
    [ 'Het plan is rond.'               => 'The plan is squared away.' ],
    [ 'De mensen zitten rond het vuur.' => 'The people sit around the fire.' ],

    [ 'De lijn is recht.'   => 'The line is straight.' ],
    [ 'Deze hoek is recht.' => 'This is a right angle.' ],
    [
        'Het recht in eigen hand nemen.' => 'Taking the law in their own hands.'
    ],
    [ 'Het glas is half leeg.' => 'The glass is half empty.' ],
    [ 'Het glas is half vol.'  => 'The glass is half full.' ],

    [ 'Hij kan in het donker niet zien.' => "He can't see in the dark." ],
    [ 'We zullen het zien.'              => 'We shall see.' ],

    [ 'Waarom dragen mensen kleren?'    => 'Why do people wear clothes?' ],
    [ 'Wie zal de Ring dragen?'         => 'Who will bear the Ring?' ],
    [ 'Kan jij de boodschappen dragen?' => 'Could you carry the shopping?' ],
    [ 'BTW moet men afdragen.'          => 'One has to pay VAT.' ],
    [ 'Iemand iets opdragen.'           => 'Assign someone a duty.' ],
    [ 'Iemand een boek opdragen.'       => 'Dedicate a book to someone.' ],
    [ 'Burgers moeten zich gedragen.'   => 'Citizens must behave.' ],
    [
        'De schoen wordt aan de voet gedragen.' =>
          'The shoe is worn on the foot.'
    ],
    [ 'Mijn doel is mij te misdragen.' => 'I aim to misbehave.' ],
    [ 'Hij kan geen pijn verdragen.'   => "He can't bear pain." ],

    [ 'Mijn werkkamer is boven.' => 'My office is upstairs' ],
    [ 'De woonkamer is beneden.' => 'The living room is downstairs.' ],
    [
        'Moet deze doos naar boven, of kan ik de doos beneden laten staan?' =>
          'Should this box go upstairs, or can I leave the box downstairs.'
    ],
    [
        'Boven op de berg staat een restaurant.' =>
          'At the top of the mountain is a restaurant'
    ],
    [
        'Gaat de lift naar boven of beneden?' =>
          'Is the elevator going up or down?'
    ],

    [
        'Je kunt de zin kopieren en plakken.' =>
          'You can copy and paste the sentence.'
    ],

    [ 'Ik bak koekjes in de keuken.' => 'I am baking cookies in the kitchen.' ],

    [ 'Zij doet het anders.'           => 'She does it differently.' ],
    [ 'De andere broek is rood'        => 'The other pants are red.' ],
    [ 'Hij is anders zo rustig'        => 'He is usually so quiet.' ],
    [ 'De dokter woont ergens anders.' => 'The doctor lives somewhere else.' ],

    # TODO: make sentences with these
    # NOTE(chris): these are in alphabetical order
    # some other vocab

    [ 'bedenken'        => 'make up' ],
    [ 'begrijpen'       => 'understand' ],
    [ 'bekijken'        => 'view' ],
    [ 'bellen'          => 'call' ],
    [ 'beneden'         => 'below' ],
    [ 'betalen'         => 'pay' ],
    [ 'boven'           => 'above' ],
    [ 'daar'            => 'daar' ],
    [ 'dood'            => 'dead' ],
    [ 'dubbel'          => 'double' ],
    [ 'een beetje'      => 'a bit' ],
    [ 'gek'             => 'crazy' ],
    [ 'gisteren'        => 'yesterday' ],
    [ 'hangen'          => 'hang' ],
    [ 'hetzelfde'       => 'same' ],
    [ 'hier'            => 'here' ],
    [ 'hoog'            => 'high' ],
    [ 'iemand'          => 'somebody' ],
    [ 'kiezen'          => 'choose' ],
    [ 'kijken'          => 'look' ],
    [ 'koeken'          => 'cookies' ],
    [ 'koken'           => 'cook' ],
    [ 'kopen'           => 'buy' ],
    [ 'kort'            => 'short' ],
    [ 'koud'            => 'cold' ],
    [ 'laag'            => 'low' ],
    [ 'lachen'          => 'laugh' ],
    [ 'lang'            => 'long' ],
    [ 'leggen'          => 'lay' ],
    [ 'leren'           => 'learn' ],
    [ 'leven'           => 'living' ],
    [ 'lezen'           => 'read' ],
    [ 'licht'           => 'light' ],
    [ 'liegen'          => 'lie' ],
    [ 'liggen'          => 'lay' ],
    [ 'lopen'           => 'walk' ],
    [ 'makkelijk'       => 'easy' ],
    [ 'mijmeren'        => 'contemplate' ],
    [ 'min'             => 'minus' ],
    [ 'moe'             => 'tired' ],
    [ 'moelijk'         => 'difficult' ],
    [ 'morgen'          => 'tomorrow' ],
    [ 'nat'             => 'wet' ],
    [ 'niemand'         => 'nobody' ],
    [ 'normaal'         => 'normal' ],
    [ 'nu'              => 'now' ],
    [ 'printen'         => 'print' ],
    [ 'rijden'          => 'drive' ],
    [ 'roepen'          => 'holler' ],
    [ 'roken'           => 'smoke' ],
    [ 'schoon'          => 'clean' ],
    [ 'schrijven'       => 'write' ],
    [ 'slapen'          => 'sleep' ],
    [ 'slepen'          => 'drag' ],
    [ 'spelen'          => 'play' ],
    [ 'spellen'         => 'spell' ],
    [ 'spreken'         => 'speak' ],
    [ 'staan'           => 'stand' ],
    [ 'stil'            => 'silent' ],
    [ 'tekenen'         => 'draw' ],
    [ 'trekken'         => 'pull' ],
    [ 'typen'           => 'type' ],
    [ 'vallen'          => 'fall' ],
    [ 'vandaag'         => 'today' ],
    [ 'veel'            => 'many' ],
    [ 'vies'            => 'dirty' ],
    [ 'voetballen'      => 'play soccer' ],
    [ 'vol'             => 'full' ],
    [ 'voorstellen'     => 'propose' ],
    [ 'voorstellen aan' => 'introduce' ],
    [ 'vroeger'         => 'former' ],
    [ 'wassen'          => 'wash' ],
    [ 'weinig'          => 'few' ],
    [ 'werken'          => 'work' ],
    [ 'zien'            => 'see' ],
    [ 'zingen'          => 'sing' ],
    [ 'zitten'          => 'sit' ],
    [ 'zoeken'          => 'search' ],
    [ 'zwaar'           => 'heavy' ],

    # some het vs de vocab
    [ 'het lichaam'     => 'the body' ],
    [ 'de buik'         => 'the belly' ],
    [ 'de maag'         => 'the stomach' ],        # part of the digestive tract
    [ 'de rug'          => 'the back' ],
    [ 'het been'        => 'the leg' ],
    [ 'de arm'          => 'the arm' ],
    [ 'de voet'         => 'the foot' ],
    [ 'de hand'         => 'the hand' ],
    [ 'de auto'         => 'the car' ],
    [ 'de bus'          => 'the bus' ],
    [ 'de fiets'        => 'the bicycle' ],
    [ 'de boot'         => 'the boat' ],
    [ 'het oog'         => 'the eye' ],
    [ 'het hoofd'       => 'the head' ],
    [ 'de neus'         => 'the nose' ],
    [ 'het oor'         => 'the ear' ],
    [ 'de mond'         => 'the mouth' ],
    [ 'de tand'         => 'the tooth' ],
    [ 'het haar'        => 'the hair' ],
    [ 'de kleren'       => 'the clothes' ],
    [ 'de trui'         => 'the sweater' ],
    [ 'het pak'         => 'the suit' ],
    [ 'de rok'          => 'the skirt' ],
    [ 'de broek'        => 'the pants' ],
    [ 'de jas'          => 'the jacket' ],
    [ 'de tas'          => 'the bag' ],
    [ 'de ring'         => 'the ring' ],
    [ 'het geld'        => 'the money' ],
    [ 'de euro'         => 'the euro' ],
    [ 'het gat'         => 'the hole' ],
    [ 'de bal'          => 'the ball' ],
    [ 'de letter'       => 'the letter' ],
    [ 'het woord'       => 'the word' ],
    [ 'de zin'          => 'the sentence' ],
    [ 'de punt'         => 'the period' ],
    [ 'de pen'          => 'the pen' ],
    [ 'de potlood'      => 'the pencil' ],
    [ 'de gum'          => 'the eraser' ],
    [ 'de map'          => 'the folder' ],
    [ 'het plaatje'     => 'the image' ],
    [ 'het rondje'      => 'the little circle' ],
    [ 'het kruisje'     => 'the little x' ],
    [ 'de lijn'         => 'the line' ],
    [ 'de deur'         => 'the door' ],
    [ 'de straat'       => 'the street' ],
    [ 'de tuin'         => 'the garden' ],
    [ 'het dak'         => 'the roof' ],
    [ 'het huis'        => 'the house' ],
    [ 'het raam'        => 'the window' ],
    [ 'de muur'         => 'the wall' ],
    [ 'de kamer'        => 'the room' ],
    [ 'de trap'         => 'the stairs' ],
    [ 'de vraag'        => 'the question' ],
    [ 'het antwoord'    => 'the answer' ],
    [ 'de streep'       => 'the line' ],
    [ 'het bed'         => 'the bed' ],
    [ 'de bank'         => 'the couch' ],
    [ 'de stoel'        => 'the chair' ],
    [ 'de tafel'        => 'the table' ],
    [ 'de klok'         => 'the clock' ],
    [ 'het bot'         => 'the bone' ],
    [ 'de pot'          => 'the pot' ],
    [ 'de hond'         => 'the dog' ],
    [ 'de kat'          => 'the cat' ],
    [ 'de koe'          => 'the cow' ],
    [ 'het dier'        => 'the animal' ],
    [ 'het mens'        => 'the human' ],
    [ 'de moeder'       => 'the mother' ],
    [ 'de vader'        => 'the father' ],
    [ 'de dochter'      => 'the daughter' ],
    [ 'de zoon'         => 'the son' ],
    [ 'de zus'          => 'the sister' ],
    [ 'de broer'        => 'the brother' ],
    [ 'de computer'     => 'the computer' ],
    [ 'de brief'        => 'the letter' ],
    [ 'de krant'        => 'the newspaper' ],
    [ 'de tv'           => 'the tv' ],
    [ 'de puzzel'       => 'the puzzle' ],
    [ 'het boek'        => 'the book' ],
    [ 'de datum'        => 'the date' ],
    [ 'de dag'          => 'the day' ],
    [ 'de week'         => 'the week' ],
    [ 'de maand'        => 'the month' ],
    [ 'het jaar'        => 'the year' ],
    [ 'de agenda'       => 'the calendar' ],
    [ 'het adres'       => 'the address' ],
    [ 'de ui'           => 'the onion' ],
    [ 'de banaan'       => 'the banana' ],
    [ 'de tomaat'       => 'the tomato' ],
    [ 'de sla'          => 'the lettuce' ],
    [ 'de kool'         => 'the cabbage' ],
    [ 'het ijsje'       => 'the icecream' ],
    [ 'de boter'        => 'the butter' ],
    [ 'de soep'         => 'the soup' ],
    [ 'het brood'       => 'the bread' ],
    [ 'de pap'          => 'the porridge' ],
    [ 'de man'          => 'the man' ],
    [ 'de vrouw'        => 'the woman' ],
    [ 'de jongen'       => 'the boy' ],
    [ 'het meisje'      => 'the girl' ],
    [ 'de tandarts'     => 'the dentist' ],
    [ 'de dokter'       => 'the doctor' ],
    [ 'de boer'         => 'the farmer' ],
    [ 'de pil'          => 'the pill' ],
    [ 'de markt'        => 'the market' ],
    [ 'het feest'       => 'the party' ],
    [ 'het ziekenhuis'  => 'the hospital' ],
    [ 'de post'         => 'the mail' ],
    [ 'het bad'         => 'the bath' ],
    [ 'de douche'       => 'the shower' ],
    [ 'de wolk'         => 'the cloud' ],
    [ 'de lucht'        => 'the sky' ],
    [ 'de regen'        => 'the rain' ],
    [ 'de wind'         => 'the wind' ],
    [ 'het weer'        => 'the weather' ],
    [ 'de steen'        => 'the stone' ],
    [ 'het goud'        => 'the gold' ],
    [ 'het hout'        => 'the wood' ],
    [ 'het zand'        => 'the sand' ],
    [ 'het ijs'         => 'the ice' ],
    [ 'het water'       => 'the water' ],
    [ 'het vuur'        => 'the fire' ],
    [ 'de pan'          => 'the pan' ],
    [ 'de boom'         => 'the tree' ],
    [ 'het blad'        => 'the leaf' ],
    [ 'het park'        => 'the park' ],
    [ 'de bloem'        => 'the flower' ],
    [ 'het mes'         => 'the knife' ],
    [ 'de vork'         => 'the fork' ],
    [ 'de lepel'        => 'the spoon' ],
    [ 'het bord'        => 'the plate' ],
    [ 'de groep'        => 'the group' ],
    [ 'de winkel'       => 'the store' ],
    [ 'de verkoper'     => 'the seller' ],
    [ 'de prijs'        => 'the price' ],
    [ 'de boodschappen' => 'the groceries' ],
    [ 'de pijn'         => 'the pain' ],
    [ 'de buurt'        => 'the neighborhood' ],
    [ 'de stad'         => 'the city' ],
    [ 'het voorbeeld'   => 'the example' ],
    [ 'het begin'       => 'the beginning' ],
    [ 'het eind'        => 'the end' ],
    [ 'de foto'         => 'the photograph' ],
    [ 'de sport'        => 'the sport' ],
    [ 'de toets'        => 'the test' ],
    [ 'de klas'         => 'the class' ],
    [ 'de juf'          => 'the teacher' ]
    , # "juf" is female teacher. The male equivalent would be "meester" (master)
    [ 'de les'    => 'the lesson' ],
    [ 'de school' => 'the school' ],
    [ 'het land'  => 'the country' ],
    [ 'het land'  => 'the land' ]       # as an area, not a particular country)
    ,
    [ 'de wereld'    => 'the world' ],
    [ 'het slot'     => 'the lock' ],
    [ 'de tent'      => 'the tent' ],
    [ 'het uur'      => 'the hour' ],
    [ 'het internet' => 'the internet' ],
    [ 'het gesprek'  => 'the conversation' ],
    [ 'het probleem' => 'the problem' ],
    [ 'de website'   => 'the website' ],
    [ 'het contact'  => 'the contact' ],
    [ 'de politie'   => 'the police' ],
    [ 'het stuk'     => 'the piece' ],
    [ 'de meter'     => 'the meter' ],
    [ 'de brand'     => 'the fire' ],

    # some "too easy" but important words
    [ 'ja'    => 'yes' ],
    [ 'nee'   => 'no' ],
    [ 'klein' => 'small' ],
    [ 'groot' => 'big' ],
    [ 'goed'  => 'good' ],
    [ 'oke' => 'okay' ], # should be "ok\N{U+00E9}", but whatever (or just 'ok')
    [ 'drinken' => 'drink' ],
    [ 'eten'    => 'eat' ],
    [ 'plus'    => 'plus' ],
    [ 'warm'    => 'warm' ],
    [ 'lekker'  => 'nice' ], # good, tasty, etc., (well, ACTUALLY... digression)
    [ 'werk'    => 'work' ],
    [ 'hallo'   => 'hello' ],
    [ 'tot ziens' => 'see you' ],
    [ 'hoi'       => 'hi' ],
    [ 'jong'      => 'young' ],
    [ 'oud'       => 'old' ],
    [ 'vrij'      => 'free' ],
    [ 'half'      => 'half' ],
    [ 'bier'      => 'beer' ],

# common_sentences pulled from:
# http://frequencylists.blogspot.com/2016/06/5000-dutch-sentences-sorted-from.html
    [ "Ik ben het."              => "It's me." ],
    [ "Het is een van mij."      => "It's one of mine." ],
    [ "Wat is het?"              => "What is it?" ],
    [ "Ik kan het."              => "I can do it." ],
    [ "Zo is het niet."          => "It is not so." ],
    [ "Wat is dat?"              => "What is it?" ],
    [ "Wat is dat?"              => "What's that?" ],
    [ "Ik weet het niet."        => "I don't know." ],
    [ "Ik weet het niet."        => "I dinnae ken." ],
    [ "Wat heb ik?"              => "What do I have?" ],
    [ "Ik weet niet wat dat is." => "I don't know what it is." ],
    [ "Ik weet niet wat dat is." => "I don't know what that is." ],
    [ "Hij weet het niet."       => "He does not know." ],
    [ "Dat is niet waar."        => "That's not true." ],
    [ "Dat is niet waar."        => "It is not so." ],
    [ "Dat is niet waar."        => "That is not true." ],
    [ "Ik wil het niet meer."    => "I don't want it anymore." ],
    [ "Het kan niet waar zijn."  => "It cannot be true." ],
    [ "Het kan niet waar zijn."  => "It can not be true." ],
    [ "Het kan niet waar zijn."  => "It can't be true." ],
    [
        "Ik weet dat je weet dat ik het weet." =>
          "I know that you know that I know."
    ],
    [ "Ik weet niet waar het is."       => "I do not know where it is." ],
    [ "Je weet dat het waar is."        => "You know it's true." ],
    [ "Ik heb een boek."                => "I have a book." ],
    [ "Ik weet het nog niet."           => "I don't know yet." ],
    [ "Ik weet het nog niet."           => "I still don't know that." ],
    [ "Hij is niet mijn vader."         => "He's not my father." ],
    [ "Hij is mijn vader niet."         => "He's not my father." ],
    [ "Dat kan niet waar zijn!"         => "It can't be!" ],
    [ "Dat kan niet waar zijn."         => "That can't be true." ],
    [ "Dat kan niet waar zijn."         => "That cannot be true." ],
    [ "Dat kan niet waar zijn."         => "It cannot be true." ],
    [ "Dat kan niet waar zijn."         => "It can't be true." ],
    [ "Ik weet niet of ik het nog heb." => "I don't know if I still have it." ],
    [ "Het boek is van mij."            => "The book is mine." ],
    [ "Maar ik wil niet."               => "But I don't want to." ],
    [ "Ik kan het niet met je eens zijn." => "I can't agree with you." ],
    [ "Dat is het leven."            => "That's the way the cookie crumbles." ],
    [ "Dat is het leven."            => "That's life." ],
    [ "Ik hou van je."               => "I love you." ],
    [ "Ze is niet hier."             => "She's not here." ],
    [ "Ik hou van je!"               => "I love you!" ],
    [ "Ik ben in het huis."          => "I am in the house." ],
    [ "Ik ben in het huis."          => "I'm in the house." ],
    [ "Ik weet van waar hij is."     => "I know where he comes from." ],
    [ "Ik ben in de auto."           => "I'm in the car." ],
    [ "Je tijd is om."               => "Your time is over." ],
    [ "Ben ik de vader?"             => "Am I the father?" ],
    [ "We zijn er nog niet."         => "We're not there yet." ],
    [ "Ik weet niet of het waar is." => "I don't know if it is true." ],
    [ "Het kan waar zijn of niet."   => "It may or may not be true." ],
    [ "Ik hou niet meer van je."     => "I no longer love you." ],
    [ "Ik heb dit boek niet."        => "I don't have this book." ],
    [ "Heb je een auto?"             => "Do you have a car?" ],
    [ "Heb je een auto?"             => "Have you got a car?" ],
    [ "Waar heb je het over?"        => "What are you talking about?" ],
    [ "Ik weet niet of hij het weet." => "I don't know if he knows it." ],
    [ "Ik denk dat het waar is."      => "I think it's true." ],
    [ "Ik denk dat het waar is."      => "I think it true." ],
    [ "Ik denk dat het waar is."      => "I think that it's true." ],
    [ "Dit is een boek."              => "This is a book." ],
    [ "Dat is zijn auto."             => "That is his car." ],
    [ "Dit is een boek."              => "That's a book." ],
    [ "Het is dit boek."              => "It's this book." ],
    [ "Ga je dan niet?"               => "Won't you go?" ],
    [ "Ik heb een auto."              => "I have a car." ],
    [ "Hou je van me?"                => "Do you love me?" ],
    [ "Ze is nog niet hier."          => "She is not here yet." ],
    [ "Dit kan niet waar zijn."       => "This can't be true." ],
    [ "Ik weet niet waar ze zijn."    => "I don't know where they are." ],
    [ "Ik ben niet van gisteren."     => "I was not born yesterday." ],
    [ "Dat huis is van mij."          => "That house is mine." ],
    [
        "Wat goed is voor u, is goed voor mij." =>
          "What is good for you, is good for me."
    ],
    [ "En waar is dat goed voor?"    => "What good will that do?" ],
    [ "Waar ben je?"                 => "Where are you?" ],
    [ "Waar wil je dat voor hebben?" => "What do you want that for?" ],
    [ "Ik hou niet meer van haar."   => "I don't love her anymore." ],
    [ "Dit is mijn boek."            => "This is my book." ],
    [ "Ik heb geen tijd voor u."     => "I don't have time for you." ],
    [ "Ik hou van haar."             => "I love her." ],
    [ "Ik hou niet meer van hem."    => "I do not love him any longer." ],
    [ "Ik hou niet meer van hem."    => "I no longer love him." ],
    [ "Ik weet niet of ik tijd heb." => "I don't know if I have the time." ],
    [ "Ik weet niet of ik tijd heb." => "I don't know if I'll have time." ],
    [ "Ik kon het niet meer aan."    => "I couldn't take it anymore." ],
    [ "Het is al te laat."           => "It's already too late." ],
    [ "Dit boek is van mij."         => "This book is mine." ],
    [ "Hij heeft een auto."          => "He has a car." ],
    [ "Ik ben te laat, of niet?"     => "I'm late, aren't I?" ],
    [ "Ik heb geen tijd."            => "I have no time." ],
    [ "Ik heb geen tijd."            => "I don't have time." ],
    [ "Dit is mijn vader."           => "This is my father." ],
    [ "Het huis bij het meer is van mij." => "The house by the lake is mine." ],
    [ "Ze zijn er al."                    => "They're already here." ],
    [ "Weet hij dat je van hem houdt?"  => "Does he know that you love him?" ],
    [ "Ik kan zo niet leven."           => "I can't live that kind of life." ],
    [ "Weet je nog?"                    => "Do you remember?" ],
    [ "Het is laat."                    => "It's late." ],
    [ "Het is een uur."                 => "It's one o'clock." ],
    [ "Hoe weet ge dat het van hem is?" => "How do you know that it's his?" ],
    [ "Weet ik veel!"                   => "How should I know?" ],
    [ "Ik heb met je te doen."          => "I feel for you." ],
    [ "Hier zijn we dan."               => "Here we are." ],
    [ "Waar is het boek?"               => "Where is the book?" ],
    [ "Ik wil het ook!"                 => "I also want it!" ],
    [ "Is er een kamer voor mij?"       => "Is there any room for me?" ],
    [ "Ik heb niets om voor te leven."  => "I have nothing to live for." ],
    [ "Dit is haar boek."               => "This is her book." ],
    [ "Hou je van mij?"                 => "Do you love me?" ],
    [ "Ik ben het met hem eens."        => "I agree with him." ],
    [
        "Ik denk dat ik het niet met je eens bent." =>
          "I guess I don't agree with you."
    ],
    [ "Het is van mijn broer."           => "It's my brother's." ],
    [ "Ik wil veel meer."                => "I want a lot more." ],
    [ "Dit is zijn huis."                => "This is his house." ],
    [ "Ik wil veel meer."                => "I want much more." ],
    [ "Hij is altijd op tijd."           => "He's always on time." ],
    [ "Ik hou heel veel van je."         => "I love you very much." ],
    [ "Hij is al een man."               => "He's already a man." ],
    [ "Ik heb niet veel geld."           => "I don't have much money." ],
    [ "Waar is je vader?"                => "Where is your father?" ],
    [ "Ik denk dat je daar niet was."    => "I guess you weren't there." ],
    [ "Het is tijd om te gaan voor ons." => "It's time for us to go." ],
    [ "Dat is alles wat ik weet."        => "That's all I know." ],
    [
        "Dit zijn mijn boeken, dat zijn die van hem." =>
          "These are my books, those are his."
    ],
    [ "Ik wil naar huis." => "I want to go home." ],
    [ "Dit is mijn auto." => "This is my car." ],
    [ "Dit is mijn auto." => "This car is mine." ],
    [
        "Wat denk je dat ik aan het doen was?" =>
          "What do you think I've been doing?"
    ],
    [ "Het is te groot." => "It's too big." ],
    [
        "Dat is alles wat ik over hem weet." =>
          "This is all that I know about him."
    ],
    [ "Wat vroeg hij je?"                 => "What did he ask you?" ],
    [ "Het is tijd om naar huis te gaan." => "It's time to go home." ],
    [ "Het is al laat."                   => "It's already late." ],
    [ "Hij weet niet wie ik ben."         => "He doesn't know who I am." ],
    [ "Dat gaat je niets aan."            => "It's none of your business." ],
    [ "Ik heb dit boek al uit."    => "I have already finished this book." ],
    [ "Morgen kan het mij zijn."   => "Tomorrow it might be me." ],
    [ "Over wie heb je het?"       => "To whom are you referring?" ],
    [ "Over wie heb je het?"       => "Who are you talking about?" ],
    [ "Het is laat, ik moet gaan." => "It's late, I have to go." ],
    [ "Ik weet van niets."         => "I don't know anything." ],
    [ "Ze kan hier zo vroeg niet zijn." => "She cannot be here so early." ],
    [ "Ik heb te veel te doen."         => "I've got too much to do." ],
    [ "Ik ga waar ik wil."              => "I go where I please." ],
    [
        "Het is al tijd om naar huis te gaan." =>
          "It's already time to go home."
    ],
    [ "Heb je veel geld bij je?" => "Do you have much money with you?" ],
    [ "Het is niet zo erg als het lijkt." => "It's not as bad as it seems." ],
    [ "Het is de grote."                  => "It's the big one." ],
    [ "Wat is hij aan het doen?"          => "What is he doing?" ],
    [
        "Dit is van mij, en dit is van jou." =>
          "This is mine, and this is yours."
    ],
    [ "Wat was je aan het doen?" => "What were you doing?" ],
    [ "Ik wil niet naar school." => "I don't want to go to school." ],
    [ "Dit is haar huis."        => "This is her house." ],
    [
        "Dit zijn mijn boeken, die zijn van hem." =>
          "These are my books; those are his."
    ],
    [ "Dat is mijn school."           => "That is my school." ],
    [ "Ik heb geen geld."             => "I do not have any money." ],
    [ "Ik heb geen geld."             => "I have no money." ],
    [ "Ik heb geen geld."             => "I don't have any money." ],
    [ "Ik heb geen geld."             => "I don't have money." ],
    [ "Ik weet niet hoe laat het is." => "I don't know what time it is." ],
    [ "Ik weet niet hoe laat het is." => "I don't know what the time is." ],
    [
        "Is er iets dat ik voor u kan doen?" =>
          "Is there anything that I can do for you?"
    ],
    [ "Wat ben je aan het doen?" => "What are you doing?" ],
    [ "Wat ben je aan het doen?" => "What do you do?" ],
    [ "Hoe gaat het met je?"     => "How are you?" ],
    [ "Ze is niet meer alleen."  => "She isn't alone anymore." ],
    [
        "Hij is mijn broer, niet mijn vader." =>
          "He is my brother, not my father."
    ],
    [ "Ik hou van mijn huis."         => "I like my house." ],
    [ "Kan je dat doen? Ik denk het." => "Can you do that? I think so." ],
    [ "Wie denk je dat ik ben?"       => "Who do you think I am?" ],
    [ "Hij houdt van haar."           => "He loves her." ],
    [ "Je weet heel goed wat ze wil." => "You know very well what she wants." ],
    [ "Mijn huis is hier."            => "My house is here." ],
    [ "Van wie is dat boek?"          => "Whose book is that?" ],
    [ "Van wie is dat boek?"          => "Whose is that book?" ],
    [ "Ik denk dat hij niet komt."    => "I think he won't come." ],
    [ "Ik denk niet dat hij komt."    => "I think he won't come." ],
    [ "Ik denk niet dat hij komt."    => "I do not think that he will come." ],
    [ "Ik denk niet dat hij komt."    => "I don't think he will come." ],
    [
        "Het is nu te laat om nog uit te gaan." =>
          "It is too late to go out now."
    ],
    [
        "Dat huis is veel beter dan het deze." =>
          "That house is much better than this."
    ],
    [ "De hond is in het huis." => "The dog is in the house." ],
    [ "Mij gaat het goed."      => "I'm doing fine." ],
    [ "Maar ik heb geen geld."  => "But I don't have money." ],
    [ "Maar ik heb geen geld."  => "But I have no money." ],
    [ "Ook dat is waar."        => "That's true as well." ],
    [ "Ook dat is waar."        => "That's true, too." ],
    [ "Ik weet wie ik ben."     => "I know who I am." ],
    [ "Je moet gaan."           => "You have to go." ],
    [ "Dat is alles."           => "That's all." ],
    [ "Ik weet het echt niet."  => "I really don't know." ],
    [
        "Er moet iets zijn dat je kan doen." =>
          "There must be something you can do."
    ],
    [
        "Het is beter voor je om het nu te doen." =>
          "It is better for you to do it now."
    ],
    [
        "Ik weet niet wat ik nog meer kan doen." =>
          "I don't know what else to do."
    ],
    [ "Hij wil het geld." => "He wants the money." ],
    [
        "Ik weet niet wanneer hij hier zal zijn." =>
          "I don't know when he will be here."
    ],
    [ "Ik hou van mijn moeder."     => "I love my mum." ],
    [ "We hebben niet veel tijd."   => "There isn't much time." ],
    [ "We hebben niet veel tijd."   => "We don't have much time." ],
    [ "Is er iets dat ik kan doen?" => "Is there anything I can do?" ],
    [ "Ik heb een hond."            => "I have a dog." ],
    [
        "Ik weet dat geld niet alles is." =>
          "I know that money isn't everything."
    ],
    [ "Waar denk je aan?" => "What are you thinking about?" ],
    [
        "Het probleem is dat ik geen geld bij me heb." =>
          "The trouble is that I have no money with me."
    ],
    [ "Ik was op school." => "I was at school." ],
    [
        "Ik weet niet meer wat ik moet doen." =>
          "I don't know what to do anymore."
    ],
    [ "Hij kwam niet op tijd."             => "He didn't come on time." ],
    [ "Vandaag is je dag niet."            => "Today is not your day." ],
    [ "Hoe komt het dat je dit niet weet?" => "How come you don't know this?" ],
    [ "Wat hij zei, is niet waar."         => "What he said is not true." ],
    [
        "Waar een wil is, is een weg." =>
          "Where there's a will, there's a way."
    ],
    [ "Wat wil je met haar doen?"      => "What do you want to do to her?" ],
    [ "Hoe weet je dat?"               => "How do you know that?" ],
    [ "Ze houdt van hem."              => "She is in love with him." ],
    [ "Ik heb niets met hem van doen." => "I have nothing to do with him." ],
    [ "Met mij gaat het ook goed."     => "I'm fine too." ],
    [ "Hoe gaat het met je vader?"     => "How's your father?" ],
    [ "Ik wil geen geld."              => "I do not want any money." ],
    [
        "Het probleem is dat hij geen geld heeft." =>
          "The trouble is he has no money."
    ],
    [ "Hij is zo groot als zijn vader."    => "He is as tall as his father." ],
    [ "Ik heb nu geen tijd."               => "I don't have time now." ],
    [ "Er is hier niets."                  => "There is nothing here." ],
    [ "Wat een groot huis heb je!"         => "What a big house you have!" ],
    [ "Ik ben een vrouw."                  => "I am a woman." ],
    [ "Ik heb een probleem met mijn auto." => "I have a problem with my car." ],
    [ "Ik weet niets over hem."         => "I don't know anything about him." ],
    [ "Vandaag is mijn dag niet."       => "Today is not my day." ],
    [ "Dit is een vriend van mij."      => "This is a friend of mine." ],
    [ "Dat was niet de eerste keer."    => "It wasn't the first time." ],
    [ "Ik was te laat op school."       => "I was late to school." ],
    [ "Laat dat maar aan mij over."     => "Let me handle this." ],
    [ "Ik ben niet bang."               => "I'm not afraid." ],
    [ "Ik ben niet bang."               => "I am not afraid." ],
    [ "Wat is hij van plan?"            => "What is he up to?" ],
    [ "Is dit uw boek?"                 => "Is this your book?" ],
    [ "Hij is mijn broer."              => "He is my brother." ],
    [ "Hij heeft een hond."             => "He has a dog." ],
    [ "Heeft hij een hond?"             => "Does he have a dog?" ],
    [ "Ik heb geen zin om uit te gaan." => "I don't feel like going out." ],
    [
        "Je was niet op school gisteren." =>
          "You were absent from school yesterday."
    ],
    [ "Ik ben niet aan het eten." => "I am not eating." ],
    [ "Ik denk dat ik nu ga."     => "I guess I'll be going now." ],
    [
        "Dat huis is veel beter dan dit." =>
          "That house is much better than this."
    ],
    [ "Ik moet naar huis gaan." => "I have to go home." ],
    [ "Ik heb genoeg van hem."  => "I'm fed up with him." ],
    [ "Dit is te groot."        => "This is too big." ],
    [ "Hij heeft veel geld."    => "He has a lot of money." ],
    [
        "Ik was deze morgen niet op tijd op school." =>
          "I wasn't on time for school this morning."
    ],
    [ "Wat hij zei was niet waar."         => "What he said was not true." ],
    [ "Ik wil niet alleen gaan."           => "I don't want to go alone." ],
    [ "Dit is te lang."                    => "This is too long." ],
    [ "Ik had geen weet van zijn plan."    => "I was ignorant of his plan." ],
    [ "Hij zou in staat zijn dat te doen." => "That he would be able to do." ],
    [ "Waar of niet waar?"                 => "True or false?" ],
    [ "Deze hond is van mij."              => "This dog is mine." ],
    [
        "Tegen die tijd is het al te laat." =>
          "By then it will already be too late."
    ],
    [ "Ik ben niet meer bang." => "I'm not afraid any more." ],
    [ "Ik heb een oude auto."  => "I have an old car." ],
    [
        "Hij heeft geen geld voor een nieuwe auto." =>
          "He does not have the money for buying a new car."
    ],
    [
        "Het probleem is dat we niet veel geld hebben." =>
          "The problem is that we don't have a lot of money."
    ],
    [ "Dit is een hond."              => "This is a dog." ],
    [ "Ik heb geen tijd voor jullie." => "I don't have time for you." ],
    [ "Ben je in de stad?"            => "Aren't you in town?" ],
    [
        "Deze boeken zijn van mij en die boeken zijn van hem." =>
          "These books are mine and those books are his."
    ],
    [ "Heb je nu tijd?"      => "Are you free now?" ],
    [ "Ik ben graag alleen." => "I like being alone." ],
    [ "Ik zal het doen."     => "I will." ],
    [
        "Ik zal mijn leven leven, met of zonder haar." =>
          "I'm going to live my life, with or without her."
    ],
    [
        "De vraag is of hij het kan doen of niet." =>
          "The question is whether he can do it or not."
    ],
    [ "Ik heb geen broer."     => "I don't have any brothers." ],
    [ "Het is te heet."        => "It's too hot." ],
    [ "Ik heb geen broer."     => "I don't have a brother." ],
    [ "Het is te heet."        => "It is too hot." ],
    [ "Ze zijn bang voor hem." => "They're afraid of him." ],
    [ "Ik heb een vraag."      => "I have a question." ],
    [ "Ik heb een vraag."      => "I've got a question." ],
    [ "Het maakt me niet uit als het heet is." => "I don't mind if it's hot." ],
    [ "Hij heeft te veel boeken."              => "He has too many books." ],
    [ "Het is alles wat ik wil doen."          => "It is all I want to do." ],
    [ "Ik zal gaan als hij terug is." => "I will go when he comes back." ],
    [
        "Hij was gisteren niet op school." =>
          "He was absent from school yesterday."
    ],
    [
        "Dat is het huis waar hij woont." => "That is the house where he lives."
    ],
    [ "Hij kan niet ouder dan ik zijn." => "He cannot be older than I." ],
    [ "Hij kan niet ouder dan ik zijn." => "He can't be older than me." ],
    [ "Weet je wat hij zei?"            => "Do you know what he said?" ],
    [ "Wie ben ik?"                     => "Who am I?" ],
    [
        "Ze heeft geen geld voor een nieuwe auto." =>
          "She does not have the money for buying a new car."
    ],
    [ "Waar is de school?" => "Where is the school?" ],
    [
        "Ik heb een vriend die van mij houdt." =>
          "I have a friend who loves me."
    ],
    [
        "Ik heb een vriend die van mij houdt." =>
          "I have a boyfriend who loves me."
    ],
    [ "Ik wist niet dat hij er was." => "I didn't know that he was there." ],
    [ "Wat was hij van plan?"        => "What was he up to?" ],
    [ "Ze had niet veel geld."       => "She didn't have much money." ],
    [ "Het maakt niet uit."          => "It doesn't matter." ],
    [
        "Ik was daar op tijd, maar ik zag je niet!" =>
          "I was there on time, but I didn't see you!"
    ],
    [ "Je bent altijd te laat."           => "You are always late." ],
    [ "Waar is je school?"                => "Where is your school?" ],
    [ "Waar is je school?"                => "Where's your school?" ],
    [ "Wat denk jij van hem?"             => "What do you think of him?" ],
    [ "Het is nooit te laat om te leren." => "It is never too late to learn." ],
    [
        "De kamer van mijn vader is heel groot." =>
          "My father's room is very big."
    ],
    [ "Ik weet alleen dit."       => "I know only this." ],
    [ "Hij staat niet vroeg op."  => "He does not get up early." ],
    [ "Ik was geen goede moeder." => "I was not a good mother." ],
    [ "Van wie is die auto?"      => "Whose car is this?" ],
    [ "Het maakt niet meer uit."  => "It doesn't matter anymore." ],
    [ "Deze zin is van mij."      => "This sentence is mine." ],
    [ "Naar waar gaan we?"        => "Where are we going?" ],
    [
        "Hij is de vader van drie kinderen." =>
          "He is the father of three children."
    ],
    [ "Dit is mijn broer."               => "This is my brother." ],
    [ "Weet je zijn naam niet?"          => "Don't you know his name?" ],
    [ "Ik ben het helemaal met je eens." => "I quite agree with you." ],
    [ "Het boek is groot."               => "The book is big." ],
    [
        "Is er nog iets dat je moet doen vandaag?" =>
          "Is there anything you need to do today?"
    ],
    [ "Je zou niet alleen moeten gaan." => "You should not go alone." ],
    [ "Het is alles of niets."          => "It's all or nothing." ],
    [ "We hebben veel tijd."            => "We have a lot of time." ],
    [ "Wat kan je nog meer doen?"       => "What else can you do?" ],
    [ "Ik heb nu wat geld."             => "I have a little money now." ],
    [ "Ik ben een oude man."            => "I'm an old man." ],
    [
        "Gisteren was u niet op school." =>
          "You were absent from school yesterday."
    ],
    [ "Hoe gaat het vandaag met je?" => "How are you today?" ],
    [
        "Dat zou ik niet doen als ik jou was." =>
          "I wouldn't do that if I were you."
    ],
    [ "Ik zal het nooit meer doen."       => "I will not do it again." ],
    [ "Mijn vader houdt van mijn moeder." => "My father loves my mother." ],
    [ "Wat is het probleem?"              => "Where is the problem?" ],
    [ "Dat was mijn zin!"                 => "That's my line!" ],
    [ "Dit is een zin."                   => "This is a sentence." ],
    [
        "Zijn huis is drie keer zo groot als dat van mij." =>
          "His house is three times as big as mine."
    ],
    [ "Ik hou van mijn vrouw." => "I love my wife." ],
    [ "Is er een probleem?"    => "Is there a problem?" ],
    [
        "Ik was op zoek naar iets wat er niet was." =>
          "I was searching for something that didn't exist."
    ],
    [
        "Mijn kamer is twee keer zo groot als die van hem." =>
          "My room is twice as big as his."
    ],
    [
        "Ze vroeg hoe het met zijn vader ging." =>
          "She asked how his father was."
    ],
    [
        "Er is een probleem dat je niet ziet." =>
          "There's a problem there that you don't see."
    ],
    [ "Zijn auto lijkt op die van mij." => "His car is similar to mine." ],
    [
        "Ik weet niet of ik genoeg geld heb." =>
          "I don't know if I have enough money."
    ],
    [ "Hoe laat is het?"    => "What time is it?" ],
    [ "Hij is zijn vriend." => "He is his friend." ],
    [
        "Je hoeft niet te gaan, als je dat niet wil." =>
          "If you don't want to go, you don't have to."
    ],
    [
        "Er zijn veel boeken in mijn kamer." =>
          "There are many books in my room."
    ],
    [ "Je moet vroeg naar huis gaan."     => "You should go home early." ],
    [ "Je vader is groot."                => "Your father is tall." ],
    [ "Denk voor je spreekt."             => "Think before you speak." ],
    [ "Ik kan je hier niet alleen laten." => "I can't leave you here alone." ],
    [ "Ik wil het niet nog eens doen."    => "I don't want to do it again." ],
    [
        "Ik weet niet wat ik van nu af aan moet doen." =>
          "I don't know what to do from now on."
    ],
    [
        "Ik hou van haar en zij houdt van mij." =>
          "I love her and she loves me."
    ],
    [ "Ik ken haar niet zo goed." => "I don't know her very well." ],
    [ "Ik ben een jongen."        => "I am a boy." ],
    [
        "Ik dacht niet dat het zo veel zou zijn." =>
          "I didn't think it would be that much."
    ],
    [ "Ik wil het niet zien."           => "I don't want to see it." ],
    [ "Hij is mijn vriend."             => "He is my friend." ],
    [ "De vraag is dit."                => "The question is this." ],
    [ "Hij is mijn vriend."             => "He's my friend." ],
    [ "Hij is een oude vriend van mij." => "He is an old friend of mine." ],
    [ "Hij is een oude vriend van mij." => "He's an old friend of mine." ],
    [ "Je moet het me leren."           => "You must teach it to me." ],
    [ "Je was mijn vriend."             => "You were my friend." ],
    [ "Ik ben van niets bang."          => "I'm not frightened of anything." ],
    [ "Hij gaf hem een boek."           => "He gave him a book." ],
    [ "Ik ben van niets bang."          => "I'm not afraid of anything." ],
    [
        "En ik weet dat je het niet voor mij gedaan hebt." =>
          "And I know you didn't do it for me."
    ],
    [ "Ik ben hier al twee uur." => "I have been here for two hours." ],
    [ "Het is voor één van mijn vrienden." => "It's for a friend of mine." ],
    [ "Het is voor een van mijn vrienden." => "It's for a friend of mine." ],
    [
        "Ik wist het niet, dat hij daar was." =>
          "I didn't know that he was there."
    ],
    [ "Wat moet er van haar worden?" => "What will become of her?" ],
    [ "Zo is het genoeg."            => "That will do." ],
    [ "Ik ben blij dat ik er was."   => "I'm glad I was there." ],
    [ "Ik heb geen tijd voor jou."   => "I don't have time for you." ],
    [ "Wat wil je doen?"             => "What do you want to do?" ],
    [ "Ik ken haar niet."            => "I don't know her." ],
    [ "Vandaag gaat het mij goed."   => "I feel good today." ],
    [ "Wat is je naam?"              => "What is your name?" ],
    [ "Ik heb veel boeken."          => "I have many books." ],
    [ "Wat is je naam?"              => "What's your name?" ],
    [ "Ik heb veel boeken."          => "I have a lot of books." ],
    [ "Ze vroeg mij het te doen."    => "She asked me to do it." ],
    [
        "Ik zou naar de film gaan, als ik tijd zou hebben." =>
          "I would go to the movies if I had the time."
    ],
    [ "Hier ben ik niet zeker van."  => "I'm not sure about this." ],
    [ "Hij heeft geen kinderen."     => "He has no children." ],
    [ "Hij heeft geen kinderen."     => "He hasn't any children." ],
    [ "Hij heeft geen kinderen."     => "He doesn't have any children." ],
    [ "Laat me niet alleen!"         => "Don't leave me by myself!" ],
    [ "Ik heb veel te doen vandaag." => "I have a lot to do today." ],
    [ "Ik ken hem niet."             => "I don't know him." ],
    [ "Ik wil een vriend."           => "I want a friend." ],
    [
        "Hoe komt het dat je zo goed Engels kan?" =>
          "How come you know English so well?"
    ],
    [ "Dit is de eerste keer."          => "This is the first time." ],
    [ "Dit huis is niet heel groot."    => "This house is not very big." ],
    [ "Dit is de jongen."               => "This is the boy." ],
    [ "Snel! We hebben niet veel tijd." => "Be quick! We haven't much time." ],
    [ "Moet ik nu gaan?"                => "Do I have to go now?" ],
    [ "Waar is mijn hond?"              => "Where is my dog?" ],
    [ "Wat moet ik doen?"               => "What am I to do?" ],
    [ "Wat moet ik doen?"               => "What do I have to do?" ],
    [ "Waar gaat dit boek over?"        => "What is the book about?" ],
    [ "Ik weet waar je woont."          => "I know where you live." ],
    [ "Hij is geen jongen meer."        => "He's not a boy anymore." ],
    [ "Ik heb zin om uit te gaan vandaag." => "I feel like going out today." ],
    [ "Het water is goed."                 => "The water is good." ],
    [ "Hij is haar vriend."                => "He's her friend." ],
    [ "Hij is haar vriend."                => "He is her friend." ],
    [ "We hebben veel te doen."            => "We have lots of things to do." ],
    [ "Ik vroeg hem naar zijn naam." => "I asked him what his name was." ],
    [ "Hoe gaat het met je broer?"   => "How's your brother?" ],
    [ "Hij is niet langer dan ik."   => "He is not taller than I." ],
    [ "De tijd gaat snel om."        => "Time is going by very quickly." ],
    [ "Ik ga naar school."           => "I go to school." ],
    [ "Hoe gaat het met je vrouw?"   => "How's your wife?" ],
    [ "Hoe gaat het met je vrouw?"   => "How's your wife doing?" ],
    [ "Is dit wat je wilde?"         => "Is this what you wanted?" ],
    [ "Om het even wie van u kan het doen." => "Any of you can do it." ],
    [
        "Wat denk je, wat zou ze gaan doen?" =>
          "What do you think she is going to do?"
    ],
    [ "Er is niemand in de kamer." => "There's no one in the room." ],
    [
        "Ik hou meer van jou dan jij van mij." =>
          "I love you more than you love me."
    ],
    [ "Hij zal over een uur terug zijn." => "He will be back in an hour." ],
    [ "Ik ken u niet."                   => "I don't know you." ],
    [ "Dit is geen zin."                 => "This is not a sentence." ],
    [ "Vandaag is het niet jouw dag."    => "Today is not your day." ],
    [
        "Als ik tijd had, ging ik naar de film." =>
          "I would go to the movies if I had the time."
    ],
    [ "Dat huis is groot."           => "That house is big." ],
    [ "Is dit van jou?"              => "Is this yours?" ],
    [ "Ik wil iets om te eten."      => "I want something to eat." ],
    [ "Hoe gaat het?"                => "How are you doing?" ],
    [ "Hij komt ook niet."           => "He isn't coming, either." ],
    [ "Haar vader is groot."         => "Her father is tall." ],
    [ "Ik kwam hier gisteren aan."   => "I arrived here yesterday." ],
    [ "Ik wil naar de stad gaan."    => "I want to go to the city." ],
    [ "Dit is mijn vriend."          => "This is my friend." ],
    [ "Wat wil je dat ik doe?"       => "What do you want me to do?" ],
    [ "Wat wil je dat ik doe?"       => "What would you have me do?" ],
    [ "Ik had geen tijd om te eten." => "I had no time to eat." ],
    [
        "De man die daar staat is mijn vader." =>
          "The man who is standing over there is my father."
    ],
    [ "Hoe gaat het met mijn vrouw?" => "How's my wife doing?" ],
    [ "Hij woont hier niet meer."    => "He doesn't live here anymore." ],
    [ "Ik ben zo terug."             => "I will be back soon." ],
    [ "Ik ben zo terug."             => "I'll be back soon." ],
    [ "Ik ben zo terug."             => "I'll be back in a wink." ],
    [ "Ik ben zo terug."             => "I'll be right back." ],
    [ "Ik ben zo terug."             => "I'll be back in a jiffy." ],
    [ "Ik ben zo terug."             => "I'll be back right away." ],
    [ "Is hij al terug?"             => "Is he back already?" ],
    [
        "Je kwam gisteren niet naar school." =>
          "You did not come to school yesterday."
    ],
    [ "Heb je vandaag iets te doen?" => "Are you busy today?" ],
    [ "Iets is beter dan niets."     => "Something is better than nothing." ],
    [ "Ik heb een kat en een hond."  => "I have a cat and a dog." ],
    [
        "Zij weet dat ik weet dat zij het weet." =>
          "She knows I know that she knows."
    ],
    [
        "Denk jij dat hij op zijn vader lijkt?" =>
          "Do you think he resembles his father?"
    ],
    [ "Heb je twee boeken?" => "Do you have two books?" ],
    [
        "Hij was helemaal alleen in het huis." =>
          "He was all alone in the house."
    ],
    [ "Dit boek is van jou."           => "This book is yours." ],
    [ "Hij is groter dan ik."          => "He is taller than I." ],
    [ "Hij is groter dan ik."          => "He's taller than me." ],
    [ "Ik weet niet wanneer hij komt." => "I don't know when he will come." ],
    [ "Kan je dat nog eens doen?"      => "Can you do that again?" ],
    [ "Er is iemand aan de deur."      => "Someone is at the door." ],
    [ "Als hij tijd heeft, zal hij komen." => "If he has time, he will come." ],
    [ "Ik werk zo snel als ik kan."        => "I'm working as fast as I can." ],
    [ "Ik zal alles voor u doen."          => "I will do anything for you." ],
    [ "Het is hier erg heet."              => "It's very hot here." ],
    [ "Je wil het niet weten!"             => "You don't want to know it!" ],
    [ "Is dit jouw boek?"                  => "Is this your book?" ],
    [ "Kom je of niet?"                    => "Are you coming or not?" ],
    [ "Mijn vader heeft veel boeken."      => "My father has many books." ],
    [ "Ik weet waar hij woont."            => "I know where he lives." ],
    [ "Mijn vader heeft veel boeken."      => "My father has a lot of books." ],
    [ "Morgen is een nieuwe dag."          => "Tomorrow's a new day." ],
    [ "Het is te mooi om waar te zijn."    => "It's too good to be true." ],
    [
        "Ik weet niet of hij een dokter is." => "I don't know if he's a doctor."
    ],
    [ "Zijn huis is niet ver van hier." => "His house is not far from here." ],
    [ "Kunnen we zo niet beter gaan?"   => "Hadn't we better be going soon?" ],
    [
        "Dit is het boek waar je naar op zoek bent." =>
          "This is the book you are looking for."
    ],
    [ "Is dat wel goed?"                     => "Is that okay?" ],
    [ "Hij zal voor altijd van haar houden." => "He will love her forever." ],
    [
        "Het is vandaag niet zo heet als gisteren." =>
          "It is not so hot today as yesterday."
    ],
    [
        "Het is vandaag niet zo heet als gisteren." =>
          "It's not as hot today as it was yesterday."
    ],
    [
        "Ik weet niet waar mijn horloge is." =>
          "I don't know where my watch is."
    ],
    [
        "Je kan me niets laten doen dat ik niet wil doen." =>
          "You can't make me do anything I don't want to do."
    ],
    [
        "Onze kinderen zijn op school, waar zijn die van u?" =>
          "Our children are at school; where are yours?"
    ],
    [
        "Het maakt mij niet uit of hij wel of niet komt." =>
          "It makes no difference to me whether he comes or not."
    ],
    [ "Heb je iets te eten?" => "Have you anything to eat?" ],
    [
        "Dat is de vrouw die u wil zien." =>
          "That is the woman who wants to see you."
    ],
    [ "Ik denk dat het verhaal waar is." => "I think the story is true." ],
    [ "Hij heeft nog een zoon."          => "He has another son." ],
    [ "Ik denk dat dat werkt."           => "I guess that works." ],
    [
        "We leren niet voor het leven, maar voor school." =>
          "Not for life, but for school do we learn."
    ],
    [
        "Ik zal moeilijk voor je zijn om Engels te spreken." =>
          "It will be hard for you to speak English."
    ],
    [ "Het is niet zo ver."       => "It's not so far." ],
    [ "Ze hebben een groot huis." => "They have a large house." ],
    [
        "Ik zal het hem vragen als hij komt." => "I'll ask him if he will come."
    ],
    [ "Ze was bang voor de hond."   => "She was afraid of the dog." ],
    [ "Dat is mijn kat."            => "That's my cat." ],
    [ "Over een uur kom ik bij je." => "I will come to you in an hour." ],
    [ "Ik ben ouder dan je."        => "I'm older than you." ],
    [
        "Ik wil gewoon een vriend van je zijn, niets meer." =>
          "I just want to be your friend, nothing more."
    ],
    [ "Hij is groter dan zijn vader." => "He is taller than his father." ],
    [
        "Ik vind niet dat ze op haar moeder lijkt." =>
          "I don't think she takes after her mother."
    ],
    [ "Komt alles goed met je?" => "Are you going to be OK?" ],
    [ "Kan je het zien?"        => "Can you see it?" ],
    [ "Was je toen op school?"  => "Were you at school at that time?" ],
    [ "Dit is hun huis."        => "This is their house." ],
    [
        "Het is niet wat je zegt, maar hoe je het zegt." =>
          "It's not what you say, but how you say it."
    ],
    [
        "Ik heb niets meer te doen vandaag." =>
          "I have nothing more to do today."
    ],
    [
        "Ik denk niet dat dat een goed idee is." =>
          "I don't think this is a good idea."
    ],
    [ "Ik ben over een uur terug."     => "I will be back in an hour." ],
    [ "Mijn vader staat vroeg op."     => "My father gets up early." ],
    [ "Hij is twee jaar ouder dan ik." => "He's two years older than me." ],
    [ "Ik weet niet hoe oud ik ben."   => "I don't know how old I am." ],
    [ "Weet je niet hoe hij heet?"     => "Don't you know his name?" ],
    [ "Waar zijn mijn boeken?"         => "Where are my books?" ],
    [ "Ik hou van alle twee."          => "I like both." ],
    [ "Hoe groot is het?"              => "How large is it?" ],
    [
        "Het heeft geen zin om me om geld te vragen." =>
          "It's no use asking me for money."
    ],
    [
        "Hij is een van mijn beste vrienden." => "He is one of my best friends."
    ],
    [ "Jij bent alles wat ik wil." => "All I want is you." ],
    [
        "Ze is niet thuis, maar op school." => "She is not home, but at school."
    ],
    [ "Ik laat het aan jou."                 => "I'll leave it up to you." ],
    [ "Ik weet waar ze woont."               => "I know where she lives." ],
    [ "Het maakt ons niet uit wat hij doet." => "We don't care what he does." ],
    [ "U heeft veel boeken."                 => "You have many books." ],
    [ "U heeft veel boeken."                 => "You have a lot of books." ],
    [ "Wil je niet met me mee?"      => "Don't you want to come along?" ],
    [ "Heb je een eigen kamer?"      => "Do you have a room of your own?" ],
    [ "Het spijt me, ik hou van je." => "I'm sorry, I love you." ],
    [ "Het spijt mij dat ik te laat ben." => "Sorry to be late." ],
    [ "Ik ga niet terug."                 => "I'm not going back." ],
    [ "Ik ben zo blij voor je."           => "I'm so happy for you." ],
    [ "Hij is twee keer zo oud als ik."   => "He is twice as old as I am." ],
    [ "Dat is genoeg voor vandaag."       => "That's enough for today." ],
    [ "Hij heeft een eigen huis."         => "He has a house of his own." ],
    [ "Niemand weet waar het is."         => "Nobody knows where it is." ],
    [ "Ik ben groter dan hij."            => "I'm taller than him." ],
    [ "Ik zal het hem vragen."            => "I'll ask him." ],
    [ "Ik wil je nooit meer zien."   => "I don't ever want to see you again." ],
    [ "We hebben nog veel te leren." => "We've got a lot to learn." ],
    [ "Hij is de grootste van de drie." => "He is the tallest of the three." ],
    [
        "Ze is te jong om naar school te gaan." =>
          "She is too young to go to school."
    ],
    [ "U bent bang voor hem."           => "You're afraid of him." ],
    [ "Deze auto is snel."              => "This car is fast." ],
    [ "Vandaag komt mij niet goed uit." => "Today is not good for me." ],
    [
        "Mijn moeder is niet altijd thuis." =>
          "My mother is not always at home."
    ],
    [ "Ze is twee jaar ouder dan ik." => "She's two years older than me." ],
    [ "Ze is twee jaar ouder dan ik." => "She's two years older than I am." ],
    [
        "Mijn moeder spreekt niet zo erg goed Engels." =>
          "My mom doesn't speak English very well."
    ],
    [ "Hoe laat ga je naar huis?"    => "What time do you go home?" ],
    [ "Ik zou graag een kat hebben." => "I'd like to have a cat." ],
    [ "Ik hou nog steeds van je."    => "I still love you." ],
    [
        "Er is niets om spijt van te hebben." =>
          "There is nothing to regret about."
    ],
    [ "Je moet niet eten." => "You don't have to eat." ],
    [ "Wie is die man?"    => "Who's that man?" ],
    [ "Hier is wat water." => "Here is some water." ],
    [
        "Als je zo gaat doen, ben ik hier weg." =>
          "If you’re going to be like this I’ll just leave."
    ],
    [ "Alles wat hij zei, was waar."  => "Everything he said was right." ],
    [ "Je bent niet zo klein als ik." => "You are not as short as I." ],
    [ "Je bent niet zo klein als ik." => "You aren't as short as I am." ],
    [ "Je bent niet zo klein als ik." => "You aren't as short as me." ],
    [
        "Ik ben bang dat er geen koffie meer over is." =>
          "I'm afraid there isn't any coffee left."
    ],
    [ "Wat is Ken aan het doen?" => "What's Ken doing?" ],
    [ "Deze fiets is van mij."   => "This bicycle belongs to me." ],
    [ "Deze fiets is van mij."   => "This bicycle is mine." ],
    [ "Deze fiets is van mij."   => "The bicycle is mine." ],
    [ "Ik ben er zeker van dat hij zal komen." => "I'm sure he will come." ],
    [ "Heb je vandaag school?"                 => "Do you have school today?" ],
    [ "Maakt niet uit."                        => "Never mind." ],
    [ "Ze staat vroeg op."                     => "She gets up early." ],
    [ "Ik wou dat hij hier was nu."            => "I wish he were here now." ],
    [ "Er is altijd een volgende keer." => "There is always a next time." ],
    [ "Er is altijd een volgende keer." => "There's always a next time." ],
    [
        "Er is niks om bang voor te zijn." => "There's nothing to be afraid of."
    ],
    [ "Er is niks om bang voor te zijn." => "There is nothing to fear." ],
    [ "Ik denk de hele tijd aan jullie." => "I think of you all the time." ],
    [ "Wat heb je nog meer nodig?"       => "What else do you need?" ],
    [ "Heeft u al kinderen?"             => "Do you have children already?" ],
    [
        "We eten om te leven, we leven niet om te eten." =>
          "We eat to live, not live to eat."
    ],
    [ "Zij is niet goed genoeg voor hem." => "She isn't good enough for him." ],
    [ "Ik denk er elke dag over."         => "I think about it every day." ],
    [ "Het ziet er goed uit."             => "Things are looking good." ],
    [ "Ik ken je vader."                  => "I know your father." ],
    [ "Ze heeft meer boeken."             => "She has more books." ],
    [ "Ze heeft meer boeken."             => "She's got more books." ],
    [ "Ik heb een boek in mijn hand."     => "I have a book in my hand." ],
    [ "Ik heb een groot probleem."        => "I have a big problem." ],
    [
        "Het heeft geen zin het hem nog eens te vragen." =>
          "It is no use asking him again."
    ],
    [ "Laten we met de auto gaan." => "Let's go by car." ],
    [ "Ik heb veel vrienden."      => "I have many friends." ],
    [
        "Ze was een kind, maar ze was niet bang." =>
          "She was a child, but she wasn't afraid."
    ],
    [ "Ik ga met de fiets naar het werk." => "I bike to work." ],
    [ "Was je je hond elke dag?" => "Do you wash your dog every day?" ],
    [ "Ze had geen broer."       => "She had no brother." ],
    [ "Ik denk van wel."         => "I do think so." ],
    [ "Ik kan niet spreken."     => "I can't talk." ],
    [ "Ik ben niet oud."         => "I'm not old." ],
    [
        "Mijn vader gaat met de fiets naar zijn werk." =>
          "My father goes to work by bike."
    ],
    [ "Ik weet wie in dit huis woont." => "I know who lives in this house." ],
    [ "Ik heb geen kat."               => "I do not have a cat." ],
    [ "Ze is mijn zus."                => "She's my sister." ],
    [ "Ik heb geen kat."               => "I don't have a cat." ],
    [ "Ik denk dat wat jij zegt waar is." => "I think what you say is true." ],
    [ "Hij is drie jaar ouder dan ik." => "He's three years older than me." ],
    [ "Hij is drie jaar ouder dan ik." => "He's three years older than I am." ],
    [ "Ik heb er geen woorden voor."   => "I'm at a loss for words." ],
    [ "Hij spreekt te snel."           => "He talks too fast." ],
    [ "Mijn moeder staat nooit vroeg op." => "My mother never gets up early." ],
    [ "Je staat in de weg."               => "You are in my way." ],
    [ "Laat me gaan!"                     => "Let me go!" ],
    [ "Mijn broer is net zo groot als ik." => "My brother is as tall as me." ],
    [ "We hebben het heet."                => "We're hot." ],
    [ "Ik ga bij mijn vriend." => "I am going to my friend's house." ],
    [
        "Hij zei dat hij snel terug zou zijn." =>
          "He said that he would be back soon."
    ],
    [ "Maar de koffie is niet goed."  => "But the coffee's not good." ],
    [ "Ik ging gisteren naar school." => "I went to school yesterday." ],
    [ "Als het kan, waarom niet?"     => "If it's possible, why not?" ],
    [ "Weet je welke dag het is?"     => "Do you know what day it is?" ],
    [ "Ik weet wat jouw naam is."     => "I know your name." ],
    [
        "Ik heb een telefoon op mijn kamer." => "I have a telephone in my room."
    ],
    [ "Wat willen ze dat we doen?"   => "What do they want us to do?" ],
    [ "Hoe kan je dat niet weten?"   => "How can you not know?" ],
    [ "Is dit waar je moeder werkt?" => "Is this where your mother works?" ],
    [ "Dat wist ik niet."            => "I didn't know that." ],
    [ "Het was niet mijn fout."      => "It was not my fault." ],
    [ "Ik zal een man van u maken."  => "I will make a man of you." ],
    [
        "Ik weet niet wanneer hij hier zal komen." =>
          "I don't know when he will come here."
    ],
    [ "Ik heb je nodig."               => "I need you." ],
    [ "Hoe is het water hier?"         => "How's the water here?" ],
    [ "We hebben een hond en een kat." => "We own a dog and a cat." ],
    [ "Ik weet niet of hij dokter is." => "I don't know if he is a doctor." ],
    [
        "Het is niet moeilijk om Engels te spreken." =>
          "It is not difficult to speak English."
    ],
    [ "Hij is al weg." => "He's already left." ],
    [ "Hij is al weg." => "He has left already." ],
    [
        "Wat zou jij zeggen als je mij was?" =>
          "What would you say if you were in my place?"
    ],
    [
        "Hij ging naar daar in plaats van zijn vader." =>
          "He went there instead of his father."
    ],
    [ "Hij is in zijn kamer aan het spelen." => "He is playing in his room." ],
    [ "Weet je waar mijn horloge is?" => "Do you know where my watch is?" ],
    [
        "Als ik het wist, zou ik het je zeggen." =>
          "If I knew it, I would tell it to you."
    ],
    [
        "Mij maakt het niet uit wat de mensen zeggen." =>
          "I don't care what people say."
    ],
    [
        "Als ik het wist, zou ik het je zeggen." =>
          "If I knew that, I'd tell you."
    ],
    [ "Ze is nu niet thuis."             => "She's not at home now." ],
    [ "Ze is nu niet thuis."             => "She isn't at home now." ],
    [ "Mijn zoon is nu zo groot als ik." => "My son is now as tall as I am." ],
    [
        "Als ik ben met je, ben ik gelukkig." => "When I'm with you, I'm happy."
    ],
    [
        "Ik denk dat je heel wat vragen hebt." =>
          "I guess you've got a lot of questions."
    ],
    [
        "Ik ben van plan morgen de hele dag thuis te zijn." =>
          "I plan to stay at home all day tomorrow."
    ],
    [ "Dat is onze school."   => "That is our school." ],
    [ "Ben je al weg?"        => "You're leaving already?" ],
    [ "Je ziet beter dan ik." => "You have better sight than me." ],
    [
        "Ik heb geen tijd om dat boek te lezen." =>
          "I don't have the time to read that book."
    ],
    [ "Weet je wie zij is?"        => "Do you know who she is?" ],
    [ "Hij ziet er goed uit."      => "He's looking good." ],
    [ "Weet je wie zij is?"        => "You know who she is?" ],
    [ "Jullie zijn bang voor hem." => "You're afraid of him." ],
    [
        "Het probleem was dat ik niets tegen hem te zeggen had." =>
          "The problem was that I had nothing to say to him."
    ],
    [ "Ik dacht dat het waar was." => "I thought it was true." ],
    [ "Ik hou van jou!"            => "I love you!" ],
    [
        "Ik wou dat ik terug in de tijd kon gaan." =>
          "I wish I could go back in time."
    ],
    [ "Ik mag je heel graag."           => "I like you very much." ],
    [ "Ik wil water."                   => "I want some water." ],
    [ "Ik wil in een grote stad leven." => "I want to live in a big city." ],
    [ "Nu weet ik het weer."            => "Now I remember." ],
    [
        "Ik ging vaak naar de film met mijn vader." =>
          "I often went to the movies with my father."
    ],
    [ "Waarom ben je zo laat nog op?" => "What keeps you up so late?" ],
    [ "Zonder jou kan ik niet leven." => "I can't live without you." ],
    [ "Ze houden niet van mij."       => "They don't like me." ],
    [ "Uw vader is groot."            => "Your father is tall." ],
    [ "Ik heb geen fiets."            => "I don't have a bicycle." ],
    [ "Ken je haar vader?"            => "Do you know her father?" ],
    [
        "Als ik jou was had ik het niet gedaan." =>
          "If I were you I wouldn't have done that."
    ],
    [ "Heeft u kinderen?" => "Do you have any children?" ],
    [
        "Dat is niet iets wat iedereen kan doen." =>
          "It's not something anyone can do."
    ],
    [
        "Vandaag is het niet zo koud als gisteren." =>
          "It isn't anything like as cold as it was yesterday."
    ],
    [ "Nu weet ik waar ik aan toe ben!" => "Now I know my situation!" ],
    [ "Het was een mooie dag."          => "It was a beautiful day." ],
    [ "Ik hou van je, zoals je bent."   => "I love you just as you are." ],
    [ "Dat kan hij niet gedaan hebben." => "He can not have done that." ],
    [
        "Wat zijn we volgende week om deze tijd aan het doen?" =>
          "What will we be doing this time next week?"
    ],
    [ "Ik had met haar niets te maken." => "I had nothing to do with her." ],
    [
        "Weet jij of ze al dan niet Engels kan spreken?" =>
          "Do you know whether or not she can speak English?"
    ],
    [ "Ik wil mijn eigen kamer." => "I want my own room." ],
    [
        "Het water in het meer is heel koud." =>
          "The water of the lake is very cold."
    ],
    [ "Ik heb mijn werk al af." => "I've already finished my work." ],
    [ "Nu of nooit!"            => "It's now or never." ],
    [
        "Er is iets, wat ik niet begrijp." =>
          "There is something I don’t understand."
    ],
    [ "Hij wist dat niet."          => "He didn't know that." ],
    [ "Ga maar zonder mij."         => "You go on without me." ],
    [ "Welke auto is van je vader?" => "Which car is your father's?" ],
    [ "Wat ga je nu doen?"          => "What're you going to do next?" ],
    [ "Doe me dit niet aan."        => "Don't you do this to me." ],
    [
        "Voor zover ik weet is het waar wat hij zei." =>
          "As far as I know, what he has said is true."
    ],
    [
        "Laat ik je hier nooit meer zien!" =>
          "I never want to see you here ever again!"
    ],
    [ "Ze zijn niet bang van de dood."    => "They aren't afraid of death." ],
    [ "Ik stond op, maar niet voor lang." => "I stood up, but not for long." ],
    [ "Het is te klein."                  => "It's too small." ],
    [
        "Waar er leven is, is er hoop." => "Where there is life, there is hope."
    ],
    [
        "Het spijt me, maar ik moet nu naar huis gaan." =>
          "I'm sorry, but I'll have to go home now."
    ],
    [ "Hoe laat ga je naar school?" => "What time do you leave for school?" ],
    [
        "Dit heeft niets met mij te maken." => "This has nothing to do with me."
    ],
    [
        "Ik ben niet zeker wanneer hij terug zal zijn." =>
          "I am not sure when he will be back."
    ],
    [ "Hoe gaat het met jullie moeder?" => "How's your mother?" ],
    [ "Kan ik dit eten?"                => "Can I eat this?" ],
    [
        "Wie niet kan vragen, kan niet leven." =>
          "He that cannot ask cannot live."
    ],
    [ "Wanneer komt het u uit?" => "When would it be convenient for you?" ],
    [ "Heeft hij er iets van gezegd?" => "Did he say anything about it?" ],
    [ "Ik heb het koud."              => "I feel cold." ],
    [
        "Ik heb niet zo veel geld als ge denkt." =>
          "I don't have as much money as you think."
    ],
    [
        "Het moet iets met geld te maken hebben." =>
          "It must have something to do with money."
    ],
    [
        "Denk je dat het morgen een mooie dag wordt?" =>
          "Do you think tomorrow will be a nice day?"
    ],
    [
        "Te weinig is net zo erg als te veel." =>
          "Too little is just as bad as too much."
    ],
    [
        "Ik zal hem er morgen over vragen." =>
          "I will ask him about it tomorrow."
    ],
    [ "Maar ik had jou nooit."     => "But I never had you." ],
    [ "Weet je, wanneer ze komt?"  => "Do you know when she will come?" ],
    [ "Ik ben helemaal niet bang." => "I'm not afraid at all." ],
    [
        "Dit is het huis waar hij geboren werd." =>
          "This is the house in which he was born."
    ],
    [
        "Gisteren was het niet zo heel koud." =>
          "It was not very cold yesterday."
    ],
    [ "Ik wist niet goed wat te doen." => "I was not sure what to do." ],
    [ "Hoe ver is het van hier?"       => "How far is it from here?" ],
    [ "Mijn moeder kan niet komen."    => "My mother can't come." ],
    [
        "Ik heb twee kinderen, een jongen en een meisje." =>
          "I have two children. One is a boy and the other is a girl."
    ],
    [ "Weet je het zeker?"              => "Are you sure?" ],
    [ "Ze is vijf jaar."                => "She is five years old." ],
    [ "Ik ben hier weg."                => "I'm outta here." ],
    [ "Wat heb je gedaan met die auto?" => "What did you do with that car?" ],
    [ "Ik zal hem vragen of hij komt."  => "I'll ask him if he will come." ],
    [ "Ik ken hem."                     => "I know him." ],
    [
        "Ik denk dat hij een eerlijk iemand is." =>
          "I think he's an honest man."
    ],
    [
        "Het was duidelijk dat het zo zou zijn." =>
          "It was obvious that it would be this way."
    ],
    [ "Ik denk dat je het fout hebt." => "I think you're wrong." ],
    [
        "Als ik het wist, zou ik het u zeggen." =>
          "If I knew it, I would tell it to you."
    ],
    [
        "Als ik het wist, zou ik het u zeggen." =>
          "If I knew that, I'd tell you."
    ],
    [ "Dit is mijn fiets." => "The bicycle is mine." ],
    [
        "Ik heb geen tijd om dit boek te lezen." =>
          "I don't have the time to read this book."
    ],
    [ "Hij is niet langer hier."         => "He is no longer here." ],
    [ "Denk er eens over na als je wil." => "Please think about it." ],
    [ "Daar heb ik veel over te zeggen." => "I have much to say about it." ],
    [ "Over een week of twee."           => "In about two weeks." ],
    [ "Hij had niet genoeg geld."        => "He did not have enough money." ],
    [ "Hij deed het voor geld."          => "He did it for the money." ],
    [
        "Het is te vroeg om naar bed te gaan." => "It's too early to go to bed."
    ],
    [
        "Wat hij ook doet, hij doet het goed." =>
          "Regardless what he does, he does it well."
    ],
    [
        "Wat hij ook doet, hij doet het goed." =>
          "Regardless of what he does, he does it well."
    ],
    [
        "Wat hij ook doet, hij doet het goed." =>
          "No matter what he does, he does it well."
    ],
    [ "Is hij nog steeds hier?" => "Is he still here?" ],
    [ "Ga naar school."         => "Go to school." ],
    [
        "Haar moeder heeft haar gemaakt tot wat ze is." =>
          "Her mother has made her what she is."
    ],
    [
        "Het geld op tafel is niet van mij." =>
          "The money on the table isn't mine."
    ],
    [ "Wat is er aan de hand?"          => "What is going on?" ],
    [ "Ik vind het helemaal niet erg."  => "I don't mind it at all." ],
    [ "We zijn niet bang voor de dood." => "We aren't afraid of death." ],
    [ "Ik vind dat je meer moet eten."  => "I think you need to eat more." ],
    [
        "Het is niet zo moeilijk als je denkt." =>
          "It is not so difficult as you think."
    ],
    [
        "Ik heb niets tegen hem te zeggen." => "I've got nothing to say to him."
    ],
    [ "Ik weet het zeker."        => "I am sure." ],
    [ "Ik weet het zeker."        => "I'm sure of it." ],
    [ "Wat heb je nodig?"         => "What do you need?" ],
    [ "Laten we niet gaan."       => "Let's not go." ],
    [ "Je bent een goede jongen." => "You are a good boy." ],
    [
        "Ik heb geen idee waar je het over hebt." =>
          "I have no idea what you're talking about."
    ],
    [ "Ik weet zeker dat hij komt." => "He is sure to come." ],
    [ "Ik weet zeker dat hij komt." => "I'm certain that he'll come." ],
    [ "Omdat het te groot is."      => "Because it's too big." ],
    [ "Ze is maar een kind."        => "She's only a child." ],
    [ "De naam van de hond is Ken." => "The dog's name is Ken." ],
    [ "Ik kon me niet goed houden." => "I could not help laughing." ],
    [ "Heb je dit boek nodig?"      => "Do you need this book?" ],
    [
        "Hij en ik zijn bijna even groot." =>
          "He and I are almost the same height."
    ],
    [ "Je lijkt net op hem." => "You look just like him." ],
    [
        "Ik wil niet dat je in de problemen komt." =>
          "I don't want to get you into trouble."
    ],
    [
        "Het spijt me zeer dat ik zo laat ben!" =>
          "Many apologies for being so late!"
    ],
    [ "Ik denk dat hij moe is." => "I think he's tired." ],
    [
        "Ze zei dat ze goede vrienden van haar waren." =>
          "She said that they were good friends of hers."
    ],
    [ "Het is heet vandaag." => "It's warm today." ],
    [ "Dat zou leuk zijn."   => "It would be fun." ],
    [
        "Weet je of ze Engels kan spreken?" =>
          "Do you know whether she can speak English?"
    ],
    [
        "Mijn moeder heeft me gemaakt tot wat ik vandaag ben." =>
          "My mother made me what I am today."
    ],
    [
        "Je moeder is heel jong, niet?" =>
          "Your mother is very young, isn't she?"
    ],
    [ "En met jou, hoe gaat het met jou?" => "And you, how are you?" ],
    [
        "Ik heb je al zo lang niet gezien!" => "I haven't seen you for so long!"
    ],
    [
        "Ze heeft haar kinderen niet in de hand." =>
          "She can't control her children."
    ],
    [ "Ik wist niet wat te doen."  => "I didn't know what to do." ],
    [ "Waarom ben je er nog?"      => "Why are you still here?" ],
    [ "Beter laat dan nooit."      => "Better late than never." ],
    [ "Ik ben aan de telefoon."    => "I'm talking on the phone." ],
    [ "Wanneer ga je naar school?" => "When do you leave for school?" ],
    [ "Je spreekt goed Engels."    => "You speak good English." ],
    [ "Laat me alleen gaan."       => "Let me go alone." ],
    [
        "Dit boek is te moeilijk voor mij om te lezen." =>
          "This book is too difficult for me to read."
    ],
    [ "Laat het er allemaal uit." => "Let it all out." ],
    [ "Ik wist dit niet."         => "I did not know this." ],
    [ "Er is telefoon voor je."   => "You are wanted on the phone." ],
    [ "Laat hem het alleen doen." => "Let him do it alone." ],
    [
        "Als je zijn huis ziet, weet je dat hij arm is." =>
          "If you see his house, you'll know that he is poor."
    ],
    [ "Hoe heet is het vandaag nog!"    => "How hot it is today!" ],
    [ "Ik wil tijd in plaats van geld." => "I want time instead of money." ],
    [
        "Hoe dan ook, het gaat je niks aan." =>
          "In any case, it's none of your business."
    ],
    [
        "Hoe dan ook, het gaat je niks aan." =>
          "In any case, it's no business of yours."
    ],
    [ "Ik weet niks van haar."       => "I know nothing about her." ],
    [ "Hij weet zeker dat hij komt." => "He is sure that he will come." ],
    [ "Ik wil een boek om te lezen." => "I want a book to read." ],
    [
        "De fiets die daar staat is van mijn broer." =>
          "That bicycle over there is my brother's."
    ],
    [ "Ik hou niet van muziek." => "I do not like music." ],
    [ "Ze is echt snel."        => "She's really quick." ],
    [
        "Er is voor mij geen reden om het niet te doen." =>
          "There is no reason why I shouldn't do it."
    ],
    [ "Hij zei dat je niet hoeft te gaan." => "He said that you need not go." ],
    [ "Hij zei dat hij zou komen."         => "He said he would come." ],
    [ "Wie is deze vrouw?"                 => "Who is this woman?" ],
    [ "Er is hier iets aan de hand." => "There's something fishy going on." ],
    [
        "Waarom ben je altijd te laat?" => "Why is it that you are always late?"
    ],
    [ "Waarom ben je altijd te laat?" => "Why is it that you're always late?" ],
    [
        "Veel mensen zouden het met u eens zijn." =>
          "Many people would agree with you."
    ],
    [
        "Vind jij dat ik alleen zou moeten gaan?" =>
          "Do you think I should go by myself?"
    ],
    [ "Hoe laat is school uit?"          => "When is school over?" ],
    [ "Ik was daar niet echt zeker van." => "I wasn't quite sure about that." ],
    [
        "Ik was daar niet echt zeker van." => "I wasn't really certain of that."
    ],
    [ "Ik heb u nodig."                  => "I need you." ],
    [ "We hebben twee kinderen."         => "We have two children." ],
    [ "Deze boeken zijn mijn boeken."    => "These books are my books." ],
    [ "Ik hou van muziek en van Engels." => "I like music and English." ],
    [
        "Je had het nu wel af moeten hebben." =>
          "He should have finished it by now."
    ],
    [ "Ik hoop van niet." => "I hope not." ],
    [
        "Het doet er niet toe of hij komt of niet." =>
          "It doesn't matter whether he comes or not."
    ],
    [ "Dit is een klein boek." => "This is a small book." ],
    [
        "Ik kan hem en zijn broer niet uit elkaar houden." =>
          "I can't tell him from his brother."
    ],
    [
        "Wat zou je in mijn plaats doen?" =>
          "What would you do if you were in my place?"
    ],
    [
        "Wie is die man die daar staat?" =>
          "Who's that man standing over there?"
    ],
    [ "Deze schoenen zijn van haar." => "These shoes are hers." ],
    [ "Het is bijna drie uur."       => "It's nearly three o'clock." ],
    [ "Hoe is het weer?"             => "How's the weather?" ],
    [ "Hoe is het weer?"             => "How is the weather?" ],
    [ "Spreekt ge tegen mij?"        => "Are you talking to me?" ],
    [ "Het was heet gisteren."       => "It was hot yesterday." ],
    [ "Het was heet gisteren."       => "Yesterday was hot." ],
    [ "Wie is de volgende?"          => "Who is next?" ],
    [
        "Ik wil niet naar het ziekenhuis gaan." =>
          "I don't want to go to the hospital."
    ],
    [ "Dat heb ik nooit gezegd!"  => "I've never said that!" ],
    [ "Jij bent bang voor hem."   => "You're afraid of him." ],
    [ "Wat als het je spijt?"     => "What if you regret it?" ],
    [ "Dat heb ik nooit gezegd."  => "I never said that." ],
    [ "Het is niet koud vandaag." => "It is not cold today." ],
    [ "Ik ben geen leraar."       => "I am not a teacher." ],
    [
        "Ik wist niet dat je zou komen." =>
          "I had no idea that you were coming."
    ],
    [ "Ik denk dat ze eerlijk is." => "I think that she is honest." ],
    [ "Zij is te oud voor hem."    => "She's too old for him." ],
    [
        "Is het moeilijk om Engels te spreken?" =>
          "Is it hard to speak English?"
    ],
    [ "Ik denk dat ze ziek is."      => "I think she is sick." ],
    [ "Alles wat hij zegt, is waar." => "All that he says is true." ],
    [ "Ik zal hier eten."            => "I'll eat here." ],
    [ "En waarom is dat?"            => "And why is that?" ],
    [ "Hoe doen we dat?"             => "How do we do that?" ],
    [ "Ik ben al oud."               => "I am already old." ],
    [
        "Jouw probleem lijkt op dat van mij." =>
          "Your problem is similar to mine."
    ],
    [ "Ik ken zijn naam niet." => "I don't know his name." ],
    [ "De hele stad weet het." => "It's the talk of the town." ],
    [
        "Is het waar dat ge naar Parijs gaat?" =>
          "Is it true that you are going to Paris?"
    ],
    [ "Mijn zoon kwam naar mijn kamer." => "My son came to my room." ],
    [
        "Ik kan even niet op zijn naam komen." =>
          "I can't think of his name just now."
    ],
    [ "Ik wou dat ik wist waar hij was!" => "I wish I knew where he was!" ],
    [ "Is je moeder thuis?"              => "Is your mother at home?" ],
    [ "Is je moeder thuis?"              => "Is your mum at home?" ],
    [ "Heeft ze haar werk al af?"        => "Has she finished her work yet?" ],
    [
        "Voor zover ik weet komt hij met de auto." =>
          "As far as I know, he is coming by car."
    ],
    [ "Ze is twee jaar ouder dan jij." => "She is two years older than you." ],
    [ "Ze is twee jaar ouder dan jij." => "She's two years older than you." ],
    [ "Het gaat allemaal om geld."     => "It's all about money." ],
    [ "Je kunt het!"                   => "You can do it." ],
    [ "Dit is ook een goede film."     => "This is also a good movie." ],
    [ "Laten we naar huis gaan!"       => "Let's go home!" ],
    [ "Is je man thuis?"               => "Is your husband at home?" ],
    [ "We kunnen beter gaan."          => "We better be going." ],
    [ "Ik heb geen tijd om te lezen."  => "I have no time for reading." ],
    [ "Het is erg koud deze morgen."   => "It is very cold this morning." ],
    [ "Ik ben even oud als hij."       => "I'm as old as he is." ],
    [ "Hij gaf me het geld terug."     => "He gave me back the money." ],
    [ "Ik zal hem morgen zien."        => "I'm going to see him tomorrow." ],
    [ "Gaan de kinderen naar school?"  => "Do the children go to school?" ],
    [
        "Tegen de tijd dat je terug bent, zal zij weg zijn." =>
          "By the time you get back, she'll have left."
    ],
    [ "Je bent niet snel genoeg." => "You're not fast enough." ],
    [ "Zo is het wel genoeg."     => "That will do." ],
    [ "Ik ben geen kind meer."    => "I am no longer a child." ],
    [ "Hij kan niet ziek zijn."   => "He can't be ill." ],
    [ "Het is te warm voor mij."  => "It is too warm for me." ],
    [ "Het is leuk."              => "It's nice." ],
    [ "Wat doen we nu?"           => "What do we do next?" ],
    [ "Dit is wat ik dacht."      => "This is what I thought." ],
    [
        "Wij zijn niet in staat om dat te doen." =>
          "That we are not able to do."
    ],
    [
        "De vraag is of hij de brief zal lezen of niet." =>
          "The question is whether he'll read the letter or not."
    ],
    [ "De auto van mijn vader is nieuw." => "My father's car is new." ],
    [ "Ik weet dat ze mooi is."          => "I know that she is beautiful." ],
    [ "Kan je dat nog eens zeggen?"      => "Could you say that again?" ],
    [ "Ik hou niet van koffie."          => "I don't like coffee." ],
    [ "Waar wil je eten?"                => "Where do you want to eat?" ],
    [ "Ik ben thuis."                    => "I am in the house." ],
    [
        "Hij is drie jaar ouder dan zij is." =>
          "He's three years older than she is."
    ],
    [ "Ik zou graag iets eten."   => "I'd like something to eat." ],
    [ "Van wie is die fiets?"     => "Whose bicycle is that?" ],
    [ "Je mag niet te veel eten." => "You must not eat too much." ],
    [ "Wil je iets eten?"         => "Would you like to eat something?" ],
    [ "Wil je iets eten?"         => "Do you want to eat something?" ],
    [
        "Ik weet nog dat ik de film gezien heb." =>
          "I remember seeing the movie."
    ],
    [
        "Zijn moeder wilde het niet doen." => "His mother didn't want to do it."
    ],
    [
        "Ik heb hem al lang niet meer gezien." =>
          "It's been a long time since I last saw him."
    ],
    [ "Dit is jouw hond."         => "This is your dog." ],
    [ "Wat ben je aan het lezen?" => "What are you reading?" ],
    [
        "De kinderen hebben geen school vandaag." =>
          "The children don't have school today."
    ],
    [ "Het is tijd om naar bed te gaan." => "It's time to go to bed." ],
    [ "Ik ben dit boek aan het lezen."   => "I'm reading this book." ],
    [ "Ken je hem al lang?"        => "Have you known him for a long time?" ],
    [ "Ik ken haar helemaal niet." => "I don't know her at all." ],
    [ "Ik kwam een oude vrouw tegen." => "I met an old woman." ],
    [ "Dat hebben we niet in Europa." => "We don't have that in Europe." ],
    [ "Mag ik naar huis gaan?"        => "May I go home?" ],
    [ "Waarom ben je te laat?"        => "Why are you late?" ],
    [ "Ik kan leven zonder water."    => "I can live without water." ],
    [
        "Denk je dat hij het werk alleen gedaan heeft?" =>
          "Do you think he did the job on his own?"
    ],
    [ "Ik ken haar al lang." => "I've known her for a long time." ],
    [
        "Hij en alleen hij weet de hele waarheid." =>
          "He and only he knows the whole truth."
    ],
    [ "Mijn vriend woont in dit huis." => "My friend lives in this house." ],
    [ "Ik heb meer tijd nodig."        => "I need more time." ],
    [ "Waar woont hij?"                => "Where does he live?" ],
    [
        "Is het echt zo moeilijk om Engels te spreken?" =>
          "Is it really that hard to speak English?"
    ],
    [ "Dat zou ik gezegd hebben." => "This is what I would have said." ],
    [
        "Men moet eten om te leven, niet leven om te eten." =>
          "One must eat to live, and not live to eat."
    ],
    [ "Hij is langer dan zijn broer." => "He is taller than his brother." ],
    [ "Zonder water kunnen we niet."  => "Water is indispensable to us." ],
    [ "Ik ken hem al lang."           => "I've known him for a long time." ],
    [ "Is dit genoeg geld?"           => "Is this enough money?" ],
    [ "U moet niet komen morgen."     => "You don't have to come tomorrow." ],
    [ "Hij is mijn beste vriend."     => "He is my best friend." ],
    [ "Hij is mijn beste vriend."     => "He's my best friend." ],
    [ "Ik kan het in je ogen zien."   => "I can see it in your eyes." ],
    [ "Waar werk je?"                 => "Where do you work?" ],
    [
        "Ik hoop dat je met een beter plan komt." =>
          "I hope you will come up with a better plan."
    ],
    [ "Ik ga wanneer jij ook gaat." => "I will go when you do." ],
    [
        "Ik ken het huis waar hij geboren is." =>
          "I know the house where he was born."
    ],
    [ "Ik denk dat ik snel terug kom." => "I think I'll come back soon." ],
    [ "Ze wilde graag naar huis."      => "She was eager to go home." ],
    [ "Wie is dat meisje?"             => "Who is this girl?" ],
    [ "Wat een grote hond!"            => "What a big dog!" ],
    [ "We hebben veel vrienden."       => "We have a lot of friends." ],
    [
        "Ik denk dat we wat meer zouden moeten doen." =>
          "I think we should do some more."
    ],
    [ "Zij is veel groter dan ik."    => "She is much taller than I." ],
    [ "Zij is veel groter dan ik."    => "She's way taller than me." ],
    [ "Ik wil hier niets over weten." => "I don't want to know about this." ],
    [
        "Ze was niet op school voor vijf dagen." =>
          "She's been absent from school for five days."
    ],
    [
        "Vandaag hou ik van de hele wereld." => "Today I love the entire world."
    ],
    [ "Ik vind je niet meer leuk."        => "I don't like you anymore." ],
    [ "We hebben genoeg tijd om te eten." => "We have time enough to eat." ],
    [
        "Is dat het woordenboek waar je naar op zoek bent?" =>
          "Is this the dictionary you're looking for?"
    ],
    [ "Kan je komen?" => "Can you come?" ],
    [
        "Ik weet niet wanneer mijn moeder terug zal komen." =>
          "I don't know when my mother will come back."
    ],
    [
        "Morgen moet het werk af zijn." =>
          "The work must be completed by tomorrow."
    ],
    [ "Het ziet er heel moeilijk uit!" => "It looks really hard!" ],
    [
        "Er is niemand die met mij mee wil." =>
          "I don't have anyone who'd travel with me."
    ],
    [
        "Ik vroeg haar of ik het boek kon lezen." =>
          "I asked her if I could read the book."
    ],
    [ "Weet u dat zeker?" => "Are you sure?" ],
    [ "Waarom ben je er?" => "Why are you here?" ],
    [
        "Ze zullen nooit weten dat we hier zijn." =>
          "They'll never know we're here."
    ],
    [
        "Kan jij dit doen in plaats van mij?" =>
          "Could you do this instead of me?"
    ],
    [ "Doe wat je wil."                => "Do what you like." ],
    [ "Doe wat je wil."                => "Do what you want." ],
    [ "Doe wat je wil."                => "Do whatever you like." ],
    [ "Ik zou mijn vader willen zien." => "I wish to see my father." ],
    [
        "Hij heeft niet veel van de wereld gezien." =>
          "He has not seen much of the world."
    ],
    [ "Hier is een foto van haar."      => "Here's a photo of her." ],
    [ "Ze is er niet omdat ze ziek is." => "She's absent because she's sick." ],
    [ "Hoe oud is je vader?"            => "How old is your father?" ],
    [ "Zonder jou ben ik niets."        => "Without you I am nothing." ],
    [ "Er is nog een hoop water over."  => "There's a lot of water left." ],
    [ "Er zit een kat in mijn huis."    => "There's a cat in my house." ],
    [
        "Wie is die vrouw die daar staat?" =>
          "Who's that woman standing over there?"
    ],
    [ "Hoe moet ik dat weten?"        => "How should I know?" ],
    [ "Ze spreekt altijd Engels."     => "She always speaks English." ],
    [ "Ik kan niets zien."            => "I can't see!" ],
    [ "Het was mijn fout."            => "It was my mistake." ],
    [ "Is daar iemand?"               => "Is somebody there?" ],
    [ "Hij zag een hond bij de deur." => "He saw a dog near the door." ],
    [ "Dit is wat we willen weten."   => "That is what we want to know." ],
    [ "Dit is wat we willen weten."   => "This is what we want to know." ],
    [ "Woont u hier?"                 => "Do you live here?" ],
    [ "Ik hou altijd mijn woord."     => "I always keep my word." ],
    [ "Hij is in het ziekenhuis."     => "He's in the hospital." ],
    [ "Hij is in het ziekenhuis."     => "He's in hospital." ],
    [ "Zijn verhaal is waar."         => "His story is true." ],
    [ "Heel graag, mijn beste."       => "With pleasure, my dear." ],
    [ "Heb je een woordenboek?"       => "Do you have a dictionary?" ],
    [ "Het is niet helemaal zeker."   => "It's not quite certain." ],
    [ "Zij kwam uit de kamer."        => "She came out of the room." ],
    [ "Ze is even jong als ik."       => "She is as young as I am." ],
    [
        "Vind je het niet vreemd dat hij er niet is?" =>
          "Don't you think it's strange that he's not here?"
    ],
    [ "Wat heb je gezegd?" => "What did you say?" ],
    [
        "Ik hoop wel dat je nog een keer komt." =>
          "I do hope you will come again."
    ],
    [ "Het meisje lijkt op haar moeder." => "The girl resembles her mother." ],
    [ "Hij houdt zich aan zijn woord."   => "He keeps his word." ],
    [ "Ik zou graag een foto van je willen." => "I would like your picture." ],
    [
        "Ik weet niet waar ik op haar moet wachten." =>
          "I don't know where to wait for her."
    ],
    [
        "Ik ben van plan om in de stad te gaan wonen." =>
          "I plan to live in the city."
    ],
    [
        "Je hoeft het morgen niet af te hebben." =>
          "You don't need to finish it by tomorrow."
    ],
    [ "Hij was heel oud."           => "He was very old." ],
    [ "Zij heeft veel geld."        => "She has a lot of money." ],
    [ "Ik ken hem alleen van naam." => "I only know him by name." ],
    [
        "Ik heb een nieuwe auto voor haar gekocht." => "I bought her a new car."
    ],
    [ "De weg is lang."                       => "The road is long." ],
    [ "De weg is lang."                       => "The way is long." ],
    [ "Ga terug naar huis."                   => "Go back home." ],
    [ "Ik vraag me af waarom hij te laat is." => "I wonder why he is late." ],
    [ "Als het nodig is, kom ik snel." => "If necessary, I will come soon." ],
    [ "Dit hebben we niet in Europa."  => "We don't have this in Europe." ],
    [ "Hier komt de trein!"            => "Here comes the train!" ],
    [ "Het was erg koud."              => "It was very cold." ],
    [ "Ik weet dat je rijk bent."      => "I know you are rich." ],
    [ "Heeft u nog vragen?"     => "Do you have any further questions?" ],
    [ "Ik heb een woordenboek." => "I have a dictionary." ],
    [ "Waar is jouw hond?"      => "Where is your dog?" ],
    [
        "Je bent vrij om te gaan wanneer je ook wil." =>
          "You are free to leave any time you wish."
    ],
    [ "Wanneer zullen we er zijn?" => "When do we arrive?" ],
    [ "Ik heb het woordenboek."    => "I have a dictionary." ],
    [ "Ik zag een hond."           => "I saw a dog." ],
    [ "Hier werkt mijn vader."     => "My father works here." ],
    [ "Ik heb het woordenboek."    => "I have the dictionary." ],
    [
        "Is je school ver weg van je huis?" =>
          "Is your school far from your home?"
    ],
    [
        "Is je school ver weg van je huis?" =>
          "Is your school far away from your house?"
    ],
    [ "Ik ben blij je hier te zien." => "I'm happy to see you here." ],
    [ "Het boek is klein."           => "The book is small." ],
    [ "Ik werk voor jullie."         => "I work for you." ],
    [ "Hij houdt niet van koffie."   => "He doesn't like coffee." ],
    [
        "Je bent de grote liefde van mijn leven." =>
          "You are the great love of my life."
    ],
    [ "Dat is mijn woordenboek."         => "That's my dictionary." ],
    [ "Hij houdt van eten."              => "He has a good appetite." ],
    [ "Dat is mijn woordenboek."         => "That is my dictionary." ],
    [ "Hebt ge het niet koud?"           => "Don't you feel cold?" ],
    [ "Laat ons even alleen zijn."       => "Give us a moment alone." ],
    [ "Dat is nodig."                    => "It is necessary." ],
    [ "Ik had graag groter willen zijn." => "I wish I were taller." ],
    [
        "De jongen spreekt alsof hij een man is." =>
          "The boy talks as if he were a man."
    ],
    [ "Ik zal jouw leraar zijn." => "I'll be your teacher." ],
    [ "Dat zal ik zeker doen."   => "I'll definitely do that." ],
    [ "Jullie vader is groot."   => "Your father is tall." ],
    [ "Ik heb veel huiswerk."    => "I have a lot of homework." ],
    [ "Er is geen hoop."         => "There is no hope." ],
    [
        "Dat was genoeg voor vandaag, ik ben moe." =>
          "That's enough for today. I'm tired."
    ],
    [ "Wat als er iets fout gaat?"        => "What if something goes wrong?" ],
    [ "Ik kon niet alles zien."           => "I could not see anything." ],
    [ "Ik kon niet alles zien."           => "I couldn't see everything." ],
    [ "Misschien is het te laat."         => "Maybe it's too late." ],
    [ "Ik vraag me af wie dat meisje is." => "I wonder who that girl is." ],
    [ "Laat mij zeggen wat ik denk."      => "Let me say what I think." ],
    [
        "Ik heb er spijt van dat huis niet te hebben gekocht." =>
          "I regret not having bought that house."
    ],
    [ "Ik was aan het spelen."          => "I was playing." ],
    [ "Hij is tien jaar ouder dan jij." => "He's ten years older than you." ],
    [
        "Er staat een vreemde man voor het huis." =>
          "There is a strange man in front of the house."
    ],
    [ "Wat gaan we worden?" => "What will we become?" ],
    [
        "Niet erg, ik kan het zelf doen." =>
          "Never mind, I can do it by myself."
    ],
    [
        "Hij houdt hem voor een eerlijk man." =>
          "He considers him to be an honest man."
    ],
    [ "Ik ben ouder dan uw broer."      => "I'm older than your brother." ],
    [ "We waren hier een jaar geleden." => "One year ago we were here." ],
    [ "Waarom kwam je uit de kamer?"    => "Why did you leave the room?" ],
    [ "Waarom kwam je de kamer uit?"    => "Why did you leave the room?" ],
    [ "Ik ben al klaar met mijn werk."  => "I've already finished my work." ],
    [ "Hij is in staat Japans te spreken." => "He is able to speak Japanese." ],
    [
        "Het is vandaag niet zo warm als gisteren." =>
          "It is not so hot today as yesterday."
    ],
    [
        "Het is vandaag niet zo warm als gisteren." =>
          "It's not as hot today as it was yesterday."
    ],
    [ "Ik vraag mij af waarom hij te laat is." => "I wonder why he is late." ],
    [ "Nu ga je te ver."                       => "Now you're going too far." ],
    [
        "Wat ik ook doe, zij zegt dat ik het beter kan." =>
          "Whatever I do, she says I can do better."
    ],
    [
        "Dit is de plaats waar mijn vader geboren was." =>
          "This is the place where my father was born."
    ],
    [
        "Hij zei dat hij hier morgen terug zou komen." =>
          "He said that he would come back here tomorrow."
    ],
    [
        "Dit zal mijn laatste zin in het Engels zijn." =>
          "This will be my last sentence in English."
    ],
    [
        "Ik weet niet precies wanneer ik terug zal zijn." =>
          "I don't know exactly when I'll be back."
    ],
    [ "Dat boek is klein."             => "That book is small." ],
    [ "Wat zei de jongen?"             => "What did the boy say?" ],
    [ "Ik kocht haar een nieuwe auto." => "I bought her a new car." ],
    [
        "De kinderen zijn de bloemen van ons leven." =>
          "Children are the flowers of our lives."
    ],
    [ "Ik ga naar de dokter."        => "I'm going to the doctor." ],
    [ "Ze is zes jaar ouder dan ik." => "She's six years older than me." ],
    [ "Ze is zes jaar ouder dan ik." => "She's six years older than I am." ],
    [
        "Nu ik leraar ben denk ik er anders over." =>
          "Now that I am teacher, I think otherwise."
    ],
    [ "Ik ben net terug uit school." => "I have just come back from school." ],
    [ "Ik weet van niks."            => "I don't know anything." ],
    [
        "Kan je me je naam alsjeblieft nog een keer zeggen?" =>
          "Can you please tell me your name once more?"
    ],
    [ "Hij is gek op je." => "He's crazy about you." ],
    [
        "Het is het eerste dat mijn vader geschreven heeft." =>
          "It's the first thing that my father wrote."
    ],
    [ "Ze zal daar nooit over spreken."  => "She will never talk about it." ],
    [ "Ik wil iets om te lezen."         => "I want something to read." ],
    [ "Hou je me voor de gek?"           => "Are you kidding me?" ],
    [ "Kom niet weer te laat op school." => "Don't be late for school again." ],
    [ "Hou me niet voor de gek."         => "Don't deceive me." ],
    [ "Waarom is hij hier?"              => "Why is he here?" ],
    [ "Waar woont u nu?"                 => "Where do you live now?" ],
    [ "We hebben het geld nodig."        => "We need the money." ],
    [
        "Dat is omdat je niet alleen wilt zijn." =>
          "It's because you don't want to be alone."
    ],
    [ "Ik hou erg van koffie."        => "I like coffee very much." ],
    [ "Het lijkt dat hij eerlijk is." => "It appears that he is honest." ],
    [
        "In uw plaats zou ik dat niet gedaan hebben." =>
          "If I were you I wouldn't have done that."
    ],
    [ "Ze zal haar eigen weg hebben." => "She will have her own way." ],
    [ "Het is koud."                  => "It's cold." ],
    [ "Wat heeft hij gezegd?"         => "What did he say?" ],
    [ "Wat doe je hier?"              => "What are you doing here?" ],
    [ "Wat doe je hier?"              => "What're you doing here?" ],
    [
        "Weet jij of ze Engels kan spreken?" =>
          "Do you know if she can speak English?"
    ],
    [ "Is uw school ver van uw huis?" => "Is your school far from your home?" ],
    [
        "Het lijkt erop dat jij iets weet dat ik niet weet." =>
          "It would seem that you know something that I don't."
    ],
    [
        "Hij heeft meer boeken dan hij kan lezen." =>
          "He has more books than he can read."
    ],
    [ "Hij woont ver van mijn huis." => "He lives far away from my house." ],
    [ "Een kat? vroeg de oude man."  => "A cat? asked the old man." ],
    [ "Ik wil nog niet naar bed!"    => "I don't want to go to bed yet!" ],
    [ "Ben je niet moe?"             => "Are you not tired?" ],
    [ "Leven en laten leven."        => "Live and let live." ],
    [ "Je bent nooit thuis."         => "You're never at home." ],
    [ "Je bent de reden dat ik hier ben." => "You are the reason I'm here." ],
    [
        "Ik denk dat het niet zo gemakkelijk is." =>
          "I guess it's not that easy."
    ],
    [ "Dat is mijn antwoord!" => "That's my answer!" ],
    [ "Hij is niet ziek."     => "He's not sick." ],
    [
        "De lange man kwam het huis uit." =>
          "The tall man came out of the house."
    ],
    [ "Deze kamer is groot genoeg." => "This room is large enough." ],
    [ "Hij is bijna altijd thuis."  => "He is almost always at home." ],
    [ "Hij is bijna altijd thuis."  => "He is almost always home." ],
    [ "Ze keek naar hem op."        => "She looked up at him." ],
    [
        "Ik ben nog niet klaar met mijn huiswerk." =>
          "I haven't finished my homework yet."
    ],
    [
        "Ik ben nog niet klaar met mijn huiswerk." =>
          "I have not finished my homework yet."
    ],
    [
        "Ik hield van mijn leven en mijn geld." =>
          "I loved my life and my money."
    ],
    [
        "Je staat niet zo vroeg op als je zus, toch?" =>
          "You don't get up as early as your sister, do you?"
    ],
    [ "Ik heb nu niets nodig." => "I don't need anything now." ],
    [
        "Niet willen is hetzelfde als hebben." =>
          "Not wanting is the same as having."
    ],
    [ "Kom je niet mee met mij?"        => "Won't you come with me?" ],
    [ "Ik ben blij je te zien."         => "I'm happy to see you." ],
    [ "Ik ben blij je te zien."         => "I am pleased to see you." ],
    [ "Hij is drie jaar ouder dan zij." => "He's three years older than her." ],
    [ "Het is een heel vreemde brief."  => "It is a very strange letter." ],
    [ "Waarom ben ik hier?"             => "Why am I here?" ],
    [ "Ik zal je de stad laten zien."   => "I'll show you around the city." ],
    [ "Ik zal je de stad laten zien."   => "I will show you around the city." ],
    [ "Ik wil uw taal niet leren." => "I would like to learn your language." ],
    [ "Wat een mooie dag!"         => "What a nice day it is!" ],
    [
        "Ik weet niet wanneer zij kan komen." =>
          "I do not know when she can come."
    ],
    [
        "Dit huiswerk is moeilijk voor mij." =>
          "This homework is difficult for me."
    ],
    [ "Weet jij waar ze geboren is?" => "Do you know where she was born?" ],
    [ "Hoe oud is hij?"              => "How old is he?" ],
    [ "Wat heb je gedaan?"           => "What did you do?" ],
    [
        "Ben je van plan om naar het buitenland te gaan?" =>
          "Do you plan to go abroad?"
    ],
    [ "We moeten hier weg." => "We should get out of here." ],
    [
        "Ik heb het idee dat ze vandaag zal komen." =>
          "I have a feeling that she'll come today."
    ],
    [
        "Ik was de auto voor het huis zonder problemen." =>
          "I wash my car in front of the house without any problems."
    ],
    [ "Het was maar een droom."    => "It was only a dream." ],
    [ "Weet jij wie zij zijn?"     => "Do you know who they are?" ],
    [ "Hij woont bij zijn ouders." => "He lives with his parents." ],
    [ "Zij staat altijd vroeg op." => "She always gets up early." ],
    [ "Laten we dat doen."         => "Let's do that." ],
    [
        "Dit heeft met jou niets te maken." =>
          "This has nothing to do with you."
    ],
    [ "Wat is er mis met haar?" => "What is wrong with her?" ],
    [
        "Ik haat het als er veel mensen zijn." =>
          "I hate it when there are a lot of people."
    ],
    [
        "Wat hij zegt heeft niets met dit probleem te maken." =>
          "What he says has nothing to do with this problem."
    ],
    [ "Het was een lange brief." => "It was a long letter." ],
    [ "Zij had geen geld."       => "She had no money." ],
    [
        "Het heeft geen zin me voor de gek te houden." =>
          "It is no use trying to deceive me."
    ],
    [ "Vandaag heb ik veel huiswerk." => "Today, I have a lot of homework." ],
    [
        "Weten jullie van wie deze auto is?" => "Do you know whose car this is?"
    ],
    [
        "Met al zijn geld is hij niet tevreden." =>
          "With all his money, he is not happy."
    ],
    [ "Hoe lang bent u?"       => "How tall are you?" ],
    [ "Ik heb één zus."        => "I have one sister." ],
    [ "Ik begrijp het niet."   => "I do not understand." ],
    [ "Ik begrijp het niet."   => "I don't understand." ],
    [ "Wat is je antwoord?"    => "What's your answer?" ],
    [ "Laat ons meer doen."    => "Let's do more." ],
    [ "Hou je van muziek?"     => "Do you love music?" ],
    [ "Hou je van muziek?"     => "Are you fond of music?" ],
    [ "Ik ben ook leraar."     => "I am a teacher, too." ],
    [ "Hou je van muziek?"     => "Do you like music?" ],
    [ "Is deze fiets van jou?" => "Is this bike yours?" ],
    [
        "Mijn vrouw zal ook blij zijn u te zien." =>
          "My wife will be glad to see you, too."
    ],
    [ "Ik heb een zeer mooie hond." => "I have a very beautiful dog." ],
    [ "Spreekt u Engels?"           => "Can you speak English?" ],
    [ "Was haar verhaal waar?"      => "Was her story true?" ],
    [ "Welke dag is het vandaag?"   => "What day is it today?" ],
    [ "Ik heb veel dingen te doen." => "I have many things to do." ],
    [ "Ik heb veel dingen te doen." => "I have a lot of things to do." ],
    [ "Er was niemand daar."        => "There was nobody there." ],
    [ "We zijn oude vrienden."      => "We're old friends." ],
    [
        "Heb je een Engels woordenboek?" => "Do you have an English dictionary?"
    ],
    [ "Hou het woordenboek bij je." => "Keep the dictionary by you." ],
    [ "Ik kom nooit meer terug."    => "I'll never come back." ],
    [ "Uw dood is mijn leven."      => "Your death is my life." ],
    [ "Ik had iets moeten zeggen."  => "I should have said something." ],
    [
        "Ze woont al vijf jaar in deze stad." =>
          "She has lived in this city for five years already."
    ],
    [ "Ze komen niet vandaag."        => "They are not coming today." ],
    [ "Hij denkt dat hij alles weet." => "He thinks he knows everything." ],
    [ "Hoe gaat het met iedereen?"    => "How is everyone?" ],
    [
        "Dit huis is te klein om in te wonen." =>
          "This house is too small to live in."
    ],
    [ "Hij is niet binnen." => "He's not in." ],
    [
        "Ik heb hem al drie dagen niet meer gezien." =>
          "I haven't seen him in three days."
    ],
    [
        "Ik ben niet de persoon die ik tien jaar geleden was." =>
          "I am not what I was ten years ago."
    ],
    [ "Waar is hij geboren?"          => "Where was he born?" ],
    [ "Als jij het zegt."             => "If you say so." ],
    [ "Hij spreekt zeer goed Engels." => "He speaks English very well." ],
    [ "Hij komt vaak laat op school." => "He is often late for school." ],
    [ "Hij komt vaak laat op school." => "He often comes late to school." ],
    [ "Om zes uur ben ik terug."      => "I'll be back at six." ],
    [ "Laten we dit nog eens doen."   => "Let's do this again." ],
    [
        "Zij houdt van niemand en niemand houdt van haar." =>
          "She likes no one and no one likes her."
    ],
    [ "Ik heb haar een nieuwe auto gekocht." => "I bought her a new car." ],
    [ "Je bent mijn beste vriend."           => "You are my best friend." ],
    [ "Je bent mijn beste vriend."           => "You're my best friend." ],
    [ "Hij zag er uit als een dokter."       => "He looked like a doctor." ],
    [ "Waarom kwam je niet?"                 => "Why didn't you come?" ],
    [
        "Ik hou niet van zijn manier van spreken." =>
          "I don't like his way of talking."
    ],
    [ "Ik ben op zoek naar mijn horloge." => "I'm looking for my watch." ],
    [ "Zo vader, zo zoon."                => "Like father, like son." ],
    [ "Waar ben je geboren?"              => "Where were you born?" ],
    [ "Hij komt zeker niet."              => "He's definitely not coming." ],
    [
        "Ik weet niet zeker wanneer hij op komt dagen." =>
          "I'm not sure when he'll turn up."
    ],
    [
        "Mijn zus is ouder dan mijn broer." =>
          "My sister is older than my brother."
    ],
    [ "Ik ben gek op hem!"                => "I'm crazy about him!" ],
    [ "Waarom ga je niet in mijn plaats?" => "Why don't you go in my place?" ],
    [ "Ik ga naar de kerk met de auto."   => "I go to church by car." ],
    [
        "Je moet na het eten niet naar buiten gaan." =>
          "You must not go out after dinner."
    ],
    [
        "Waarom geef je me niet wat ik hebben wil?" =>
          "Why don't you give me what I want to have?"
    ],
    [ "Je bent een mooie vrouw." => "You're a beautiful woman." ],
    [ "Vandaag is het koud."     => "It's cold today." ],
    [ "Het is koud vandaag."     => "It is cold today." ],
    [
        "Als ik jou was, zou ik hetzelfde doen." =>
          "If I were you, I would also do the same."
    ],
    [ "Niemand is te oud om te leren." => "Nobody is too old to learn." ],
    [ "De vrouw is aan het lezen."     => "The woman is reading." ],
    [ "Tot de volgende keer."          => "Until next time." ],
    [ "Ik heb alles wat ge wilt." => "I've got everything that you want." ],
    [
        "Of je het nu leuk vindt of niet, je moet gaan." =>
          "Whether you like it or not, you have to go."
    ],
    [
        "Of je het nu leuk vindt of niet, je moet gaan." =>
          "You have to go whether you like it or not."
    ],
    [
        "Of je het nu leuk vindt of niet, je moet gaan." =>
          "Like it or not, you have to go."
    ],
    [
        "Ik wil Engels kunnen spreken." => "I want to be able to speak English."
    ],
    [
        "Ik ga voor een paar dagen de stad uit." =>
          "I am leaving town for a few days."
    ],
    [
        "Onze leraar Engels is altijd op tijd." =>
          "Our English teacher is always on time."
    ],
    [ "Waarom moet ik dat doen?" => "Why do I have to do that?" ],
    [
        "Ik zou graag willen weten wie mijn ouders zijn." =>
          "I would like to know who my parents are."
    ],
    [ "Een man moet eerlijk zijn." => "A man must be honest." ],
    [ "Ze houdt erg van muziek."   => "She likes music very much." ],
    [
        "Engels spreken is moeilijk voor mij." =>
          "Speaking English is very difficult for me."
    ],
    [ "Kan ik nu de sleutel hebben?" => "Can I have the key now, please?" ],
    [
        "Het lijkt op sneeuw, is het niet?" => "It looks like snow, doesn't it?"
    ],
    [ "Ik zag hem nooit weer."  => "I never saw him again." ],
    [ "Je kan niet meer lezen?" => "You can't read anymore?" ],
    [
        "Ik heb mijn woordenboek niet bij de hand." =>
          "I haven't my dictionary at hand."
    ],
    [ "Gisteren zag ze een grote man." => "She saw a tall man yesterday." ],
    [ "Ik wou dat je dood was!"        => "I wish you were dead!" ],
    [ "Waarom ging je naar de stad?"   => "Why did you go to the city?" ],
    [ "Ik werk voor jou."              => "I work for you." ],
    [ "Je zou beter moeten weten."     => "You should have known better." ],
    [ "Ik ga naar de berg."            => "I go to the mountain." ],
    [
        "Waar zult ge morgen zijn op dit uur?" =>
          "Where will you be this time tomorrow?"
    ],
    [
        "Als hij groot is, zal hij dokter worden." =>
          "He is going to be a doctor when he grows up."
    ],
    [ "Dit is een heel vreemde brief." => "This is a very strange letter." ],
    [
        "Heb je alles klaar voor morgen?" =>
          "Have you gotten everything ready for tomorrow?"
    ],
    [ "Hij is geen dokter."      => "He is not a doctor." ],
    [ "Hij is geen dokter."      => "He's not a doctor." ],
    [ "Onze trein kwam op tijd." => "Our train arrived on time." ],
    [
        "Dit is niet mijn paraplu, het is die van iemand anders." =>
          "This isn't my umbrella; it's somebody else's."
    ],
    [
        "Het is te donker om goed te kunnen zien." =>
          "It is too dark to see clearly."
    ],
    [ "Ze zei geen woord tegen me." => "She didn't say even one word to me." ],
    [ "Hou je van heet eten?"       => "Do you like spicy food?" ],
    [ "Ik heb ze niet gekocht."     => "I didn't buy them." ],
    [ "Ze is langer dan haar zus."  => "She is taller than her sister." ],
    [ "Hij zal snel beter worden."  => "He'll get well soon." ],
    [ "Zag de auto er oud uit?"     => "Did the car look old?" ],
    [
        "Niet alle boeken zijn goede boeken." => "Not all books are good books."
    ],
    [ "Ik zou het boek moeten lezen." => "I should read the book." ],
    [ "Weet je het antwoord?"         => "You know the answer?" ],
    [ "Waarom was je laat?"           => "Why were you late?" ],
    [ "Het was gisteren koud."        => "It was cold yesterday." ],
    [ "Ik kan Engels spreken."        => "I can speak English." ],
    [ "Weet je het antwoord?"         => "Do you know the answer?" ],
    [ "Hij weet veel van bloemen."    => "He knows a lot about flowers." ],
    [ "Wat hij deed was niet fout."   => "What he did is not wrong." ],
    [ "Wat hij deed was niet fout."   => "What he did wasn't wrong." ],
    [ "Hoe meer, hoe beter."          => "The more, the better." ],
    [ "Hij heeft geld nodig."         => "He needs money." ],
    [ "Niemand woont in dit huis."    => "Nobody lives in this house." ],
    [ "Hij wordt een goede leraar."   => "He will be a good teacher." ],
    [ "Waar gaan ze nu naar toe?"     => "Where are they going to right now?" ],
    [ "Hij is erg boos op haar."      => "He's very angry with her." ],
    [
        "Het leven begint wanneer je klaar bent om het te leven." =>
          "Life begins when you're ready to live it."
    ],
    [ "Hij houdt zijn woord." => "He keeps his word." ],
    [
        "Dit is het horloge dat ik gisteren gekocht heb." =>
          "This is the watch I bought yesterday."
    ],
    [
        "Dit is het horloge dat ik gisteren gekocht heb." =>
          "This is the watch that I bought yesterday."
    ],
    [
        "Hij is hier altijd tussen vijf en zes." =>
          "He is always here between 5 and 6 o'clock."
    ],
    [
        "Ik vroeg aan mijn leraar wat ik nu moest doen." =>
          "I asked my teacher what I should do next."
    ],
    [ "Er moet een manier zijn."         => "There's got to be a way." ],
    [ "Het eten is nog niet klaar."      => "The food's not ready yet." ],
    [ "Heb je dit nieuw boek?"           => "Do you have this new book?" ],
    [ "Ik heb haar gisteren gezien."     => "I saw her yesterday." ],
    [ "Wat is de naam van deze rivier?"  => "What is the name of this river?" ],
    [ "Ik ben in staat Engels te lezen." => "I am able to read English." ],
    [ "Ik ben niet zo goed in tennis."   => "I'm not so good at tennis." ],
    [ "Mag ik nu gaan?"                  => "Can I leave now?" ],
    [ "Mag ik nu gaan?"                  => "May I leave now?" ],
    [ "Ik ben geen dokter."              => "I'm not a doctor." ],
    [ "Ik ging naar het ziekenhuis."     => "I went to the hospital." ],
    [ "Kan iemand anders dit niet doen?" => "Can't someone else do this?" ],
    [
        "Toen ik tien was, ging mijn broer bij ons thuis weg." =>
          "When I was 10, my brother left our home."
    ],
    [ "Dat vind ik erg leuk."          => "I like it very much." ],
    [ "Hoe heet je?"                   => "What is your name?" ],
    [ "Ik ging daar omdat ik dat wou." => "I went there because I wanted to." ],
    [ "Wat heeft hij vandaag gedaan?"  => "What has he done today?" ],
    [ "Mensen eten geen mensen."       => "Man doesn't eat man." ],
    [ "Ik wou dat ik haar gezien had." => "I wish I had seen her." ],
    [ "Ik kan het in jouw ogen zien."  => "I can see it in your eyes." ],
    [ "Wat doe je?"                    => "What are you doing?" ],
    [ "Wat doe je?"                    => "What do you do?" ],
    [ "Waarom ben je alleen?"          => "Why are you alone?" ],
    [
        "Hij zal over tien minuten terug zijn." =>
          "He will be back in ten minutes."
    ],
    [ "Ze gaf hem een horloge." => "She gave him a watch." ],
    [
        "Niet alle boeken op tafel zijn van mij." =>
          "Not every book on the desk belongs to me."
    ],
    [ "Dat is echt een goed idee." => "That's a really great idea." ],
    [
        "Ik ben niet gewoon vroeg op te staan." =>
          "I'm not accustomed to getting up early."
    ],
    [ "Je denkt te veel."               => "You think too much." ],
    [ "Ik wil de film zien."            => "I want to see the movie." ],
    [ "Ik wil de film zien."            => "I want to watch the film." ],
    [ "Wanneer kom je terug naar huis?" => "When do you return home?" ],
    [
        "Ik ben geen dokter, maar een leraar." =>
          "I'm not a doctor, but a teacher."
    ],
    [
        "Ze ging voor de eerste keer naar Parijs." =>
          "She went to Paris for the first time."
    ],
    [ "Ik heb met hen niets te maken."   => "I have nothing to do with them." ],
    [ "Ik kocht een nieuwe auto."        => "I bought a new car." ],
    [ "Laten we haar alleen laten."      => "Let's leave her alone." ],
    [ "Men kan niet leven zonder water." => "One can't live without water." ],
    [
        "Ik zou in de problemen kunnen komen als ik dat deed." =>
          "I could get in trouble if I did that."
    ],
    [ "Waarom is het zo heet?"          => "Why is it so hot?" ],
    [ "Ik ben zo moe!"                  => "I'm so tired!" ],
    [ "Het kost te veel."               => "It costs too much." ],
    [ "Ik heb goed nieuws voor u."      => "I have good news for you." ],
    [ "Ik heb een nieuwe fiets nodig."  => "I need a new bicycle." ],
    [ "Ik voel me niet goed."           => "I don't feel well." ],
    [ "We zullen altijd vrienden zijn." => "We'll always be friends." ],
    [ "Ik mag je niet langer."          => "I no longer like you." ],
    [ "Waar heb je de jongen gezien?"   => "Where did you see the boy?" ],
    [ "Mijn moeder houdt van muziek."   => "My mother loves music." ],
    [ "We hebben een plan nodig."       => "We need a plan." ],
    [
        "Ik ga vandaag naar het ziekenhuis." => "I'll go to the hospital today."
    ],
    [ "Wil je rijk zijn?" => "Do you want to be rich?" ],
    [
        "Ik zal doen wat ik kan om te helpen." =>
          "I'll do what I can to help you."
    ],
    [
        "Eet waar je zin in hebt." =>
          "Help yourself to anything you'd like to eat."
    ],
    [ "Ik reis graag met mijn auto." => "I like to travel with my car." ],
    [ "De man keek me aan."          => "The man looked at me." ],
    [ "Ik begrijp u niet."           => "I do not understand you." ],
    [
        "Het spijt me dat ik je zo lang niet geschreven heb." =>
          "I am sorry that I haven't written to you in such a long time."
    ],
    [
        "Ik weet niet precies waar ik geboren ben." =>
          "I don't know the exact place I was born."
    ],
    [
        "Ik zal hem morgen de waarheid moeten zeggen." =>
          "I will have to tell him the truth tomorrow."
    ],
    [ "Ik denk dus ik ben."  => "I think, therefore I am." ],
    [ "Ik denk, dus ik ben." => "I think, therefore I am." ],
    [
        "Het lijkt erop dat er geen geld meer is." =>
          "It seems like there's no money left."
    ],
    [
        "Voor zover ik weet is hij een eerlijk man." =>
          "As far as I know, he's an honest man."
    ],
    [
        "Weet je die dag nog, dat we dat ongeluk gezien hebben?" =>
          "Do you remember the day when we saw the accident?"
    ],
    [ "Ik zal het hetzelfde doen."    => "I will do it the same." ],
    [ "Ik wist wel dat je zou komen." => "I knew you'd come." ],
    [
        "We zouden iets dan dit gaan doen." =>
          "We should make something like that."
    ],
    [
        "Ik kan er naartoe, waar je ook wil." =>
          "I can go there, wherever you want."
    ],
    [ "Ik denk dat hij boos was." => "I think he was angry." ],
    [ "Er is niets mis met hem."  => "There is nothing wrong with him." ],
    [ "Zij is mijn zus."          => "She's my sister." ],
    [ "Hij is leraar Engels."     => "He is an English teacher." ],
    [
        "Je gaat de problemen van het leven gewoon uit de weg." =>
          "You're just running away from life's problems."
    ],
    [ "Hij is veel groter dan gij." => "He's much taller than you." ],
    [
        "Mijn vader heeft een nieuwe auto gekocht." =>
          "My father has bought a new car."
    ],
    [
        "Mijn vader heeft een nieuwe auto gekocht." =>
          "My father bought a new car."
    ],
    [ "Ik hou van talen." => "I like languages." ],
    [ "Ik hou van talen." => "I love languages." ],
    [ "Ik hou van talen!" => "I like languages!" ],
    [
        "Waarom heb je spijt van iets dat je niet gedaan hebt?" =>
          "Why are you sorry for something you haven't done?"
    ],
    [
        "Het is moeilijk om drie talen te spreken." =>
          "It's hard to speak three languages."
    ],
    [ "Waarom moet ik dit doen?"        => "Why do I have to do this?" ],
    [ "Hij is mijn eerste liefde."      => "He's my first love." ],
    [ "Ik ben nu erg moe."              => "I'm very tired now." ],
    [ "Ik heb een droom."               => "I have a dream." ],
    [ "Is dit jouw fiets?"              => "Is this your bicycle?" ],
    [ "Ik denk dat het mogelijk is."    => "I think that it's possible." ],
    [ "Ik denk dat het mogelijk is."    => "I guess it's possible." ],
    [ "Ik zie nog altijd niets."        => "I still don't see anything." ],
    [ "Ik heb jullie nodig."            => "I need you." ],
    [ "Het is te warm."                 => "It is too hot." ],
    [ "Ik weet niet de waarheid weten." => "I don't know the truth." ],
    [ "Weten ze over ons?"              => "Do they know about us?" ],
    [ "Waarom kwam ze niet?"            => "Why didn't she come?" ],
    [
        "Door het ongeval ging ik te laat naar school." =>
          "Because of the accident I went too late to school."
    ],
    [
        "Omdat het al laat was ging ik naar bed." =>
          "Since it was already late, I went to sleep."
    ],
    [
        "Het was erg leuk je weer eens gezien te hebben." =>
          "It was very nice seeing you again."
    ],
    [
        "Ik heb geen zin om uit eten te gaan vanavond." =>
          "I don't feel like eating out this evening."
    ],
    [ "Denk er eens over na."         => "Think about it." ],
    [ "Het is een beetje koud."       => "It is a little cold." ],
    [ "Ik hou niet van thee."         => "I don't like tea." ],
    [ "Ik voel me niet goed vandaag." => "I'm not feeling well today." ],
    [
        "Ze houdt van de jongen alsof het haar eigen kind was." =>
          "She loves the boy as if he were her own child."
    ],
    [ "Ik zie het huis."           => "I see the house." ],
    [ "De telefoon doet het niet." => "The telephone doesn't work." ],
    [
        "Ik vraag mij af of er iets met hem gebeurd is." =>
          "I wonder if anything happened to him."
    ],
    [ "Ken heeft meer boeken dan jou."    => "Ken has more books than you." ],
    [ "Gisteren heb ik een boek gekocht." => "I bought a book yesterday." ],
    [ "Gisteren heb ik een boek gekocht." => "Yesterday I bought a book." ],
    [ "Gisteren heb ik een boek gekocht." => "Yesterday, I bought a book." ],
    [ "Ik was erg moe."                   => "I was very tired." ],
    [ "Ben je blij?"                      => "Are you happy?" ],
    [
        "Zijn jullie voor of tegen zijn idee?" =>
          "Are you for or against his idea?"
    ],
    [ "Ik denk dat hij kwaad is." => "I think he's angry." ],
    [ "Jij bent ook een mooie!"   => "You're a nice one!" ],
    [
        "Je moet van je fouten leren." => "You should learn from your mistakes."
    ],
    [ "Dat is mijn idee." => "That's my idea." ],
    [
        "Ik heb besloten haar te zeggen dat ik van haar hou." =>
          "I decided on telling her of my love."
    ],
    [
        "Je had hem de waarheid moeten zeggen." =>
          "You should have told him the truth."
    ],
    [ "Hoe lang geleden was dat?" => "How long ago was that?" ],
    [ "Wat, als ik arm ben?"      => "What if I am poor?" ],
    [ "Je kan je eigen maken."    => "You can make your own." ],
    [ "Iedereen houdt van haar."  => "Everybody loves her." ],
    [ "Mijn broer is leraar."     => "My brother is a teacher." ],
    [ "Hij vroeg mij om hulp."    => "He asked me for help." ],
    [
        "Ik heb besloten haar te zeggen dat ik van hem hou." =>
          "I decided to tell her that I love him."
    ],
    [
        "Ik heb besloten hem te zeggen dat ik van haar hou." =>
          "I decided to tell him that I love her."
    ],
    [
        "Je moet altijd de waarheid spreken." =>
          "You must always tell the truth."
    ],
    [
        "Het is niet moeilijk als je studeert." =>
          "It's not difficult if you study."
    ],
    [ "Ze doen het elke week."    => "They do it each week." ],
    [ "Zij had niet genoeg geld." => "She didn't have enough money." ],
    [ "De auto is klaar."         => "The car is ready." ],
    [
        "Ik heb besloten hem te zeggen dat ik van hem hou." =>
          "I decided on telling him of my love."
    ],
    [
        "Deze doos is niet zo groot als die." =>
          "This box is not as big as that one."
    ],
    [
        "Dit is hetzelfde woordenboek als ik heb." =>
          "This is the same dictionary as I have."
    ],
    [ "Het is bijna zes uur." => "It's almost six o'clock." ],
    [
        "Het is moeilijk om een vreemde taal te leren." =>
          "Learning a foreign language is difficult."
    ],
    [
        "Het is moeilijk om een vreemde taal te leren." =>
          "It's difficult to learn a foreign language."
    ],
    [
        "Het is moeilijk om een vreemde taal te leren." =>
          "It's hard to learn a foreign language."
    ],
    [
        "Ik denk dat je me voor iemand anders neemt." =>
          "I think you've mistaken me for someone else."
    ],
    [ "Ik kan niet aan alles denken." => "I can't think of everything." ],
    [
        "Wat hij zei, bleek waar te zijn." =>
          "What he said turned out to be true."
    ],
    [ "Het is een beetje koud vandaag." => "It's a little cold today." ],
    [ "Ze nam haar boek."               => "She took her book." ],
    [ "Laten we vrienden zijn."         => "Let's be friends." ],
    [ "Ik mag hem wel."                 => "I rather like him." ],
    [
        "Ge moet Engels leren, of ge wilt of niet." =>
          "You must learn English whether you like it or not."
    ],
    [ "Heeft hij je de waarheid gezegd?" => "Did he tell you the truth?" ],
    [
        "Ik was erg bang in het vliegtuig." =>
          "I was very afraid in the airplane."
    ],
    [
        "Gisteren heeft hij een grote man gezien." =>
          "Yesterday he saw a big man."
    ],
    [ "Ik ben bang dat hij in gesprek is." => "I'm afraid the line is busy." ],
    [
        "Ken jij de stad waar hij woont?" =>
          "Do you know the town where he lives?"
    ],
    [ "Hoe heet hij?"                => "What is his name?" ],
    [ "Ik ben blij je weer te zien." => "I'm glad to see you again." ],
    [ "Ik ben blij je weer te zien." => "I'm happy to see you again." ],
    [
        "Vraag hem eens of hij Japans spreekt." =>
          "Ask him if he can speak Japanese."
    ],
    [ "Iedereen spreekt goed over hem." => "Everybody speaks well of him." ],
    [ "Wil je nog wat thee?"            => "Would you like some more tea?" ],
    [
        "Iedereen spreekt goed over hem." =>
          "He is well spoken of by everybody."
    ],
    [ "Dat is een tafel."             => "That is a table." ],
    [ "Dat is een tafel."             => "That's a table." ],
    [ "Ik heb er niets mee te maken." => "I have nothing to do with it." ],
    [ "Laat het me één keer zeggen."  => "Let me say this just once." ],
    [
        "Je ziet er goed uit in die kleren." =>
          "You look good in those clothes."
    ],
    [ "Ik ben erg moe vandaag."     => "I'm really tired today." ],
    [ "Ik geef ze morgen aan haar." => "I'm giving them to her tomorrow." ],
    [
        "Ik ben van plan nooit meer te drinken." =>
          "I plan to never drink again."
    ],
    [ "Ik zie u graag." => "I love you." ],
    [ "Ik ben hem zat." => "I'm fed up with him." ],
    [
        "We willen geen mensen zoals jij in deze stad." =>
          "We don't want people like you in this town."
    ],
    [ "Waar vond hij het geld?"          => "Where did he find the money?" ],
    [ "Dat heeft er niets mee te maken." => "That has nothing to do with it." ],
    [
        "Zij is met hem getrouwd voor zijn geld." =>
          "She married him for his money."
    ],
    [
        "Het is hier erg warm in de zomer." =>
          "It's really hot here in the summer."
    ],
    [
        "Ze hadden niet veel om te eten." =>
          "They did not have much food to eat."
    ],
    [ "Heeft u dit nieuw boek?" => "Do you have this new book?" ],
    [ "Ik zei het je toch!"     => "I told you so!" ],
    [ "Wat ben je mooi!"        => "How beautiful you are!" ],
    [ "Hij was erg moe."        => "He was very tired." ],
    [ "Ik heb alles gezegd."    => "I've said everything." ],
    [ "Mag ik je iets vragen?"  => "Might I ask you a question?" ],
    [ "Mag ik je iets vragen?"  => "May I ask you a question?" ],
    [ "Mag ik je iets vragen?"  => "Do you mind if I ask you a question?" ],
    [ "Mag ik je iets vragen?"  => "Can I ask you a question?" ],
    [
        "Dit boek is niet zo interessant als dat boek." =>
          "This book isn't as interesting as that book."
    ],
    [ "Wat doet jullie vader?" => "What does your father do?" ],
    [
        "Ik ben moe en ik wil naar bed gaan." =>
          "I am tired, and I want to go to bed."
    ],
    [
        "Het is de schuld van mijn vader." =>
          "The fault is on the part of my father."
    ],
    [ "Doe wat ge moet doen." => "Do what you have to do." ],
    [
        "Ik denk dat je een fout hebt gemaakt." =>
          "I think you have made a mistake."
    ],
    [ "Waar heeft u de jongen gezien?" => "Where did you see the boy?" ],
    [ "Hij is getrouwd voor het geld." => "He married for money." ],
    [
        "Ik heb een brief geschreven in het Engels." =>
          "I wrote a letter in English."
    ],
    [ "De hond ging weg."           => "The dog went away." ],
    [ "Mijn vader is dokter."       => "My father is a doctor." ],
    [ "Ze vroeg mij om hulp."       => "She asked me for help." ],
    [ "We wonen in een huis."       => "We live in a house." ],
    [ "Ik weet dat dit zal werken." => "I know this will work." ],
    [
        "Ik wou dat je met ons mee kon komen." =>
          "I wish you could come with us."
    ],
    [
        "Ik gaf mijn broer een woordenboek." =>
          "I gave my brother a dictionary."
    ],
    [ "Ik ken niemand in deze stad." => "I don't know anybody in this town." ],
    [ "Ik ken niemand in deze stad." => "I know no one in this city." ],
    [ "Ze heeft niets gezegd."       => "She did not say anything." ],
    [ "Kom je hier vaak?"            => "Do you come here often?" ],
    [
        "Als twee mensen hetzelfde doen, is het niet hetzelfde." =>
          "When two are doing the same thing, it is not the same."
    ],
    [ "Ik kocht een horloge voor haar." => "I bought her a clock." ],
    [ "Wat wilt je nog meer doen?"      => "What else do you want to do?" ],
    [ "Ge hebt hem niet gezien."        => "You didn't see him." ],
    [
        "Ken je het meisje dat aan het raam staat?" =>
          "Do you know the girl standing by the window?"
    ],
    [
        "Ik kan niet meer tegen deze pijn." =>
          "I cannot bear the pain any more."
    ],
    [
        "Ze heeft geen woord tegen me gezegd." =>
          "Not a word did she say to me."
    ],
    [
        "Mijn vader is niet thuis op het moment." =>
          "My dad is not at home for the moment."
    ],
    [ "Ik heb een auto gekocht." => "I have bought a car." ],
    [
        "Ik begrijp nog steeds niet wat je van me wilt." =>
          "I still don't understand what you want from me."
    ],
    [
        "Wanneer kom je terug naar school?" =>
          "When will you come back to school?"
    ],
    [ "Hij is niet gek."            => "He is no fool." ],
    [ "Spreekt hier iemand Engels?" => "Does anyone here speak English?" ],
    [ "Wil je iets om te drinken?"  => "Would you like something to drink?" ],
    [ "Waar heeft u deze vrouw gezien?" => "Where did you see this woman?" ],
    [ "Hij lijkt eerlijk te zijn."      => "He seems to be honest." ],
    [ "Ik wil deze film zien."          => "I want to see this movie." ],
    [
        "Ik zou graag iets te drinken hebben." => "I'd like something to drink."
    ],
    [
        "Ik zou graag iets te drinken hebben." =>
          "I would like something to drink."
    ],
    [
        "Ik weet niet of je haar leuk vindt." =>
          "I don't know whether you like her or not."
    ],
    [ "Je hebt het gedaan!" => "You've done it!" ],
    [
        "Het enige waar hij aan denkt, is haar zien." =>
          "His one thought is to see her."
    ],
    [ "Je mag het boek houden." => "You may keep the book." ],
    [
        "Jullie moeten niet komen morgen." => "You don't have to come tomorrow."
    ],
    [ "Het wordt gezegd dat hij heel rijk is." => "They say he's very rich." ],
    [
        "Ze vroeg om hulp, maar er kwam niemand." =>
          "She requested help, but no one came."
    ],
    [ "Ik wil iets om te drinken."    => "I want something to drink." ],
    [ "Ik wist het wel."              => "It was just as I thought." ],
    [ "Ik begrijp je vraag niet."     => "I don't understand your question." ],
    [ "Ik zou mijn zoon willen zien." => "I'd like to see my son." ],
    [ "We zijn even oud."             => "We're the same age." ],
    [ "Ik heb weinig geld."           => "I'm short of money." ],
    [ "Ik ben boos op haar."          => "I'm angry with her." ],
    [ "Ik hoop je snel te zien."      => "I hope to see you soon." ],
    [
        "Engels is een zeer moeilijk te leren taal." =>
          "English is a hard language to learn."
    ],
    [
        "Ik wou dat hij hier was om ons te helpen." =>
          "I wish that he was here to help us."
    ],
    [
        "Het is duidelijk dat hij het antwoord weet." =>
          "It is clear that he knows the answer."
    ],
    [ "Ik ben helemaal niet moe." => "I'm not at all tired." ],
    [ "Dit is de laatste keer."   => "This is the last time." ],
    [ "Ik ben helemaal niet moe." => "I'm not tired at all." ],
    [ "Hou je niet van appels?"   => "Don't you like apples?" ],
    [ "Het is al zeven uur."      => "It's already seven." ],
    [
        "De koffie was zo heet, dat ik hem niet kon drinken." =>
          "The coffee was so hot that I couldn't drink it."
    ],
    [
        "Ik kwam je broer tegen op straat." =>
          "I ran into your brother on the street."
    ],
    [
        "Ik moet het werk af hebben tegen vier uur." =>
          "I have to finish the work by four o'clock."
    ],
    [ "Wat is het warm vandaag!"       => "How hot it is today!" ],
    [ "Dit is niet te geloven."        => "This in unbelievable!" ],
    [ "Hij is een appel aan het eten." => "He's eating an apple." ],
    [
        "We gaan naar school omdat we willen leren." =>
          "We go to school because we want to learn."
    ],
    [ "Wat is er met hem gebeurd?" => "What happened to him?" ],
    [ "Wat is er met hem gebeurd?" => "What has happened to him?" ],
    [
        "Ze zeggen dat hij erg rijk was." => "It is said that he was very rich."
    ],
    [ "Zoek het op in je woordenboek." => "Look it up in your dictionary." ],
    [
        "Ik dacht dat dat boek moeilijk te lezen was." =>
          "I thought that book was difficult to read."
    ],
    [
        "Het was zo koud, dat ik de hele dag thuis bleef." =>
          "It was so cold that I stayed at home all day."
    ],
    [
        "Ik moet morgen een hoop werk doen." =>
          "I have a lot of work to do tomorrow."
    ],
    [
        "Hij heeft niet zoveel boeken als zij." =>
          "He doesn't have as many books as she does."
    ],
    [
        "We moeten het werk binnen een dag doen." =>
          "We have to do the work in a day."
    ],
    [
        "Er is tijd genoeg om dit huiswerk af te maken." =>
          "There is enough time to finish this homework."
    ],
    [
        "Het is niet duidelijk waar en wanneer ze werd geboren." =>
          "It is not clear when and where she was born."
    ],
    [ "Ik hoop echt dat dit een droom is." => "I sure hope this is a dream." ],
    [ "Mijn oom heeft drie kinderen."      => "My uncle has three children." ],
    [
        "Komt het je uit morgen met het werk te beginnen?" =>
          "Will it be convenient for you to start work tomorrow?"
    ],
    [
        "Als je zo tegen me doet, zeg ik niets meer." =>
          "If you turn on me like that, I won't say another word."
    ],
    [ "Ik ben blij u weer te zien." => "I'm glad to see you again." ],
    [ "Is de man oud of jong?"      => "Is the man old or young?" ],
    [ "Ik hou niet van appels."     => "I don't like apples." ],
    [
        "Ik weet of hij een vijand is of niet." =>
          "I know whether or not he is an enemy."
    ],
    [
        "Denk je dat het morgen mooi weer wordt?" =>
          "Do you think tomorrow will be a nice day?"
    ],
    [ "Je moet vroeg naar bed gaan." => "You should go to bed early." ],
    [
        "Ik herinner mij de naam van die man heel goed." =>
          "I remember that man's name very well."
    ],
    [ "We hebben geld nodig." => "We need money." ],
    [ "Wat is uw antwoord?"   => "What's your answer?" ],
    [ "Hoe heet u?"           => "What is your name?" ],
    [ "De hond is dood."      => "The dog is dead." ],
    [ "De jongen kwam terug." => "The boy came back." ],
    [
        "Je bent nog net hetzelfde zoals je altijd was." =>
          "You are just the same as you always were."
    ],
    [ "Deze telefoon doet het niet."    => "This telephone is out of order." ],
    [ "Hij ging de kamer binnen."       => "He came into the room." ],
    [ "Het is goed om je best te doen." => "It is good to do your best." ],
    [
        "Hem werd gezegd op te staan en dat deed hij." =>
          "He was told to stand up, and he did so."
    ],
    [
        "Ik ben getrouwd en heb twee kinderen." =>
          "I am married and have two children."
    ],
    [ "Zal ik hier op je wachten?"     => "Should I wait for you here?" ],
    [ "Wil je koffie?"                 => "Would you like some coffee?" ],
    [ "Ik heb de film al eens gezien." => "I have seen the film before." ],
    [ "Hij ziet er een goed mens uit." => "He seems like a good person." ],
    [
        "Hij heeft altijd Japans willen leren." =>
          "He always wanted to study Japanese."
    ],
    [ "Woont ge bij uw ouders?" => "Do you live with your parents?" ],
    [
        "Er moet nog veel gedaan worden." =>
          "There's still plenty that needs to be done."
    ],
    [
        "Ik denk dat zijn leven in gevaar is." =>
          "I think his life is in danger."
    ],
    [ "Doe wat hij je zegt."      => "Do as he tells you." ],
    [ "Dat was Chinees voor mij." => "That was double-dutch to me." ],
    [ "Doe wat hij je zegt."      => "Do what he tells you." ],
    [
        "Weet ge wat het is, echt honger hebben?" =>
          "Do you know what it is like to be really hungry?"
    ],
    [
        "Mijn oom heeft dit boek voor mij gekocht." =>
          "My uncle bought me this book."
    ],
    [ "Ik ben over tien minuten terug." => "I'll be back in ten minutes." ],
    [ "Hij zei geen woord."             => "He didn't say a word." ],
    [ "Vader is een goed mens."         => "Father is a good person." ],
    [
        "Wat zij zei bleek niet waar te zijn." =>
          "What she said turned out to be false."
    ],
    [
        "Wat voor spel denk je dat dit is?" =>
          "What kind of game do you think this is?"
    ],
    [ "Ik voel mij al veel beter."      => "I feel much better already." ],
    [ "Hij is een hoofd groter dan ik." => "He is taller than me by a head." ],
    [ "Hij is een hoofd groter dan ik." => "He is a head taller than me." ],
    [ "Spreekt er hier iemand Japans?"  => "Does anyone here speak Japanese?" ],
    [ "Woon je in de stad?"             => "Do you live in the city?" ],
    [
        "Hij is rijk maar hij is niet gelukkig." =>
          "He is rich but he is not happy."
    ],
    [
        "Weet jij waarom ze niet kon komen?" =>
          "Do you know why she couldn't come?"
    ],
    [ "Lees het nog een keer." => "Read it once more." ],
    [ "Kijk niet zo naar me."  => "Don't look at me that way." ],
    [ "Wie is uw leraar?"      => "Who is your teacher?" ],
    [ "Wie is uw leraar?"      => "Who's your teacher?" ],
    [
        "Deze doos is twee keer zo groot als die daar." =>
          "This box is twice as large as that one."
    ],
    [ "Ik heb niets gezien." => "I saw nothing." ],
    [
        "Hij vroeg me of ik hem een plezier kon doen." =>
          "He asked me if I could do him a favor."
    ],
    [ "Hij ging zijn kamer binnen." => "He entered his room." ],
    [ "Ik kan het licht zien."      => "I can see the light." ],
    [ "Ik kan je niet goed horen."  => "I can't hear you well." ],
    [ "Ken wil een fiets."          => "Ken wants a bicycle." ],
    [
        "Ik ben bang dat ik je boos zou maken." =>
          "I'm afraid that I might make you angry."
    ],
    [
        "Als ik een jongen was zou ik op honkbal kunnen gaan." =>
          "If I were a boy, I could join a baseball team."
    ],
    [ "Het is altijd leuk om je te horen." => "It's always nice to hear you." ],
    [
        "Morgen op dit uur zouden we in Parijs moeten zijn." =>
          "We should be in Paris by this time tomorrow."
    ],
    [
        "Hij had twee uur nodig om zijn huiswerk te maken." =>
          "It took him two hours to finish his homework."
    ],
    [
        "Ik heb nauwelijks nog wat geld over." =>
          "I have hardly any money left."
    ],
    [ "Je doet me denken aan je moeder." => "You remind me of your mother." ],
    [
        "Ge kunt niet voor iedereen goed doen." =>
          "Don't try to be all things to all men."
    ],
    [ "Vandaag zullen we thuis zijn." => "We will be at home today." ],
    [ "Hier is een ziekenhuis."       => "This is a hospital." ],
    [ "We zijn allemaal vrienden."    => "We're all friends." ],
    [ "Iedereen weet dat."            => "Anybody knows it." ],
    [
        "De school had een nieuwe leraar nodig." =>
          "The school needed a new teacher."
    ],
    [ "Elke jongen heeft een fiets." => "Each boy has a bike." ],
    [
        "Ik hou niet van mensen die snel boos worden." =>
          "I don't like people who get angry easily."
    ],
    [
        "Het lijkt erop dat ik vandaag ook laat ben." =>
          "It seems I'll be late today too."
    ],
    [ "Ik heb enkele boeken."          => "I have a few books." ],
    [ "Ik ben in Parijs."              => "I am in Paris." ],
    [ "Ik heb zin om iets te drinken." => "I feel like having a drink." ],
    [
        "Het is leuk om een vreemde taal te leren." =>
          "Learning a foreign language is fun."
    ],
    [
        "Het is leuk om een vreemde taal te leren." =>
          "It's fun to learn a foreign language."
    ],
    [ "Mijn ouders houden echt van mij." => "My parents really love me." ],
    [ "Ik vind school niet leuk."        => "I don't like school." ],
    [
        "Heeft u geen zin in een beetje thee?" =>
          "Wouldn't you like to drink some tea?"
    ],
    [
        "Wat is het verschil tussen deze twee?" =>
          "What's the difference between these two?"
    ],
    [
        "Laat het me weten als je vragen hebt, alstublieft." =>
          "Please let me know if you have any questions."
    ],
    [
        "Wat maakt dat jij zo denkt?" =>
          "What is it that makes you think that way?"
    ],
    [
        "Hij verdient drie keer meer dan ik." =>
          "He earns three times more than me."
    ],
    [
        "Ik zou niet graag in haar schoenen willen staan." =>
          "I wouldn't like to be in her shoes."
    ],
    [ "Ik heb haar ERG goed leren kennen." => "I got to know her REAL well." ],
    [
        "Waar waren jullie tussen één en drie uur?" =>
          "Where were you between one and three o'clock?"
    ],
    [ "Het leven is mooi." => "Life is beautiful." ],
    [ "Waar zijn uw ogen?" => "Where are your eyes?" ],
    [ "Ik ben moe nu."     => "I'm tired now." ],
    [
        "Mijn moeder stierf toen ik nog een kind was." =>
          "My mother died when I was a kid."
    ],
    [
        "Zij moet het gisteren gedaan hebben." =>
          "She must have done it yesterday."
    ],
    [ "Ik zal je hulp nodig hebben." => "I'm going to need your help." ],
    [
        "Het was donker en koud in de kamer." =>
          "It was dark and cold in the room."
    ],
    [
        "Deze horloge lijkt op die die ik gisteren verloren heb." =>
          "This watch is similar to mine I lost yesterday."
    ],
    [ "Het is erg warm vandaag."  => "It is very hot today." ],
    [ "Het is vandaag erg warm."  => "It's awfully hot today." ],
    [ "Geloof je wat hij zei?"    => "Do you believe what he said?" ],
    [ "Hij kwam de kamer binnen." => "He entered the room." ],
    [ "Hoe oud is je zoon?"       => "How old is your son?" ],
    [
        "Dit boek zal je goed van pas komen." =>
          "This book will be of great use to you."
    ],
    [
        "Ik had niets te maken met het ongeluk." =>
          "I had nothing to do with the accident."
    ],
    [ "Het is niet ver van Parijs." => "It is not far to Paris." ],
    [ "Ik had een idee."            => "I had an idea." ],
    [
        "Af en toe komt zij te laat naar school." =>
          "She's sometimes late for school."
    ],
    [ "Je doet me denken aan mijn moeder." => "You remind me of my mother." ],
    [
        "Er is geen reden waarom ik naar daar zou gaan." =>
          "There is no reason why I should go there."
    ],
    [
        "Dit boek is geschreven in het Engels." =>
          "This book is written in English."
    ],
    [ "Ik ben zeer trots op mijn vader." => "I'm very proud of my father." ],
    [
        "Ze zegt dat ze van bloemen houdt." =>
          "She says that she likes flowers."
    ],
    [ "Hij heeft het niet nodig te werken." => "He doesn't need to work." ],
    [ "Ze zegt dat ze van bloemen houdt."   => "She says she likes flowers." ],
    [
        "Hij denkt nog steeds dat we vrienden zijn." =>
          "He still thinks we're friends."
    ],
    [ "Ik ben kwaad op haar."           => "I'm angry with her." ],
    [ "Dit is precies wat ik wou."      => "This is just what I wanted." ],
    [ "Dit is precies wat ik wou."      => "It's exactly what I wanted." ],
    [ "Wanneer heb je je Auto gekocht?" => "When did you buy your car?" ],
    [
        "Het is een goede jongen en hij is heel sterk." =>
          "He is a good boy, and he is very strong."
    ],
    [
        "Beide zijn we op zoek naar iets wat er niet is." =>
          "We are both looking for something that isn't there."
    ],
    [ "Er is nog geen nieuws."          => "So far there has been no news." ],
    [ "Weet gij waar hij woont?"        => "Do you know where he lives?" ],
    [ "Ik ben bang voor het donker."    => "I have a fear of the dark." ],
    [ "Hij weet waar we wonen."         => "He knows where we live." ],
    [ "Ik ben hier nieuw."              => "I am new here." ],
    [ "Ik ben hier nieuw."              => "I'm new here." ],
    [ "Hij was te kwaad om te spreken." => "He was too angry to speak." ],
    [ "Deze auto is net als nieuw."     => "This car is like new." ],
    [ "Waarom vraag je dat?"            => "Why do you ask?" ],
    [ "De hond was dood."               => "The dog was dead." ],
    [
        "Je bent vrij om te doen wat je wilt." =>
          "You may be free to do what you like."
    ],
    [
        "Ik ben niet tevreden met wat je gedaan hebt." =>
          "I'm not satisfied with what you've done."
    ],
    [
        "Het ziet er veel erger uit dan het is." =>
          "It looks a lot worse than it is."
    ],
    [ "Ik heb een foto van haar gemaakt." => "I took a picture of her." ],
    [ "Hij ziet er blij uit."             => "He looks happy." ],
    [ "Hoe gaan we daar komen?"           => "How are we going to get there?" ],
    [
        "Vandaag is zo warm als gisteren." => "It is as hot a day as yesterday."
    ],
    [
        "Je hoeft niet zo vroeg op te staan." =>
          "You don't have to get up so early."
    ],
    [ "We hebben geen thee meer."     => "We've run out of tea." ],
    [ "We hebben wat eten nodig."     => "We are in need of some food." ],
    [ "Ik vroeg hem om me te helpen." => "I asked him to help me." ],
    [
        "Als ik rijk was, zou ik naar het buitenland gaan." =>
          "If I were rich, I'd go abroad."
    ],
    [ "Ze liet haar gaan." => "She let her go." ],
    [
        "Met deze regen zal hij niet komen." =>
          "He won't come in a rain like this."
    ],
    [
        "Ze is ongeveer even oud als ik." => "She's about the same age as I am."
    ],
    [ "Je komt precies op tijd." => "You came at just the right time." ],
    [ "Waar was je toch?"        => "Just where were you?" ],
    [ "Waar is de krant?"        => "Where is the newspaper?" ],
    [
        "Ik moet aan mijn kinderen denken." => "I have to think of my children."
    ],
    [ "Morgen komt hij aan in Parijs." => "He arrives tomorrow, in Paris." ],
    [ "Een maand is te weinig tijd."   => "A month is too little time." ],
    [ "Ik mis je heel erg."            => "I miss you very much." ],
    [ "Een deel van zijn verhaal is waar." => "Part of his story is true." ],
    [
        "Het spijt me dat ik je zo lang heb laten wachten." =>
          "I'm sorry I've kept you waiting so long."
    ],
    [
        "De mensen die hier wonen zijn onze vrienden." =>
          "The people who live there are our friends."
    ],
    [ "Ze ging verder met het werk."       => "She continued with the work." ],
    [ "Hoe oud bent u?"                    => "What is your age?" ],
    [ "Hoe oud bent u?"                    => "What's your age?" ],
    [ "Hoe oud bent u?"                    => "How old are you?" ],
    [ "Bent u een dokter?"                 => "Are you a doctor?" ],
    [ "Ik vond het niet leuk."             => "I didn't like it." ],
    [ "Ik vraag me af of hij getrouwd is." => "I wonder if he is married." ],
    [ "Hebben jullie kinderen?"            => "Do you have any children?" ],
    [
        "Het is tien jaar geleden, toen hij in Amerika was." =>
          "Ten years have passed since he went to America."
    ],
    [
        "Ik ben geen dokter, maar leraar." =>
          "I am not a doctor, but a teacher."
    ],
    [ "Ik wil dat hij daar naartoe gaat." => "I want him to go there." ],
    [
        "Je ziet er uit als je oudere broer." =>
          "You look just like your older brother."
    ],
    [
        "Dit is, op enkele fouten na, een goed boek." =>
          "This is a good book except for a few mistakes."
    ],
    [
        "Ik weet of hij wel of niet een vijand is." =>
          "I know whether or not he is an enemy."
    ],
    [
        "Ik weet niets van hem, behalve zijn naam." =>
          "I don't know anything about him, other than his name."
    ],
    [
        "Je moet leren van je eigen fouten." =>
          "You must learn from your mistakes."
    ],
    [
        "Je moet leren van je eigen fouten." =>
          "You must learn from your own mistakes."
    ],
    [ "Het boek ligt op de tafel." => "The book is on the table." ],
    [ "Ik werk in een ziekenhuis." => "I work in a hospital." ],
    [ "Gisteren was ik ziek."      => "I was ill yesterday." ],
    [ "Mijn ouders zijn oud."      => "My parents are old." ],
    [
        "Ik zal komen wanneer ik mijn huiswerk gedaan heb." =>
          "I'll come when I have done my homework."
    ],
    [
        "De telefoon ging een paar keer over." =>
          "The telephone rang several times."
    ],
    [ "Ik geloof niet in dit verhaal." => "I don't believe to this story." ],
    [
        "Ik was van plan om te gaan, maar ben het vergeten." =>
          "I intended to go, but forgot to."
    ],
    [ "De jongen is heel eerlijk." => "The boy is very honest." ],
    [
        "Een leven zonder liefde heeft helemaal geen zin." =>
          "Life without love has no meaning at all."
    ],
    [ "Heb ik het mis?"            => "Am I wrong?" ],
    [ "Ik kom terug."              => "I'll come back." ],
    [ "Dat is niet mogelijk meer." => "That is no longer possible." ],
    [ "Dat is niet mogelijk meer." => "That is not possible anymore." ],
    [
        "Hij kon niet komen, omdat hij ziek was." =>
          "He could not come because he was ill."
    ],
    [ "Wanneer ben je geboren?"              => "When were you born?" ],
    [ "Ik ben gek op jullie."                => "I'm crazy about you." ],
    [ "Ze deed het licht aan."               => "She turned on the light." ],
    [ "Je bent in Europa!"                   => "You're in Europe!" ],
    [ "Ik heb niemand nodig."                => "I don't need anyone." ],
    [ "Wat wilt ge dan?"                     => "What do you want then?" ],
    [ "Kunt u me nog een andere laten zien?" => "Please show me another." ],
    [ "Ze is twee jaar jonger dan ik." => "She is two years younger than I." ],
    [ "Laten we het houden."           => "Let's keep it." ],
    [
        "Ik begrijp geen woord van wat hij zegt." =>
          "I don't understand a word of what he says."
    ],
    [
        "Ik mag hem omdat hij eerlijk is." => "I like him because he is honest."
    ],
    [ "Ik heb goed nieuws voor jullie." => "I have good news for you." ],
    [ "Ik heb het nu niet druk."        => "I'm not busy now." ],
    [
        "Hij zei mij dat hij de volgende dag zou beginnen." =>
          "He told me that he would start the next day."
    ],
    [ "Wat heb je gekocht?"    => "What did you buy?" ],
    [ "Ik heb vrienden nodig." => "I need friends." ],
    [
        "Haar oudere broer is twee jaar ouder dan ik." =>
          "His older brother is two years older than I."
    ],
    [
        "Haar oudere broer is twee jaar ouder dan ik." =>
          "Her older brother is two years older than I."
    ],
    [ "Ik zal de vis in leven houden." => "I will keep the fish alive." ],
    [
        "Als je er op staat drink ik er nog een." =>
          "If you insist I'll have another drink."
    ],
    [
        "Ik heb een paar boeken die je misschien graag wil lezen." =>
          "I have some books that you might like to read."
    ],
    [
        "Ik heb liever Engels dan muziek." =>
          "I like English better than music."
    ],
    [
        "Ik geloof geen woord van wat je zegt." =>
          "I don't believe a word you say."
    ],
    [ "Is dit een rivier?"               => "Is this a river?" ],
    [ "Je kan beter zelf gaan."          => "You may as well go yourself." ],
    [ "Laten we op de foto gaan."        => "Let's have our picture taken." ],
    [ "We hebben deze film niet gezien." => "We didn't see this movie." ],
    [ "Ik vond dat ik dat moest doen."   => "I thought I must do it." ],
    [
        "Misschien is er iemand anders in huis." =>
          "Maybe there is someone else in the house."
    ],
    [
        "Ik wist wel dat het vandaag leuk ging worden." =>
          "I knew that today would be fun."
    ],
    [
        "In het begin wist ik niet wat te doen." =>
          "At first, I didn't know what to do."
    ],
    [ "Waarom heb je dat gezegd?"   => "Why did you say that?" ],
    [ "Kunt u dat nog eens zeggen?" => "Could you say that again?" ],
    [ "Hier is mijn sleutel."       => "Here is my key." ],
    [ "Ik woon in een grote stad."  => "I live in a big city." ],
    [
        "Mijn oom woont in de buurt van de school." =>
          "My uncle lives near the school."
    ],
    [
        "Ik weet dat dit allemaal maar een spel is." =>
          "I know that all of this is just a game."
    ],
    [ "Waarom zijn mensen bang voor jou?" => "Why are people scared of you?" ],
    [
        "Dat is nog het einde van de wereld niet." =>
          "It's not the end of the world."
    ],
    [ "De jongen heeft een krant."       => "The boy has a newspaper." ],
    [ "Waarom komt ge niet met ons mee?" => "Why aren't you coming with us?" ],
    [ "Wat is je doel in het leven?"     => "What's your aim in life?" ],
    [
        "Zeg haar dat ik weet wie zij is." => "Tell her that I know who she is."
    ],
    [ "Waar is mijn krant?" => "Where is my newspaper?" ],
    [
        "Ik begrijp niet helemaal wat hij zegt." =>
          "I don't quite understand what he says."
    ],
    [ "Misschien ben ik te oud." => "I may be too old." ],
    [ "Met wie spreek ik nu?"    => "Who am I currently speaking to ?" ],
    [ "Dit boek is nieuw."       => "This book is new." ],
    [
        "Het is waar dat hij elk jaar naar het buitenland gaat." =>
          "It is true that he goes abroad every year."
    ],
    [ "Ik ben moe." => "I'm tired." ],
    [
        "Je hoeft niet bang te zijn om fouten te maken." =>
          "You don't need to be afraid of making mistakes."
    ],
    [
        "Ik zal haar zeggen wat ze moet zeggen op de vergadering." =>
          "I will tell her what to say at the meeting."
    ],
    [ "Je kan er zelf een maken."          => "You can make your own." ],
    [ "Ze hebben ons gisteren gezien."     => "They saw us yesterday." ],
    [ "We kunnen niet leven zonder lucht." => "We cannot live without air." ],
    [ "Komt hij om zes uur thuis?"         => "Does he come home at six?" ],
    [
        "Misschien is het voor hem wel precies zo." =>
          "Maybe it will be exactly the same for him."
    ],
    [ "Wanneer kunnen we eten?" => "When can we eat?" ],
    [
        "Dit is de jongen die ik hier gisteren ontmoette." =>
          "This is the boy I met there yesterday."
    ],
    [
        "Hij had geluk en was op tijd voor de trein." =>
          "Being lucky, he was in time for the train."
    ],
    [
        "Hoe laat kom je aan op het station?" =>
          "What time will you get to the station?"
    ],
    [
        "Vandaag is het verjaardag van een van mijn vrienden." =>
          "Today is one of my friends' birthday."
    ],
    [
        "Ik ken haar sinds dat ze een klein meisje was." =>
          "I have known her since she was a little girl."
    ],
    [
        "Ik weet niet aan wie ik advies moet vragen." =>
          "I don't know who to ask for advice."
    ],
    [
        "Zijn huis is heel ver van het station." =>
          "His house is very far from the station."
    ],
    [ "Ik begrijp het gewoon niet." => "I simply don't understand this." ],
    [ "Wil je wat thee?"            => "Do you want some tea?" ],
    [
        "Als ik alleen thuis ben, is het te stil in huis." =>
          "When I'm home alone, the house is too quiet."
    ],
    [
        "Ik ben niet tevreden met wat ge gedaan hebt." =>
          "I am not pleased with what you have done."
    ],
    [ "Iedereen wilde dat ik het deed." => "Everybody wanted me to do it." ],
    [ "Waarom vertelde je me dat niet?" => "Why didn't you tell me?" ],
    [ "Wat wilt ge dat ik doe?"         => "What do you want me to do?" ],
    [ "Ik kom terug voor zes uur."      => "I'll be back by six." ],
    [
        "Wie neemt nog tijd voor een lange brief aan een vriend?" =>
          "Who still takes time for a long letter to a friend?"
    ],
    [
        "Hoe kan je ooit die taal spreken?" =>
          "How on earth can you speak that language?"
    ],
    [
        "Mijn moeder staat eerder op dan ik." =>
          "My mother gets up earlier than I do."
    ],
    [ "Mijn moeder is mooi." => "My mother is beautiful." ],
    [
        "Er is een televisie in deze kamer." =>
          "There is a television in the room."
    ],
    [
        "Er is een televisie in deze kamer." =>
          "There is a television in this room."
    ],
    [ "Ik ben een beetje moe."       => "I'm a little tired." ],
    [ "Ik ben een beetje moe."       => "I'm a bit tired." ],
    [ "Dat is precies wat ik dacht." => "That's exactly what I thought." ],
    [ "Ik denk dat dit boek makkelijk is." => "I think this book is easy." ],
    [ "Hij zei dat het negen uur was." => "He said that it was nine o'clock." ],
    [
        "Voor zover ik weet is hij nog nooit op tijd gekomen." =>
          "As far as I know, he has never come on time."
    ],
    [ "Hij deed wat men hem gezegd had." => "He did what they told him." ],
    [
        "Alles wat je zegt kan en zal tegen je gebruikt worden." =>
          "Anything you say can and will be used against you."
    ],
    [
        "Maar dat heb je me nooit verteld!" =>
          "But you've never told me about this!"
    ],
    [ "Die jongen eet niet." => "That boy doesn't eat." ],
    [
        "Men zegt dat hij al zijn geld verloren heeft." =>
          "He is said to have lost all his money."
    ],
    [
        "Enige tijd lang keek ze mij alleen maar aan." =>
          "For a while she did nothing but stare at me."
    ],
    [
        "Iedereen wist dat ze goed Engels kon." =>
          "Everybody knew she could speak English well."
    ],
    [ "Was je handen voor het eten."   => "Wash your hands before eating." ],
    [ "De hele wereld spreekt Engels." => "The whole world speaks English." ],
    [
        "Weet je dan niet dat hij twee jaar geleden overleden is?" =>
          "Don't you know that he passed away two years ago?"
    ],
    [ "Ik ben de krant aan het lezen." => "I'm reading the newspaper." ],
    [ "Ik heb veel vrienden gemaakt."  => "I've made lots of friends." ],
    [ "Hoe laat ga je naar bed?"       => "When do you go to bed?" ],
    [ "Ik kom niet mee."               => "I'm not coming along." ],
    [
        "Ik ben blij dat ik je vandaag ontmoet heb." =>
          "I'm glad I met you today."
    ],
    [
        "Is er een telefoon in de buurt?" => "Can one find a telephone near by?"
    ],
    [
        "Elk van zijn kinderen heeft een eigen kamer." =>
          "Each of his children has his own room."
    ],
    [
        "Ik weet nog dat ik hem in Parijs ontmoet heb." =>
          "I remember meeting him in Paris."
    ],
    [ "Kom als ge kunt." => "Come if you can." ],
    [
        "Ik ga niet naar school op zondag." => "I don't go to school on Sunday."
    ],
    [ "Ik vraag me af wat er gebeurd is." => "I wonder what happened." ],
    [ "Ik ben de sleutel van mijn auto verloren." => "I've lost my car key." ],
    [ "Ik heb een dokter nodig."                  => "I need a medic." ],
    [
        "Er is in mijn stad geen school om Esperanto te leren." =>
          "In my city, there is no school for learning Esperanto."
    ],
    [ "Ik moet naar bed."            => "I have to go to bed." ],
    [ "Ze zijn appels aan het eten." => "They're eating apples." ],
    [ "Liefde is niet wat je denkt." => "Love is not what you think." ],
    [ "Ik begrijp uw vraag niet."    => "I don't understand your question." ],
    [
        "Beter niets doen, dan een fout te maken." =>
          "It's better to do nothing than to do something poorly."
    ],
    [ "Ik zou graag naar Amerika gaan."  => "I would like to go to the USA." ],
    [ "Ik ben drie jaar jonger dan hij." => "I am his junior by three years." ],
    [ "Wat denk je van oorlog?"          => "What do you think of war?" ],
    [
        "Het heeft niets te maken met het echte leven." =>
          "It has nothing to do with real life."
    ],
    [
        "De telefoon deed het weer niet." => "The phone was out of order again."
    ],
    [ "Kan ik mijn dokter spreken?" => "Can I talk to my doctor?" ],
    [
        "Ik heb geen zin om nog langer te wachten." =>
          "I don't feel like waiting any longer."
    ],
    [
        "Hoe lang was je in het buitenland?" => "How long have you been abroad?"
    ],
    [ "Het spijt me zeer." => "I'm very sorry." ],
    [
        "Het heeft geen zin om nog langer na te denken." =>
          "It's useless to keep on thinking any more."
    ],
    [ "Hij zal op je wachten."    => "He will be waiting for you." ],
    [ "Hij woont in deze straat." => "He lives on this street." ],
    [ "Ik heb een rode fiets."    => "I have a red bike." ],
    [
        "Mijn tante is de zus van mijn vader." =>
          "My aunt is my father's sister."
    ],
    [ "Het geld ligt op de tafel."      => "The money is on the table." ],
    [ "Ze liet hem toe alleen te gaan." => "She allowed him to go alone." ],
    [ "Ik heb je hulp nodig."           => "I need your help." ],
    [ "Ik heb je hulp nodig."           => "I need you to help me." ],
    [
        "Je had hem met zijn werk moeten helpen." =>
          "You should have helped him with his work."
    ],
    [
        "Ik stond op toen het nog donker was." =>
          "I got up while it was still dark."
    ],
    [
        "De dag is kort en er ligt veel werk." =>
          "The day is short and there's a lot of work."
    ],
    [ "Wat hebt ge gedaan deze week?" => "What have you done this week?" ],
    [ "Ik ben net klaar met eten."    => "I have just finished eating." ],
    [ "Hij is gek op jou."            => "He is mad about you." ],
    [ "Zoek een leven, man."          => "Get a life, man." ],
    [
        "Ik was een brief aan het schrijven toen hij kwam." =>
          "I was writing a letter when he came."
    ],
    [
        "Ik wil weten wat je deze zomer gedaan hebt." =>
          "I want to know what you did this summer."
    ],
    [ "Hoe laat staat gij op?"            => "What time do you get up?" ],
    [ "Morgen ga ik naar Parijs."         => "Tomorrow I'm going to Paris." ],
    [ "Wat is jouw antwoord?"             => "What's your answer?" ],
    [ "Ik had een lang gesprek met haar." => "I had a long talk with her." ],
    [
        "Maar het is niet erg waarschijnlijk." =>
          "But the possibility seems unlikely."
    ],
    [ "Ze zal haar eigen manier hebben." => "She will have her own way." ],
    [ "Heb je je huiswerk gedaan?"       => "Have you done your homework?" ],
    [ "Heb je je huiswerk gedaan?"       => "Did you do your homework?" ],
    [ "Ik ben blij jullie weer te zien." => "I'm glad to see you again." ],
    [ "Met wat kan ik u helpen?"         => "How can I help you?" ],
    [ "Hij kan Japans spreken."          => "He is able to speak Japanese." ],
    [ "Hij kan Japans spreken."          => "He can speak Japanese." ],
    [ "Hij kan Japans spreken."          => "He's able to speak Japanese." ],
    [
        "En wie zou niet hetzelfde gedaan hebben?" =>
          "And who would not have done the same?"
    ],
    [
        "Ze was te trots om hem om hulp te vragen." =>
          "She was too proud to ask him for help."
    ],
    [ "Ze is binnen een week terug." => "She will be back within a week." ],
    [ "Het is nieuw."                => "It is new." ],
    [ "Spreekt u Japans?"            => "Do you speak Japanese?" ],
    [
        "Ik nodig iedereen uit die wil komen." =>
          "I'll invite whoever wants to come."
    ],
    [
        "Hij vertelde het verhaal aan zijn broer." =>
          "He told his brother the story."
    ],
    [
        "Ik zal voor mijn ouders zorgen als ze oud worden." =>
          "I'll take care of my parents when they get old."
    ],
    [ "Ik heb zijn hulp nodig." => "I need his help." ],
    [
        "Ik zal je vandaag verder niets vragen." =>
          "I won't ask you anything else today."
    ],
    [
        "Er waren veel mensen in het park." =>
          "There were a lot of people in the park."
    ],
    [ "Ik hou erg van Frans eten."     => "I like French food very much." ],
    [ "Ik weet niet waar te beginnen." => "I don't know where to start." ],
    [ "Heb je hem niks gezegd?"        => "You didn't tell him anything?" ],
    [ "Waarom ben je zo blij?"         => "Why are you so happy?" ],
    [
        "Ik schreef haar elke dag een brief." =>
          "I wrote her a letter every day."
    ],
    [ "Hebt u deze man gezien?" => "Have you seen this man?" ],
    [ "Hij speelt zeer goed."   => "He plays very well." ],
    [
        "De broer schreef een brief aan de zus." =>
          "The brother wrote a letter to the sister."
    ],
    [ "Wil je iets te drinken?"   => "Would you like something to drink?" ],
    [ "De nacht is nog jong."     => "The night is still young." ],
    [ "Wil je iets te drinken?"   => "Do you want something to drink?" ],
    [ "Wil je iets te drinken?"   => "Would you like anything to drink?" ],
    [ "De nacht is nog jong."     => "The night's still young." ],
    [ "We kennen haar niet."      => "We don't know her." ],
    [ "We kennen haar niet."      => "We do not know her." ],
    [ "Spreek ik te snel?"        => "Am I talking too fast?" ],
    [ "Ik ben gek op jou."        => "I'm crazy about you." ],
    [ "Ik wil dat hij dit leest." => "I want him to read this." ],
    [
        "Aan zijn vrienden kent men de man." =>
          "A man is known by the company he keeps."
    ],
    [ "Het is niet belangrijk." => "It's not important." ],
    [ "Wie is jouw leraar?"     => "Who is your teacher?" ],
    [ "Waar woon je nu?"        => "Where do you live now?" ],
    [ "Waar woon je nu?"        => "Where are you living now?" ],
    [ "Wie is jouw leraar?"     => "Who's your teacher?" ],
    [
        "Het is vandaag minder koud dan gisteren." =>
          "It is less cold today than it was yesterday."
    ],
    [ "Ik heb het met eigen ogen gezien."  => "I saw it with my own eyes." ],
    [ "Ik ga iedere dag naar het werk."    => "I go to work every day." ],
    [ "Dat was allemaal Chinees voor mij." => "That was all Chinese to me." ],
    [ "Dat was allemaal Chinees voor mij." => "That was all Greek to me." ],
    [ "Dat was allemaal Chinees voor mij." => "That was double-dutch to me." ],
    [ "Hij is moe van het lezen."          => "He is tired of reading." ],
    [ "Het was een lange nacht."           => "It's been a long night." ],
    [ "Dit is een kaart."                  => "This is a map." ],
    [ "Waar was de politie?"               => "Where was the police?" ],
    [ "Het spijt me erg om dat te horen."  => "I'm very sorry to hear that." ],
    [
        "Ze zal komen als ge het haar vraagt." =>
          "She will come if you ask her."
    ],
    [ "Dit is ook een appel."            => "This is an apple, too." ],
    [ "Kan je dat opnieuw doen?"         => "Can you do that again?" ],
    [ "We kennen hem niet."              => "We don't know him." ],
    [ "We kennen hem niet."              => "We do not know him." ],
    [ "Ik zal hier wachten tot ze komt." => "I'll wait here until she comes." ],
    [
        "We gingen zonder hem, omdat hij nog niet klaar was." =>
          "We went without him since he wasn't ready."
    ],
    [
        "Weet je iets over je familie?" =>
          "Do you know anything about your family?"
    ],
    [ "Ik begrijp wat je zegt."  => "I understand what you're saying." ],
    [ "Ik hou van de winter."    => "I like winter." ],
    [ "Jij bent groter dan zij." => "You are taller than she is." ],
    [
        "Ik heb geen geld, maar ik heb dromen." =>
          "I have no money, but I have dreams."
    ],
    [
        "Ik heb geen geld, maar ik heb dromen." =>
          "I don't have money, but I have dreams."
    ],
    [ "Hij was boos op zijn zoon." => "He was angry with his son." ],
    [ "Mijn werk is gedaan."       => "My work is finished." ],
    [ "Laat ons eerlijk zijn."     => "Let's be honest." ],
    [ "Laat ons eerlijk zijn."     => "Let's be fair." ],
    [
        "Hij was de enige die naar het feestje kwam." =>
          "He was the only one who came to the party."
    ],
    [ "Hij kent niemand van ons." => "He doesn't know anyone of us." ],
    [
        "Heb je hem geen brief geschreven?" =>
          "Didn't you write a letter to him?"
    ],
    [ "Ik ben tevreden met mijn werk." => "I am content with my job." ],
    [
        "Mijn moeder was gisteravond tot laat op." =>
          "My mother was up late last night."
    ],
    [
        "Je bent vrij om te zeggen wat je denkt." =>
          "You are free to say what you think."
    ],
    [
        "Je bent niet langer gewoon een kind." =>
          "You are no longer a mere child."
    ],
    [ "Kom voor zeven uur naar hier." => "Come here before seven o'clock." ],
    [ "Ik vertelde hem over onze school." => "I told him about our school." ],
    [
        "Mensen kunnen niet leven zonder lucht." =>
          "Man cannot live without air."
    ],
    [ "Ik kan daar niks over zeggen." => "I can't say anything about that." ],
    [ "De nacht was zo koud."         => "The night was so cold." ],
    [ "Heb je deze film gezien?"      => "Did you watch this movie?" ],
    [ "Ik ben leraar Japans."         => "I'm a Japanese teacher." ],
    [
        "Kinderen vragen mij vaak om geld." =>
          "Children often ask me for money."
    ],
    [ "Hij kan helemaal geen Frans." => "He doesn't know French at all." ],
    [
        "Niet iedereen die hier woont is rijk." =>
          "Not everyone who lives here is rich."
    ],
    [ "Hij deed alsof hij een dokter was." => "He pretended to be a doctor." ],
    [
        "Mijn kat is al twee dagen dood." =>
          "My cat has been dead for two days."
    ],
    [
        "Hij is ongeveer even oud als jij." =>
          "He's about the same age as you are."
    ],
    [ "We willen blijven wat we zijn." => "We wish to remain what we are." ],
    [ "Was Ken gisteren thuis?"        => "Was Ken at home yesterday?" ],
    [ "Ze werd heel ziek."             => "She became very ill." ],
    [
        "Hij ging de kamer in met zijn hoed af." =>
          "He entered the room with his hat off."
    ],
    [ "U doet me denken aan uw moeder." => "You remind me of your mother." ],
    [
        "Ik zou niet graag in een ziekenhuis werken." =>
          "I wouldn't like to work in a hospital."
    ],
    [ "Hij woont samen met zijn ouders." => "He lives with his parents." ],
    [ "Het is mij gelijk wat hij doet."  => "I don't care what he does." ],
    [ "Dat is niet belangrijk."          => "This is not important." ],
    [
        "Zijn doel is het niet, om geld te maken." =>
          "His goal is to not earn money."
    ],
    [ "Het is nog klaar buiten."        => "It is still light outside." ],
    [ "Laat het ons weten alsjeblieft." => "Please let us know." ],
    [ "Ze is nergens bang voor."        => "She is not afraid of anything." ],
    [ "Zijn ze familie van je?"         => "Are they your relatives?" ],
    [
        "Zijn moeder maakt zich zorgen over hem." =>
          "His mother is worried about him."
    ],
    [
        "Ze was mooi toen ze jong was." =>
          "She was beautiful when she was young."
    ],
    [ "Zijn zus ziet er jong uit."       => "His sister looks young." ],
    [ "Jij bent de grootste."            => "You are tallest." ],
    [ "Jij bent de grootste."            => "You're the tallest one." ],
    [ "Ik heb zin in uit eten vanavond." => "I feel like eating out tonight." ],
    [ "Ik denk dat je gelijk had."       => "I guess you were right." ],
    [ "Ze kan Japans spreken."           => "He's able to speak Japanese." ],
    [ "Ik kocht veel boeken."            => "I bought a lot of books." ],
    [ "We denken dat hij zal komen."     => "We think that he will come." ],
    [
        "In het algemeen eet ze niet erg veel." =>
          "In general, she doesn't eat very much."
    ],
    [ "Engels spreken is moeilijk."       => "Speaking English is difficult." ],
    [ "Laat me zien wat je gekocht hebt." => "Show me what you bought." ],
    [ "Ik herinner mij zijn naam niet meer." => "I don't remember his name." ],
    [
        "Wonen er veel mensen in jouw stad?" =>
          "Do a lot of people live in your town?"
    ],
    [
        "Ik vind dat hij daar naartoe moet gaan." =>
          "I think he needs to go there."
    ],
    [ "Ik geef nooit op."              => "I never give up." ],
    [ "Ik ben een persoon."            => "I'm a person." ],
    [ "Ik lees dit boek."              => "I'm reading this book." ],
    [ "Ik wil naar het buitenland."    => "I want to go abroad." ],
    [ "Hoe spreekt men dit woord uit?" => "How do you pronounce this word?" ],
    [ "Het maakt al het verschil."     => "It makes all the difference." ],
    [ "We hebben alleen maar thee."    => "We only have tea." ],
    [ "Ze is op dit moment in het ziekenhuis." => "She is in hospital now." ],
    [ "Ze is in een vergadering."              => "She's at a meeting." ],
    [ "Ik zal wel een fout gemaakt hebben." => "I must have made a mistake." ],
    [
        "Dit is de auto waar ik het laatst over had." =>
          "This is the car I spoke of the other day."
    ],
    [ "Waar hebben jullie de jongen gezien?" => "Where did you see the boy?" ],
    [ "Hoe gaat het met de familie?"         => "How is the family?" ],
    [ "Ik geloof je."                        => "I believe you." ],
    [
        "Ik herinner me de eerste keer nog." =>
          "I still remember the first time."
    ],
    [ "Hij is door iedereen graag gezien." => "Everybody likes him." ],
    [
        "Ik denk dat wij goede vrienden zouden kunnen zijn." =>
          "I think we could be good friends."
    ],
    [ "Ik wil niet zo lang wachten." => "I don't want to wait that long." ],
    [
        "Wanneer ik je ook zie, ben ik gelukkig." =>
          "Whenever I see you, I feel happy."
    ],
    [ "Ik ben bijna klaar." => "I'm about ready." ],
    [ "Ik ben bijna klaar." => "I am almost ready." ],
    [
        "Voor zover ik weet, is zij nog niet getrouwd." =>
          "So far as I know, she is still unmarried."
    ],
    [
        "Voor zover ik weet, is zij nog niet getrouwd." =>
          "As far as I know, she's still unmarried."
    ],
    [
        "Voor zover ik weet, is zij nog niet getrouwd." =>
          "To my knowledge, she hasn't married yet."
    ],
    [
        "Voor zover ik weet, is zij nog niet getrouwd." =>
          "As far as I know, she has not yet married."
    ],
    [
        "Hij spreekt goed Japans, maar ik kan geen Duits spreken." =>
          "He speaks Japanese well, but I can't speak German."
    ],
    [ "Heeft het huis een tuin?"  => "Has the house got a garden?" ],
    [ "Waarom heb je dit gedaan?" => "Why did you do this?" ],
    [
        "Hoe heet deze vis in het Engels?" =>
          "What is this fish called in English?"
    ],
    [ "Antwoord op de vraag."        => "Answer the question." ],
    [ "Spreek je geen Engels?"       => "Can't you speak English?" ],
    [ "Ge moet leren uit uw fouten." => "You must learn from mistakes." ],
    [ "Ge moet leren uit uw fouten." => "You must learn from your mistakes." ],
    [
        "Mijn moeder was tot voor kort in het ziekenhuis." =>
          "My mother has been in the hospital until recently."
    ],
    [ "Hij is altijd gelukkig." => "He is always happy." ],
    [ "De kamer was warm."      => "The room was warm." ],
    [
        "Kijk naar hem en doe wat hij doet." => "Watch him and do what he does."
    ],
    [ "Ze is goed in tennis."           => "She's good at tennis." ],
    [ "Waarom heeft ze dat gedaan?"     => "Why did she do that?" ],
    [ "Heel veel mensen kennen hem."    => "Very many people know him." ],
    [ "Ik denk dat ik hier blijf."      => "I think I'm gonna stay here." ],
    [ "Kan ik u met iets helpen?"       => "Can I help you with something?" ],
    [ "Ik wil iets koud om te drinken." => "I want something cold to drink." ],
    [ "Je bent vrij goed."              => "You're pretty good." ],
    [ "Hoe oud zijn jullie kinderen?"   => "How old are your children?" ],
    [ "Ik wil helemaal geen melk."      => "I do not want any milk at all." ],
    [ "Ik weet niet wat erger is."      => "I don't know what is worse." ],
    [ "Haar zus ziet er jong uit."      => "Her sister looks young." ],
    [ "Zeg me wat je wil."              => "Tell me what you want." ],
    [ "Waar zijn de appels?"            => "Where are the apples?" ],
    [ "Ik ben op tijd op school gekomen." => "I arrived at school on time." ],
    [ "Hij is trots op zijn zoon."        => "He is proud of his son." ],
    [ "Hij zegt wat hij denkt."           => "He's a plain speaker." ],
    [
        "Er is weinig water in het glas." =>
          "There is little water in the glass."
    ],
    [
        "Ik herinner het mij alsof het gisteren was." =>
          "I remember it as if it were yesterday."
    ],
    [ "Jullie spreken geen Engels."   => "You don't speak English." ],
    [ "Jullie spreken geen Engels."   => "You all don't speak English." ],
    [ "Vier jij de Dag van de Aarde?" => "Do you celebrate the Earth Day?" ],
    [ "Hij werkt de hele nacht."      => "He works all night." ],
    [ "Hij is mijn oudere broer."     => "He's my older brother." ],
    [ "Het is moeilijk te geloven."   => "It's hard to believe." ],
    [
        "Mijn vader zal om zeven uur thuis komen." =>
          "My father will come home at seven."
    ],
    [ "Je hoeft niet op te staan." => "You don't need to stand up." ],
    [
        "Ik vertel het je als we er zijn." => "I'll tell you when we get there."
    ],
    [
        "Ik heb liever honger dan dat ik dit eet." =>
          "I'd rather go hungry than eat this."
    ],
    [ "Heb je het altijd druk?"    => "Are you always busy?" ],
    [ "Hoe is het met uw familie?" => "How is your family?" ],
    [ "Hoe is het met uw familie?" => "How is your family doing?" ],
    [ "Ze was boos op haar zoon."  => "She was mad at her son." ],
    [ "Hoe laat begint het?"       => "What time does it start?" ],
    [
        "Nu is de tijd om samen te werken." =>
          "Now is the time when we must work together."
    ],
    [ "Mag ik vragen hoe u heet?"    => "May I ask your name?" ],
    [ "Ze werkt dag en nacht."       => "She is working night and day." ],
    [ "Kan niemand anders dit doen?" => "Can't someone else do this?" ],
    [
        "Wat ook de reden is, ze zijn niet getrouwd." =>
          "Whatever the reason, they did not marry."
    ],
    [
        "Ik voel me de laatste dagen niet zo goed." =>
          "I've been feeling poorly for the last couple of days."
    ],
    [ "Mag ik een foto van je maken?" => "May I take your picture?" ],
    [
        "Hij heeft mij een uur laten wachten." =>
          "He kept me waiting for an hour."
    ],
    [ "Je moet doen wat ik zeg." => "You must do as I tell you." ],
    [
        "Er is maar een klein beetje melk over." =>
          "There's only a little milk left."
    ],
    [
        "Hij verdient drie keer meer dan ik doe." =>
          "He earns three times more than I do."
    ],
    [ "Haar haar is heel kort."    => "Her hair is very short." ],
    [ "Ze lijkt gelukkig te zijn." => "She seems to be happy." ],
    [ "Ik dacht aan jou."          => "I was thinking about you." ],
    [ "We hebben geen brood meer." => "We do not have any more bread." ],
    [
        "Hij is gisteren gekomen om u te zien." =>
          "He came to see you yesterday."
    ],
    [ "Hoe voel je je?"               => "How do you feel?" ],
    [ "Ik heb hem een keer ontmoet."  => "I met him once." ],
    [ "Ik kon zijn huis niet vinden." => "I failed in finding his house." ],
    [ "Ik kon zijn huis niet vinden." => "I couldn't find his house." ],
    [
        "Hoe wist ge dat hij getrouwd is?" =>
          "How did you know that he is married?"
    ],
    [ "Ik hou van vis." => "I like fish." ],
    [
        "Zijn moeder is een brief aan het schrijven." =>
          "His mother is writing a letter."
    ],
    [ "Hij wil dat je hier blijft." => "He wants you to stay here." ],
    [ "De zon gaat al op."          => "The sun is rising already." ],
    [
        "Ik ga gewoonlijk om vier uur naar huis." =>
          "I usually go home at four."
    ],
    [ "Ik heb een fout gemaakt." => "I made a mistake." ],
    [ "Vind je dit meisje leuk?" => "Do you like this girl?" ],
    [
        "Dit boek is even interessant als dat boek." =>
          "This book is as interesting as that book."
    ],
    [
        "Ze kennen elkaar niet erg goed." =>
          "They don't know each other very well."
    ],
    [ "Zijn moeder en zus waren ziek." => "His mother and sister were sick." ],
    [ "Het leven gaat verder."         => "Life goes on." ],
    [ "Het is koud buiten."            => "It is cold outside." ],
    [
        "Ik weet niet zeker hoe lang we moeten wachten." =>
          "I'm not sure how much we should wait."
    ],
    [ "Het kind is bang in het donker." => "The child is afraid of the dark." ],
    [
        "Wil iemand denken aan de kinderen!" =>
          "Won't somebody please think of the children?!"
    ],
    [ "Ik ben in de buurt van het station." => "I am near the station." ],
    [ "Het is te warm om te werken."        => "It is too hot to work." ],
    [ "Ik ben een Japanse leraar."          => "I'm a Japanese teacher." ],
    [ "Woon je hier?"                       => "Do you live here?" ],
    [ "Er was niemand in de tuin."     => "There was nobody in the garden." ],
    [ "Ik voel me beter vandaag."      => "I feel better today." ],
    [ "Hebt ge tijd om mij te helpen?" => "Do you have time to help me?" ],
    [ "Ik heb er niks mee te maken."   => "I've got nothing to do with it." ],
    [ "Ik ken niemand van hen."        => "I know neither of them." ],
    [ "Ik ken niemand van hen."        => "I know none of them." ],
    [ "Ik ken niemand van hen."        => "I do not know any of them." ],
    [ "Ik heb geen tijd om te schrijven." => "I don't have time to write." ],
    [
        "Hoe sneller je het doet, hoe beter het is." =>
          "The sooner you do it, the better it is."
    ],
    [ "Ik zoek mijn vrienden."            => "I am looking for my friends." ],
    [ "Ik ken jouw taal."                 => "I know your language." ],
    [ "De volgende keer doe ik het zelf." => "Next time, I'll do it myself." ],
    [ "De volgende keer doe ik het zelf." => "Next time I will do it myself." ],
    [ "Het is niet mijn schuld!"          => "It's not my fault!" ],
    [
        "Dit boek zal ons zeer van pas komen." =>
          "This book will be of great use to us."
    ],
    [
        "Dit boek zal ons zeer van pas komen." =>
          "This book will be very useful to us."
    ],
    [ "De laatste trein is al weg."    => "The last train has already gone." ],
    [ "Ze heeft bloemen in haar hand." => "She has flowers in her hand." ],
    [ "Het zal niet werken."           => "It won't work." ],
    [ "Wie kent dit probleem niet!"    => "Who doesn't know this problem?!" ],
    [ "Hij zal een goede echtgenoot zijn." => "He'll make a good husband." ],
    [ "Hij zal een goede echtgenoot zijn." => "He'll become a good husband." ],
    [ "Hij zal een goede echtgenoot zijn." => "He'll be a good husband." ],
    [ "Weet hij wat gij gedaan hebt?"      => "Does he know what you did?" ],
    [ "Hij zal een goede echtgenoot zijn." => "He will be a good husband." ],
    [ "Dit is allemaal jouw fout."         => "This is all your fault." ],
    [ "Ik keek op mijn horloge."           => "I looked at my watch." ],
    [
        "Ik zou wel een glas water willen." =>
          "I'd like to have a glass of water."
    ],
    [ "Hij wil naar Amerika gaan."   => "His wish is to go to America." ],
    [ "Hij spreekt Engels en Frans." => "He speaks English and French." ],
    [ "Ga je het opnieuw doen?"      => "Are you going to do it over again?" ],
    [
        "Dit is het dorp waar hij geboren is." =>
          "This is the village where he was born."
    ],
    [ "Ze is vijf jaar jonger dan ik." => "She's five years younger than me." ],
    [
        "Ik was het op dat punt met hem eens." =>
          "I agreed with him on that point."
    ],
    [
        "Hoe laat staat ge gewoonlijk op?" => "What time do you usually get up?"
    ],
    [
        "Ik heb te veel dingen aan mijn hoofd op het moment." =>
          "I have too many things on my mind these days."
    ],
    [
        "Zijn zuster kan vandaag niet met u spreken." =>
          "His sister can't talk to you today."
    ],
    [ "Wel wel! Hoe hebt ge dat gedaan?" => "How in the world did you do it?" ],
    [
        "Mag ik u vragen? Welke plaats is dit?" =>
          "Pardon me, what place is this?"
    ],
    [ "Geef mij het boek." => "Give me the book." ],
    [
        "Ik zou liever een vogel dan een vis zijn." =>
          "I'd rather be a bird than a fish."
    ],
    [ "Wij moeten naar school gaan."    => "We must go to school." ],
    [ "Wat heeft de dokter gezegd?"     => "What did the doctor say?" ],
    [ "Weet jij misschien hoe ze heet?" => "Do you know by chance her name?" ],
    [ "Gaat u maar zitten waar u maar wilt." => "Sit wherever you like." ],
    [ "Ik begrijp jullie vraag niet." => "I don't understand your question." ],
    [ "Het eten is klaar."            => "The food is ready." ],
    [
        "Ze is nu een brief aan het schrijven." =>
          "She is writing a letter now."
    ],
    [ "Het is mooi weer vandaag."          => "Today the weather is nice." ],
    [ "Je bent twee keer zo sterk als ik." => "You are twice as strong as I." ],
    [ "Ik ben zeer trots op mijn zoon."    => "I'm very proud of my son." ],
    [
        "Het was niet duidelijk of ze gedaan hadden of niet." =>
          "It was not clear whether they had done or not."
    ],
    [
        "Zij, en ook haar vrienden, zijn gek op muziek." =>
          "She as well as her friends is fond of music."
    ],
    [
        "Het was die dag zondag, dus er was geen school." =>
          "That day was a Sunday, so there was no school."
    ],
    [ "Mijn vrouw denkt dat ik gek ben." => "My wife thinks I’m crazy." ],
    [
        "Ik heb haar vijf dagen geleden gezien, zei hij." =>
          "I saw her five days ago, he said."
    ],
    [
        "Er zijn zaken die je beter niet weet." =>
          "There are things you better don't know."
    ],
    [ "Ik hou van appels."           => "I love apples." ],
    [ "Hij keek op zijn horloge."    => "He glanced at his watch." ],
    [ "Mogelijk is het morgen goed." => "It may possibly be fine tomorrow." ],
    [ "Ik kan het moeilijk geloven." => "I can hardly believe it." ],
    [ "Dat zal niet werken."         => "That won't work." ],
    [
        "Ik ben zo moe, dat ik niet kan studeren." =>
          "I am so tired that I can't study."
    ],
    [ "Deze keer zal ik het proberen."    => "This time I will try it." ],
    [ "Ze hield nog steeds van hem."      => "She still loved him." ],
    [ "Ik herinner me je naam niet."      => "I don't remember your name." ],
    [ "Er staat een hond op de brug."     => "There is a dog on the bridge." ],
    [ "Waarom slaap je zo laat nog niet?" => "What keeps you up so late?" ],
    [ "Hij zou blij zijn dat te horen."   => "He would be glad to hear that." ],
    [ "Ik ben de oudste van de drie."     => "I am the oldest of the three." ],
    [ "Heb je geen pen?"                  => "Don't you have a pen?" ],
    [
        "Soms komt de trein niet op tijd." =>
          "At times the train doesn't arrive on time."
    ],
    [ "Ze ziet er altijd bleek uit." => "She always looks pale." ],
    [ "Hij kan je niet helpen."      => "He can't help you." ],
    [ "Welke zin heb je liever?"     => "Which sentence do you prefer?" ],
    [ "Ik wil niet beroemd zijn."    => "I don't want to be famous." ],
    [
        "Als ge niets te zeggen hebt, zeg dan niets." =>
          "If you have nothing to say, say nothing."
    ],
    [
        "Dat is iemand op wie je kan vertrouwen." =>
          "He's a man you can rely on."
    ],
    [ "Ze hebben weinig boeken."     => "They have few books." ],
    [ "Mag ik een foto van u maken?" => "May I take your picture?" ],
    [
        "Ik heb hetzelfde probleem als gij." =>
          "I have the same trouble as you have."
    ],
    [ "Ik wil niet naar huis lopen." => "I don't want to walk home." ],
    [
        "Ik zal je zoveel als ik kan helpen." =>
          "I'll help you as far as I can."
    ],
    [
        "Ik zal je zoveel als ik kan helpen." =>
          "I'll help you as much as I can."
    ],
    [ "Wat is jouw droom?"  => "What is your dream?" ],
    [ "Is dat het station?" => "Is that the station?" ],
    [
        "Wat zou de wereld zonder vrouwen zijn?" =>
          "What would the world be without women?"
    ],
    [
        "Het is het beste boek dat ik ooit gelezen heb." =>
          "It's the best book that I've ever read."
    ],
    [
        "Ik vroeg me alleen af welke talen jij allemaal spreekt." =>
          "I was just wondering what languages you can speak."
    ],
    [ "Ik hou het meest van de zomer." => "I like summer the best." ],
    [ "Mag ik iets zeggen?"            => "May I say something?" ],
    [
        "Moet deze brief in het Engels geschreven worden?" =>
          "Does this letter have to be written in English?"
    ],
    [
        "Eerst dacht ik dat hij je broer was." =>
          "At first, I thought he was your brother."
    ],
    [
        "Ik zou niet in een ziekenhuis willen werken." =>
          "I wouldn't want to work in a hospital."
    ],
    [ "Hoe kan ik in de hemel komen?" => "How can I get to heaven?" ],
    [
        "Wat wil je voor je verjaardag?" =>
          "What do you want for your birthday?"
    ],
    [ "Waar was zij op dat moment?"  => "Where was she at that moment?" ],
    [ "Neem er alsjeblieft nog een." => "Please take another one." ],
    [
        "Wat ben je van plan te gaan studeren?" =>
          "What do you plan to major in in college?"
    ],
    [ "Herinner je je mij nog?"   => "Do you remember me?" ],
    [ "Ik heb niet graag eieren." => "I dislike eggs." ],
    [ "Daar houd ik je aan."      => "I'll hold you to that." ],
    [ "Het was mijn schuld niet." => "It wasn't my fault." ],
    [
        "Hij was niet thuis, zoals het geval vaak bij hem is." =>
          "He was not at home, as is often the case with him."
    ],
    [
        "Hoe lang moet ik nog in het ziekenhuis blijven?" =>
          "How much longer will I have to stay in the hospital?"
    ],
    [
        "Ik heb twee broers en één zus." =>
          "I have two brothers and one sister."
    ],
    [
        "Heeft u wel eens een boek geschreven?" =>
          "Have you ever written a book?"
    ],
    [
        "Ik heb twee broers en één zus." => "I have two brothers and a sister."
    ],
    [
        "Ik heb twee broers en één zus." =>
          "I've got two brothers and a sister."
    ],
    [
        "Ik zou willen dat ik zo kon zingen als jij." =>
          "I wish I could sing like you do."
    ],
    [
        "Ze is blij met haar nieuwe jurk." =>
          "She's pleased with her new dress."
    ],
    [
        "Gisteren heeft hij een brief geschreven." =>
          "He wrote a letter yesterday."
    ],
    [ "Hij is hun enige kind."  => "He's their only child." ],
    [ "Geef me dat boek terug!" => "Give me that book back!" ],
    [
        "Hij kan beter piano spelen dan ik dat kan." =>
          "He can play the piano better than I can."
    ],
    [
        "Het is moeilijk dit verhaal aan te passen voor kinderen." =>
          "It is hard to adapt this story for children."
    ],
    [ "Zij is helemaal niet eerlijk." => "She is not honest at all." ],
    [
        "Gisteren heeft mijn oom een hond gekocht." =>
          "Yesterday my uncle bought a dog."
    ],
    [ "Mag ik je woordenboek even?" => "Can I use your dictionary?" ],
    [ "Hij kan niet lang blijven."  => "He can't stay long." ],
    [
        "Deze auto wordt gebruikt door mijn vader." =>
          "This car is used by my father."
    ],
    [ "Ik deed wat melk in mijn koffie." => "I put some milk in my coffee." ],
    [
        "Ik wil beter begrijpen wat de zin van het leven is." =>
          "I want to better understand what the meaning of life is."
    ],
    [ "Ze had haar echtgenoot niet graag." => "She disliked her husband." ],
    [ "Waarom zegt hij de waarheid niet?" => "Why doesn't he tell the truth?" ],
    [
        "Ik reis liever met de trein dan met de vliegtuig." =>
          "I prefer travelling by train to flying."
    ],
    [ "Ik wil graag Frans leren."       => "I want to learn French." ],
    [ "Ze vroeg waar ik naartoe ging."  => "She asked me where I was going." ],
    [ "Mijn leraar Chinees is een man." => "My Chinese teacher is a man." ],
    [ "Dank u, met mij gaat het goed."  => "Thanks, I'm fine." ],
    [
        "Men zegt dat hij dat boek geschreven heeft." =>
          "It is said that he wrote this book."
    ],
    [ "Waar kijk je naar?"        => "What are you looking at?" ],
    [ "Ze heeft weinig vrienden." => "She has few friends." ],
    [ "Ze heeft weinig vrienden." => "She doesn't have many friends." ],
    [ "Je hebt het mis."          => "You're wrong." ],
    [
        "Laat het me weten als je erachter komt wat het is." =>
          "Let me know when you find out what it is."
    ],
    [
        "Hij nam de taxi om er op tijd te komen." =>
          "He took a taxi to get there in time."
    ],
    [ "Wat zit er in de doos?"       => "What's in the box?" ],
    [ "Hij is bang fouten te maken." => "He is afraid of making mistakes." ],
    [ "Hij is bang fouten te maken." => "He's afraid of making mistakes." ],
    [ "We moeten op hem wachten."    => "We have to wait for him." ],
    [
        "Ik bel ze morgen, als ik weer terug ben." =>
          "I'll call them tomorrow when I come back."
    ],
    [ "We moeten iets doen om te helpen." => "We must do something to help." ],
    [ "Ik blijf in het huis vandaag."     => "I stay in the house today." ],
    [ "Ik zou graag iets drinken."        => "I'd like something to drink." ],
    [ "Ik ga naar het park."              => "I go to the park." ],
    [ "Ik lees heel graag boeken."        => "I love reading books." ],
    [ "Ik kom er onmiddellijk aan."       => "I'm coming right away." ],
    [ "Hij lijkt ons te kennen."          => "He seems to know us." ],
    [
        "Het is belangrijk om veel boeken te lezen." =>
          "It's important to read a lot of books."
    ],
    [ "De koffie is koud."            => "The coffee is cold." ],
    [ "Hij ging naar het buitenland." => "He went abroad." ],
    [
        "Hij deed alsof hij het antwoord niet wist." =>
          "He pretended not to know the answer."
    ],
    [ "De film begint om tien uur."    => "The movie starts at ten o'clock." ],
    [ "Weet jij waarom ze zo boos is?" => "Do you know why she's so angry?" ],
    [
        "Ge ziet er zo gezond uit als altijd." => "You look as healthy as ever."
    ],
    [ "Het is heel donker."             => "It's very dark." ],
    [ "Misschien kan hij morgen komen." => "He may be able to come tomorrow." ],
    [ "Ik ben een brief aan het schrijven." => "I am writing a letter." ],
    [ "Ik vroeg hem waar hij heen ging." => "I asked him where he was going." ],
    [ "Engels is niet makkelijk voor mij." => "English is not easy for me." ],
    [ "Dat is niet echt gebeurd."          => "That didn't really happen." ],
    [ "Ik heb niemand gezien."             => "I didn't see anybody." ],
    [
        "Ik wil dat ge gitaar speelt voor mij." =>
          "I want you to play the guitar for me."
    ],
    [
        "Het is jammer dat je niet met ons mee kan." =>
          "It is a pity that you can't join us."
    ],
    [ "Hij heeft geen fout gemaakt." => "He did nothing wrong." ],
    [ "Ze ging door met werken."     => "She went on working." ],
    [ "Ze ging door met werken."     => "She continued working." ],
    [
        "De jongen is aan het zwemmen met zijn vrienden." =>
          "The boy is swimming with his friends."
    ],
    [ "Ik heb liever koffie." => "I like coffee better." ],
    [ "Wat is de reden?"      => "What's the reason?" ],
    [
        "Iedereen heeft iets nodig om in te geloven." =>
          "Everybody needs something to believe in."
    ],
    [ "Wanneer bent u geboren?"      => "When were you born?" ],
    [ "Vandaag moet ge niet werken." => "You don't have to work today." ],
    [ "Is het om hier te eten, of om mee te nemen?" => "For here, or to go?" ],
    [ "Ik kan mijn ogen niet geloven." => "I can't believe my eyes." ],
    [ "Bestaat er leven voor de dood?" => "Is there life before death?" ],
    [ "Zeg het in het Engels."         => "Say it in English." ],
    [ "Wat ga je vanavond doen?" => "What are you going to do this evening?" ],
    [ "Ik kom thuis tegen zes uur."    => "I'll come home by six o'clock." ],
    [ "Ik breng je naar huis."         => "I will take you home." ],
    [ "Ik breng je naar huis."         => "I'll drive you home." ],
    [ "Ik breng je naar huis."         => "I will drive you home." ],
    [ "Ik heb nu geen honger."         => "I don't feel like eating now." ],
    [ "Ik breng je naar huis."         => "I'll take you home." ],
    [ "Ik breng je naar huis."         => "I'll give you a ride home." ],
    [ "Ik heb veel van je geleerd."    => "I learned a lot from you." ],
    [ "Het lijkt buiten warm te zijn." => "It seems warm outside." ],
    [
        "Slaap niet met het licht aan." => "Don't sleep with the light left on."
    ],
    [
        "Je had het me eerder moeten laten weten." =>
          "You should have told it to me sooner."
    ],
    [
        "Zoiets heb ik nog nooit gezien." =>
          "I've never seen anything like this before."
    ],
    [
        "Wat hij zegt, is heel belangrijk." => "What he says is very important."
    ],
    [ "Ik heb nog nooit zoiets gezien." => "I have never seen such a thing." ],
    [
        "Ik heb hem ontmoet toen ik in Parijs was." =>
          "I met him while I was staying in Paris."
    ],
    [
        "Voor de oorlog ging ik naar Europa." =>
          "I went to Europe before the war."
    ],
    [
        "Zij en haar vrienden zijn gek op muziek." =>
          "She and her friends are mad about music."
    ],
    [ "Iedereen moet het weten."      => "Everybody must know." ],
    [ "We denken dat hij eerlijk is." => "We think that he's honest." ],
    [
        "Hij ging daar naartoe om Engels te leren." =>
          "He went there to learn English."
    ],
    [ "Ben je gek?" => "Are you kidding?" ],
    [
        "Voor zover ik weet was hij een goede student." =>
          "As far as I know, he used to be a good student."
    ],
    [ "Wat heb je met mijn tas gedaan?" => "What have you done with my bag?" ],
    [ "Hij is niet zoals wij."          => "He's not like us." ],
    [
        "Mijn gedacht is niet hetzelfde als dat van u." =>
          "My idea is different from yours."
    ],
    [
        "Ze werd verliefd op de broer van haar vriend." =>
          "She fell in love with her friend's brother."
    ],
    [ "Ik ontmoette hem op weg naar huis." => "I met him on my way home." ],
    [
        "Laat eens zien wat je gekocht hebt." =>
          "Will you show me what you bought?"
    ],
    [ "Onze leraar ziet er heel jong uit." => "Our teacher looks very young." ],
    [
        "Ik heb gisteren een rode auto gekocht." =>
          "Yesterday, I bought a red car."
    ],
    [
        "Wie je bent is belangrijker dan wat je hebt." =>
          "What you are is more important than what you have."
    ],
    [
        "Wie je bent is belangrijker dan wat je hebt." =>
          "It's more important what you are than what you have."
    ],
    [
        "Iemand deed net het licht uit." =>
          "Someone just turned off the lights."
    ],
    [
        "Ik heb deze brief in het Frans geschreven." =>
          "I wrote this letter in French."
    ],
    [
        "Hoe gaat het met u? Hebt u een goede reis gehad?" =>
          "How are you? Did you have a good trip?"
    ],
    [
        "De leraar kan zoiets niet gezegd hebben." =>
          "The teacher can't have said such a thing."
    ],
    [ "Ik kocht een klok voor haar." => "I bought her a clock." ],
    [ "Gisteren was ik gelukkig."    => "I was happy yesterday." ],
    [
        "Die doos is te klein om al deze dingen te houden." =>
          "That box is too small to hold all these things."
    ],
    [ "De hond zat achter de kat aan." => "The dog ran after the cat." ],
    [ "De koffie komt na het eten."    => "Coffee comes after the meal." ],
    [
        "Ik kwam hier aan rond vijf uur." =>
          "I arrived here about five o'clock."
    ],
    [
        "Ze kwam elke keer als mijn zuster thuis was." =>
          "She came every time my sister was home."
    ],
    [
        "Hij denkt dat hij iemand is, maar eigenlijk is hij niemand." =>
          "He thinks he is somebody, but really he is nobody."
    ],
    [ "Met wie was je aan het praten?" => "Who were you talking with?" ],
    [ "Hij heeft het zelf gedaan."     => "He did it himself." ],
    [ "Hij heeft het zelf gedaan."     => "He himself did it." ],
    [
        "Dat is makkelijk voor jou om te zeggen." =>
          "That's easy for you to say."
    ],
    [ "Ik heb het te druk om haar te helpen." => "I'm too busy to help her." ],
    [ "Ik sprak met haar."                    => "I talked to her." ],
    [ "Wil je me een plezier doen?"           => "Will you do me a favor?" ],
    [ "Waar zou u willen zitten?" => "Where would you like to sit?" ],
    [
        "Het wordt hoog tijd dat je naar bed gaat." =>
          "It is high time you were in bed."
    ],
    [
        "Ik weet niet juist waar ik geboren ben." =>
          "I don't know the exact place I was born."
    ],
    [
        "Ben je daar echt in geïnteresseerd?" =>
          "Are you really interested in that?"
    ],
    [
        "Wanneer hij erachter zal komen zal het al te laat zijn." =>
          "By the time he finds out, it will be too late."
    ],
    [
        "Ik zal jullie vandaag verder niets vragen." =>
          "I won't ask you anything else today."
    ],
    [
        "Het Engels wordt door veel mensen gebruikt." =>
          "English is used by many people."
    ],
    [
        "Je kan hem vertrouwen dat hij zijn woord zal houden." =>
          "You can trust him to keep his word."
    ],
    [ "Waarom wil je zo'n oude auto?"   => "Why do you want such an old car?" ],
    [ "Ik groeide op in dat huis."      => "I grew up in that house." ],
    [ "Ik zeg het alleen maar!"         => "I'm just saying!" ],
    [ "Ik herinner het me nu."          => "I remember now." ],
    [ "Hij is een zeer gevaarlijk man." => "He is very a dangerous man." ],
    [
        "Het was niet mijn bedoeling dat te doen." =>
          "I didn't mean to do that."
    ],
    [ "Ik wil naar de winkel gaan." => "I want to go to the store." ],
    [
        "Hij stond op in de kamer en keek rond." =>
          "He stood up in the room and looked around."
    ],
    [ "Wat gaat u vanavond doen?" => "What are you going to do this evening?" ],
    [ "Mijn horloge is heel precies."   => "My watch is very accurate." ],
    [ "Hij heeft een brief geschreven." => "He has written a letter." ],
    [ "Hij heeft een brief geschreven." => "He wrote a letter." ],
    [ "Hij heeft een brief geschreven." => "He wrote one letter." ],
    [ "Hij gaf zijn ouders antwoord."   => "He answered his parents." ],
    [ "Hij gaf zijn ouders antwoord."   => "He replied to his parents." ],
    [ "Mijn horloge is heel precies."   => "My watch is very precise." ],
    [ "Ik heb maar een wens."           => "I have but one wish." ],
    [ "Ik heb het onmiddellijk nodig."  => "I need it immediately." ],
    [ "Ik ben opgegroeid in dat huis."  => "I grew up in that house." ],
    [
        "Neem om het even welke boeken die je wil lezen." =>
          "Take any books that you want to read."
    ],
    [
        "Het is niet makkelijk om een vreemde taal te spreken." =>
          "It's not easy to speak a foreign language."
    ],
    [ "Ik heb een horloge gekocht."  => "I bought a watch." ],
    [ "Ze moeten wel gelukkig zijn." => "They must be happy." ],
    [
        "Misschien is er iets met hem gebeurd." =>
          "Something may have happened to him."
    ],
    [
        "Dat is het jongetje, dat ik gisteren heb gezien." =>
          "That is the boy I saw yesterday."
    ],
    [
        "Eet nu het nog warm is, alsjeblieft." =>
          "Please eat it while it's still hot."
    ],
    [ "Deze klok doet het niet." => "This clock is out of order." ],
    [ "Ik heb het zelf gezien."  => "I myself saw it." ],
    [
        "Ik heb een vriend die in Londen woont." =>
          "I have a friend living in London."
    ],
    [ "Ze deed of ze hem niet hoorde." => "She pretended not to hear him." ],
    [
        "We waren in het park aan het spelen." => "We were playing in the park."
    ],
    [ "Wil je wat drinken?"        => "Would you like something to drink?" ],
    [ "Moet ik onmiddellijk gaan?" => "Do I have to go right now?" ],
    [
        "Ze is klaar met het schrijven van een brief." =>
          "She finished writing a letter."
    ],
    [ "Ik houd van deze hond."             => "I like this dog." ],
    [ "De hond is aan het sterven."        => "The dog is dying." ],
    [ "Kan ik mijn tas hier laten?"        => "Can I leave my bag here?" ],
    [ "Ik kan alleen maar wachten."        => "I can only wait." ],
    [ "Je ziet er bleek uit."              => "You look pale." ],
    [ "Hij rende voor zijn leven."         => "He ran for his life." ],
    [ "Het is veel te koud om te zwemmen." => "It's much too cold to swim." ],
    [ "Ik was in de bergen."               => "I was in the mountains." ],
    [ "Ik heb het zelf gemaakt."           => "I made it myself." ],
    [ "Doe het op deze manier."            => "Do it this way." ],
    [ "Geef me mijn man terug!"            => "Give me back my husband!" ],
    [
        "Jij bent de enige die me kan helpen." =>
          "You are the only one who can help me."
    ],
    [ "Dat is altijd zo geweest."    => "This is always the way it has been." ],
    [ "Dat is altijd zo geweest."    => "It's always been that way." ],
    [ "Ik kan niet anders denken."   => "I cannot think any other way." ],
    [ "De deur was niet dicht."      => "The door was not closed." ],
    [ "Ik wil Frans kunnen spreken." => "I want to be able to speak French." ],
    [ "Dit is zeker de beste manier." => "This is definitely the best way." ],
    [ "Zoals gewoonlijk was ze te laat." => "She came late as usual." ],
    [ "Ik heb pijn aan mijn ogen."       => "My eyes hurt." ],
    [
        "Mijn oom is niet jong, maar hij is wel gezond." =>
          "My uncle isn't young, but he's healthy."
    ],
    [ "Ik bezoek hem om de twee dagen." => "I visit him every other day." ],
    [ "Nu, wat is uw mening?"           => "Now, what is your opinion?" ],
    [ "Is ze met hem gekomen?"          => "Did she come with him?" ],
    [ "Niemand kan alles weten."        => "Nobody can know everything." ],
    [
        "Mijn vader is zijn hele leven nooit ziek geweest." =>
          "My father has never gotten sick in his life."
    ],
    [
        "Mijn vader is zijn hele leven nooit ziek geweest." =>
          "My father has never been sick in his life."
    ],
    [
        "Mijn vader is zijn hele leven nooit ziek geweest." =>
          "In his whole life my father has never been ill."
    ],
    [
        "Is dit je eerste reis in het buitenland?" =>
          "Is this your first trip abroad?"
    ],
    [ "Ik heb vandaag een vergadering." => "I have a meeting today." ],
    [ "Hij wil naar Amerika."           => "He wants to go to America." ],
    [ "Ik hou niet van die hoed."       => "I don't like this hat." ],
    [
        "Heb je een reden om dat te vinden?" =>
          "Do you have any grounds for thinking so?"
    ],
    [
        "Hij doet net of hij hier niet bekend is." =>
          "He pretends that he's a stranger here."
    ],
    [
        "Ik wou dat ik een mooie vriendin had." =>
          "I wish I had a beautiful girlfriend."
    ],
    [ "Ik ga vaak bij hem op bezoek." => "I visit him often." ],
    [ "Ik hou van vreemde talen."     => "I like foreign languages." ],
    [
        "Deze thee is te heet om te drinken." => "This tea is too hot to drink."
    ],
    [
        "Zou ik wachten tot ze weer komt?" =>
          "Should I wait for her to come back?"
    ],
    [ "Dat is mijn dochter." => "This is my daughter." ],
    [
        "Ik deed het zonder iemand om advies te vragen." =>
          "I did that without asking for anyone's advice."
    ],
    [ "Hij was meer dan een koning." => "He was more than a king." ],
    [ "Ik was de hele nacht wakker." => "I was up all night." ],
    [
        "Ik heb geleerd te leven zonder haar." =>
          "I learned to live without her."
    ],
    [
        "Waarom doe je alsof je me niet kent?" =>
          "Why are you pretending you don't know me?"
    ],
    [ "Ze heeft mooie ogen." => "She has beautiful eyes." ],
    [
        "Ik denk dat het gevaarlijk is in dit meer te zwemmen." =>
          "I think it's dangerous to swim in this lake."
    ],
    [
        "Er zijn altijd veel mensen in de bibliotheek." =>
          "There are always many people in the library."
    ],
    [ "Heb je nooit les of zo?"           => "You never have class or what?!" ],
    [ "Wanneer zijn jullie geboren?"      => "When were you born?" ],
    [ "Hij wordt snel moe."               => "He gets tired easily." ],
    [ "Er zat een kat op de tafel."       => "There was a cat on the table." ],
    [ "Zou je graag beroemd willen zijn?" => "Would you like to be famous?" ],
    [
        "Ik heb besloten niet naar Europa te gaan." =>
          "I decided not to go to Europe."
    ],
    [ "We zijn op dezelfde dag geboren." => "We were born on the same day." ],
    [ "Ik heb nu het adres niet."        => "I don't have the address now." ],
    [ "Spreek je mijn taal?"             => "Do you speak my language?" ],
    [
        "Hij was een week lang niet aanwezig op school." =>
          "He was absent from school for a week."
    ],
    [ "Ik spreek een beetje Engels."  => "I can speak a little English." ],
    [ "Ge ziet er bleek uit vandaag." => "You look pale today." ],
    [
        "Ze heeft haar geld, haar familie en haar vrienden verloren." =>
          "She lost her money, her family, her friends."
    ],
    [ "Ze kon lezen toen ze vier was." => "She could read when she was four." ],
    [ "Je moet je vader helpen."       => "You should help your father." ],
    [
        "Mensen moeten leren tevreden te zijn." =>
          "People must learn to be satisfied."
    ],
    [
        "Waarom vraagt ge dat, als ge alles weet?" =>
          "Why are you asking if you know it all?"
    ],
    [
        "Je moet zelf voor je hond zorgen." =>
          "You must take care of your dog yourself."
    ],
    [ "Heb je onze hulp nodig?" => "Do you require our help?" ],
    [ "Heb je onze hulp nodig?" => "Do you need our help?" ],
    [
        "Eerlijk gezegd denk ik dat hij een goede baas is." =>
          "Frankly speaking, I think he's a good boss."
    ],
    [
        "Ik heb niets met de zaak te maken." =>
          "I have nothing to do with the affair."
    ],
    [
        "Ik heb niets met de zaak te maken." =>
          "I have nothing to do with the case."
    ],
    [ "Heb je nog niet besloten?" => "Haven't you decided yet?" ],
    [
        "Wie heeft je verteld dat ik ziek was?" =>
          "Who told you that I was sick?"
    ],
    [ "Hij vertelde me de waarheid." => "He told me the truth." ],
    [ "Hij werd rijk."               => "He became rich." ],
    [
        "Hij zei niets, wat haar boos maakte." =>
          "He said nothing, which made her angry."
    ],
    [ "Mijn zus is mooi." => "My sister is pretty." ],
    [
        "Er staan veel woorden die ik niet begrijp." =>
          "There are many words that I don't understand."
    ],
    [ "Eet al wat ge wilt."              => "Eat whatever you like." ],
    [ "Spreek alsjeblieft niet zo snel." => "Please don't speak so fast." ],
    [
        "Het enige wat je hoeft te doen is wachten." =>
          "All you have to do is to wait."
    ],
    [ "Ik zal voor de bloemen zorgen." => "I will take care of the flowers." ],
    [ "U mag nu gaan, meneer."         => "You can go now, sir." ],
    [ "Ik zal de appel eten."          => "I'll eat the apple." ],
    [ "Ze werden het eens over de prijs." => "They agreed on a price." ],
    [
        "Geef in het Engels antwoord op de volgende vragen." =>
          "Answer the following questions in English."
    ],
    [
        "Weet je waar hij zijn fototoestel gekocht heeft?" =>
          "Do you know where he bought his camera?"
    ],
    [ "Niemand komt er achter." => "No one will know." ],
    [ "Waar is het station?"    => "Where is the station?" ],
    [
        "Hij is niet in staat een auto te kopen." =>
          "He isn't able to buy a car."
    ],
    [
        "Wilt u niet zo snel spreken, alstublieft?" =>
          "Don't speak so fast, please."
    ],
    [
        "Wat heb je liever, thee of koffie?" =>
          "Which do you like better, tea or coffee?"
    ],
    [
        "Ik heb veel geleerd uit zijn boeken." =>
          "I learned a lot from his books."
    ],
    [
        "Waar wil je van de zomer heen gaan?" =>
          "Where do you want to go this summer?"
    ],
    [ "Wat je zegt is meestal waar." => "What you say is usually true." ],
    [ "Ik heb een grote familie."    => "I have a large family." ],
    [ "Ik ben deze nacht vrij."      => "I'm free tonight." ],
    [ "Ik wil wat water drinken."    => "I want to drink some water." ],
    [ "Zou het kunnen dat dat gerucht waar is?" => "Can the rumor be true?" ],
    [
        "Hij nam de taxi om op tijd te komen." =>
          "He took a cab to arrive on time."
    ],
    [
        "Als ik geen antwoord gaf zou ik niet gesproken hebben." =>
          "If I gave no answer, I would not have spoken."
    ],
    [
        "Voor hem was het liefde op het eerste gezicht." =>
          "He fell in love with her at first sight."
    ],
    [ "Hij spreekt ook Frans." => "He can also speak French." ],
    [
        "Op dat moment was ik nog wakker." => "At that time, I was still awake."
    ],
    [
        "Je kan veel beter zwemmen dan hij." =>
          "You can swim much better than him."
    ],
    [ "Je moet het voor jezelf doen."   => "You must do it for yourself." ],
    [ "Ze werken niet eens een beetje." => "They are not working even a bit." ],
    [
        "Een vreemde taal leren is moeilijk." =>
          "Studying a foreign language is hard."
    ],
    [ "We zijn studenten."              => "We are students." ],
    [ "Heb je geen honger?"             => "Aren't you hungry?" ],
    [ "Ouders houden van hun kinderen." => "Parents love their children." ],
    [ "Geef mij het boek, alsjeblieft." => "Hand me that book, please." ],
    [ "Iedereen spreekt een taal."      => "Everyone speaks a language." ],
    [ "Ik mis je."                      => "I miss you." ],
    [
        "Het lijkt erop dat er een fout is gemaakt." =>
          "There appears to have been a mistake."
    ],
    [
        "De woorden kwamen uit een heel oude taal." =>
          "The words were from a very old language."
    ],
    [
        "Hij heeft me lang laten wachten." =>
          "He kept me waiting for a long time."
    ],
    [ "Geef mij iets te eten."           => "Give me something to eat." ],
    [ "Water is belangrijk voor mensen." => "Water is important for people." ],
    [ "Ik heb je nummer niet."           => "I don't have your number." ],
    [ "Wat is er gebeurd?"               => "What happened?" ],
    [
        "De echtgenoot van de zuster van mijn vader is mijn oom." =>
          "My father's sister's husband is my uncle."
    ],
    [ "Ik ben mijn horloge verloren." => "I lost my watch." ],
    [
        "Is dit voor hier of om mee te nemen?" =>
          "Is this to eat here, or to go?"
    ],
    [
        "Ik kan niet zo goed tennis spelen." => "I can't play tennis very well."
    ],
    [
        "Vandaag is er helemaal geen wind." =>
          "There is not the least wind today."
    ],
    [ "Ik kon mijn ogen niet geloven." => "I couldn't believe my eyes." ],
    [
        "We hebben alles voor ons deel gedaan." =>
          "We did everything for our part."
    ],
    [
        "Ik weet zelf ook niet wat ik in gedachten heb." =>
          "I am not certain what I have in mind myself."
    ],
    [
        "Zij zal voor altijd van haar echtgenoot houden." =>
          "She'll love her husband forever."
    ],
    [ "De vrouw maakt het meisje wakker." => "The woman awakens the girl." ],
    [ "Ik ga elke ochtend naar school."   => "I go to school every morning." ],
    [ "Dit kan onmogelijk waar zijn."     => "This can't be true." ],
    [ "Het is nooit gebeurd."             => "It never happened." ],
    [
        "Ze had geen jurk om naar het feest mee te gaan." =>
          "She had no dress to attend the party in."
    ],
    [
        "Het is heel jammer dat je vrouw niet kon komen." =>
          "It's an awful shame your wife couldn't come."
    ],
    [
        "Hij verdient twee keer zoveel als ik." =>
          "He earns twice as much as me."
    ],
    [ "Hoe gaat het met je gezin?" => "How's the family?" ],
    [ "Van wie is deze tas?"       => "Whose is this bag?" ],
    [ "Wij hebben een auto nodig." => "We need a car." ],
    [
        "Hij bleef in het huis van zijn tante." =>
          "He stayed at his aunt's house."
    ],
    [ "Het is een oude piano."        => "It's an old piano." ],
    [ "Ben je Chinees of Japans?"     => "Are you Chinese or Japanese?" ],
    [ "Je moet hem om advies vragen." => "You ought to ask him for advice." ],
    [ "Ik voelde me alleen."          => "I felt lonely." ],
    [ "Ik zou willen opnieuw jong zijn." => "I wish that I were young again." ],
    [ "Ik zou willen opnieuw jong zijn." => "I wish I were young again." ],
    [ "Ik zou willen opnieuw jong zijn." => "I wish I was young again." ],
    [
        "Je bent niet oud genoeg om alleen te gaan zwemmen." =>
          "You are not old enough to go swimming by yourself."
    ],
    [ "Ze heeft kort haar."         => "She has short hair." ],
    [ "Ik heb hulp nodig."          => "I need help." ],
    [ "Hij kan vijf talen spreken." => "He is able to speak five languages." ],
    [ "Ze sprak de hele tijd."      => "She was talking all the time." ],
    [ "Hij kan vijf talen spreken." => "He can speak five languages." ],
    [
        "Drie kinderen waren aan het spelen in het park." =>
          "Three children were playing in the park."
    ],
    [
        "Ik heb niets met die zaak te maken." =>
          "I have nothing to do with this matter."
    ],
    [ "Hoe laat is het nu in Londen?"   => "What time is it in London now?" ],
    [ "Ik ben er, wil je praten?"       => "I'm here. Do you want to chat?" ],
    [ "Wil jij dat ik antwoord geef?"   => "Do you want me to answer?" ],
    [ "Heeft iemand anders dit gezien?" => "Has anyone else seen this?" ],
    [ "Ik zal niemand je pijn laten doen." => "I won't let anyone hurt you." ],
    [ "De zon komt nu op."                 => "The sun is rising now." ],
    [ "Laat zien wat ge gekocht hebt."     => "Show me what you bought." ],
    [ "Geen enkele van de auto's is van mij." => "None of the cars are mine." ],
    [
        "Er was helemaal geen wind gisteren." =>
          "There was no wind at all yesterday."
    ],
    [
        "Er kwam nooit iemand op mijn verjaardag." =>
          "Nobody would visit me on my birthday."
    ],
    [ "De deur gaat niet open."          => "The door won't open." ],
    [ "Ik kan mijn horloge niet vinden." => "I can't find my watch." ],
    [ "Ik moet wel dingen zien."         => "I must be seeing things." ],
    [ "Hij was in de winkel."            => "He was at the store." ],
    [
        "Om de waarheid te zeggen, we zijn vorig jaar getrouwd." =>
          "To tell the truth, we got married last year."
    ],
    [
        "De school is verder dan het station." =>
          "The school is farther than the station."
    ],
    [ "Ik weet dat ge rijk zijt." => "I know you are rich." ],
    [ "Ik spreek geen Japans."    => "I don't speak Japanese." ],
    [ "Wil je iets drinken?"      => "Would you like to drink anything?" ],
    [ "Ik ken hen."               => "I know them." ],
    [
        "Was je op weg naar het treinstation toen ik je zag?" =>
          "Were you going to the train station when I saw you?"
    ],
    [
        "Er is een duidelijk verschil tussen deze twee." =>
          "There is a marked difference between them."
    ],
    [
        "Heb je niets kleiner dan dit?" =>
          "Don't you have anything smaller than this?"
    ],
    [ "Ben je gelukkig?" => "Are you happy?" ],
    [
        "Alles waar je goed in bent draagt bij aan geluk." =>
          "Anything you're good at contributes to happiness."
    ],
    [ "Hij kan niet meer lopen."            => "He can't walk any more." ],
    [ "Het is allemaal voor niets geweest." => "It was all for nothing." ],
    [ "Ik kom uit de tuin."                 => "I'm coming from the garden." ],
    [ "Neem ons met je mee!"                => "Bring us with you!" ],
    [
        "Mijn vriendin houdt er ook van om te drinken." =>
          "My girlfriend also loves to drink."
    ],
    [
        "Ik wil zien of hij het echt gerepareerd heeft." =>
          "I want to see if he really fixed this."
    ],
    [
        "Ik ben even verliefd als de eerste dag." =>
          "I am as much in love as on the first day."
    ],
    [ "Ik ben erg kort." => "I'm very short." ],
    [
        "Zelfs als het waar is, maakt het weinig uit." =>
          "Even if it is true, it matters little."
    ],
    [ "Ik weet dat hij me in het oog houdt." => "I know he is watching me." ],
    [ "Waarom kunt ge niet komen?"           => "Why can't you come?" ],
    [ "Zij is nergens bang voor." => "She is not afraid of anything." ],
    [ "Ze heeft onze hulp nodig." => "She needs our help." ],
    [ "Uw broer is erg kwaad."    => "Your brother is very angry." ],
    [ "Ga verder zonder mij."     => "You go on without me." ],
    [
        "Ze las een leuk verhaal aan de kinderen voor." =>
          "She read an amusing story to the children."
    ],
    [
        "Ik heb het boek gekocht voor tien dollar." =>
          "I bought the book for ten dollars."
    ],
    [ "Ik voel me niet ziek."      => "I don't feel sick." ],
    [ "Het leven is kort."         => "Life is short." ],
    [ "Het spijt me dat te horen." => "I'm sorry to hear that." ],
    [ "Het spijt me dat te horen." => "I am sorry to hear that." ],
    [ "Kom snel terug."            => "Come back soon." ],
    [
        "Engels is een taal die over heel de wereld wordt gesproken." =>
          "English is a language spoken all over the world."
    ],
    [
        "Ze hadden het naar hun zin op het feest." =>
          "They enjoyed themselves at the party."
    ],
    [
        "Waar werd hij geboren en groeide hij op?" =>
          "Where was he born and raised?"
    ],
    [ "Mijn hand is in warm water." => "My hand is in warm water." ],
    [ "Kan je het vinden?"          => "Can you find it?" ],
    [
        "Ze kwam één keer toen mijn zuster thuis was." =>
          "She once came when my sister was home."
    ],
    [
        "Ik was gisteren niet aanwezig op school." =>
          "I was absent from school yesterday."
    ],
    [
        "Waarom kwam hij niet naar het feestje?" =>
          "Why didn't he come to the party?"
    ],
    [
        "Hoe komt het dat je zo goed Engels praat?" =>
          "How come you know English so well?"
    ],
    [ "We gaan van tijd tot tijd vissen." => "We go fishing once in a while." ],
    [ "Het is hier nog net als vroeger." => "It's still just as before here." ],
    [
        "We gaan van tijd tot tijd vissen." =>
          "We go fishing from time to time."
    ],
    [ "Hij ging met de auto naar Boston." => "He went to Boston by car." ],
    [
        "Het leven is te kort om Duits te leren." =>
          "Life is too short to learn German."
    ],
    [ "Ik zal u helpen zoveel ik kan." => "I will give you what help I can." ],
    [ "Ik woon samen met mijn ouders." => "I live with my parents." ],
    [ "Ik ben gelukkig."               => "I feel happy." ],
    [
        "Je bent het meisje van mijn dromen." => "You're the girl of my dreams."
    ],
    [
        "We moeten voor onze ouders zorgen." =>
          "We have to look after our parents."
    ],
    [
        "Ik wil alleen maar gewoon en gelukkig leven, zonder problemen." =>
          "I just want to live simply and happily, without troubles."
    ],
    [ "Neem de tijd." => "Take your time." ],
    [
        "Vraag hem wanneer het volgende vliegtuig gaat." =>
          "Ask him when the next plane leaves."
    ],
    [
        "Ze probeerde zo snel te lopen als ze kon." =>
          "She tried to run as fast as she could."
    ],
    [ "Hij wou rijk zijn." => "He wanted to be rich." ],
    [
        "Hij kwam ons vragen hem te helpen." => "He came to ask us to help him."
    ],
    [
        "Ik stond vroeg op om de eerste trein te nemen." =>
          "I got up early in order to catch the first train."
    ],
    [ "We houden niet van regen."   => "We don't like the rain." ],
    [ "We houden niet van regen."   => "We don't like rain." ],
    [ "We zijn vijf jaar getrouwd." => "We've been married for five years." ],
    [
        "Ik was niet aanwezig op school omdat ik ziek was." =>
          "I was absent from school because I was sick."
    ],
    [ "Ik heb nog een vriend in China." => "I have another friend in China." ],
    [
        "Ik kon nauwelijks zien wie wie was." =>
          "I could hardly tell who was who."
    ],
    [ "Ik lees graag boeken." => "I like reading books." ],
    [
        "Vroeg of laat zal hij er spijt van krijgen." =>
          "He will regret it sooner or later."
    ],
    [ "Ik moet mijn moeder helpen." => "I have to help my mother." ],
    [ "Er blijft nog veel te doen." => "Much still remains to be done." ],
    [ "Er blijft nog veel te doen." => "There still remains much to be done." ],
    [ "Het is vandaag erg warm, toch?" => "It's very hot today, isn't it?" ],
    [
        "Hij verdient drie keer zoveel als ik." =>
          "He makes three times more money than I do."
    ],
    [
        "Ik kan over alles praten met mijn beste vriend." =>
          "I can talk about anything with my best friend."
    ],
    [
        "Je hoeft niet in het ziekenhuis te blijven." =>
          "You don't have to stay in the hospital."
    ],
    [
        "Hij heeft lange tijd niet naar hen geschreven." =>
          "He has not written to them for a long time."
    ],
    [
        "Waar zou je als eerste heen willen?" =>
          "Where would you like to go first?"
    ],
    [ "Ik zal je nooit verlaten."      => "I'll never leave you." ],
    [ "Wie heeft dit boek geschreven?" => "Who wrote this book?" ],
    [
        "Waarom kom je niet bij ons op bezoek?" =>
          "Why don't you come visit us?"
    ],
    [
        "Ik ging naar buiten, ook al regende het." =>
          "I went out even though it was raining."
    ],
    [ "Ik heb hem al jaren niet gezien." => "I haven't seen him for years." ],
    [
        "Ik zoek een tas voor mijn vrouw." =>
          "I'm looking for a bag for my wife."
    ],
    [ "Ik schreef haar een lange brief." => "I wrote a long letter to her." ],
    [ "Hij zei dat hij mij wou helpen."  => "He said that he would help me." ],
    [ "Ze vraagt hoe dat kan."    => "She's asking how that's possible." ],
    [ "Ik ga dood van de honger!" => "I'm starving!" ],
    [
        "Ik twijfel er niet aan dat hij me zal helpen." =>
          "I don't doubt that he will help me."
    ],
    [ "Het is gezond om gek te zijn." => "It's healthy to be mad." ],
    [ "Het is gezond om gek te zijn." => "It's healthy to be crazy." ],
    [ "Ik zie een licht."             => "I see a light." ],
    [
        "Wat is het verschil tussen een dorp en een stad?" =>
          "What's the difference between a village and a town?"
    ],
    [ "We vragen ons af waarom."          => "We wonder why." ],
    [ "Wil je nog wat taart?"             => "Would you like some more cake?" ],
    [ "Ik moet deze mensen helpen."       => "I must help these people." ],
    [ "Zijn leven is in gevaar."          => "His life is in danger." ],
    [ "Ik neem aan dat je honger hebt."   => "I suppose you're hungry." ],
    [ "Laat hem zien wie de baas is!"     => "Show him who's boss!" ],
    [ "Hij moet dom zijn om dat te doen." => "He must be a fool to do so." ],
    [
        "Ik heb zijn roman niet gelezen en mijn broer ook niet." =>
          "I haven't read his novel, and my brother hasn't either."
    ],
    [ "Hij speelde met zijn kat." => "He played with his cat." ],
    [ "Heb je een fototoestel?"   => "Do you have a camera?" ],
    [
        "Hij werkt niet alleen niet, maar zal ook geen baan vinden." =>
          "He not only does not work but will not find a job."
    ],
    [
        "Ik vond het nodig om iedere dag vroeg op te staan." =>
          "I found it necessary to get up early every morning."
    ],
    [ "Kan ik iets krijgen om te eten?" => "Can I get something to eat?" ],
    [
        "Het is jammer dat ik niet zo goed Engels begrijp." =>
          "It's a pity that I don't understand English well."
    ],
    [ "Op je plaats, klaar, af!" => "On your marks, get set, go!" ],
    [
        "Ik heb geen zin tegen iemand te praten." =>
          "I don't feel like talking to anybody."
    ],
    [ "Ik ben net zo sterk als jij."  => "I am as strong as you." ],
    [ "Hij heeft een hoed op."        => "He has a hat on." ],
    [ "Ze heeft een witte kat."       => "She has a white cat." ],
    [ "Ze heeft een huis aan de zee." => "She has a house by the sea." ],
    [ "Al de jongens zijn even oud."  => "All the boys are the same age." ],
    [ "Doe je eigen werk."            => "Do your own work." ],
    [ "Hij schreef een brief."        => "He wrote a letter." ],
    [
        "Ik vrees dat we er geen meer over hebben." =>
          "I'm afraid we don't have any left."
    ],
    [
        "Het wordt tijd dat je naar de kapper gaat." =>
          "It's about time you went to the barber's."
    ],
    [ "Is dat wat je in gedachten hebt?" => "Is that what you have in mind?" ],
    [
        "Een andere taal leren kost veel tijd." =>
          "To learn a foreign language requires a lot of time."
    ],
    [ "Ze is een heel goede lerares." => "She is a very good teacher." ],
    [ "Ze is een heel goede lerares." => "She's a very good teacher." ],
    [
        "Hij begon de dag met een goed ontbijt." =>
          "He started the day with a good breakfast."
    ],
    [
        "Omdat al zijn vrienden ook arm waren." =>
          "Because all his friends were poor, too."
    ],
    [ "Ik zal de vissen in leven houden." => "I will keep the fish alive." ],
    [
        "Dat is niet precies wat ik in gedachten had." =>
          "That's not exactly what I had in mind."
    ],
    [ "Heb je zin om te gaan zwemmen?" => "Do you feel like going swimming?" ],
    [ "Ik kan hier niet sterven."      => "I can't die here." ],
    [
        "Hij kon zijn eigen ogen niet geloven." =>
          "He could not believe his eyes."
    ],
    [ "Hij heeft drie broers."        => "He has three brothers." ],
    [ "Wie is die persoon?"           => "Who is that person?" ],
    [ "Wie is die persoon?"           => "Who is this person?" ],
    [ "Zij hield hem aan zijn woord." => "She kept him to his word." ],
    [
        "Ik ben de tweede uit drie kinderen." =>
          "I'm the second oldest of three children."
    ],
    [ "Laat me alsjeblieft je foto zien." => "Please show me your picture." ],
    [ "Wat zult ge worden?"               => "What are you going to be?" ],
    [ "Wie is deze persoon?"              => "Who is that person?" ],
    [ "Wie is deze persoon?"              => "Who is this person?" ],
    [
        "Zit daar niet te zitten, doe iets!" =>
          "Don't just sit there, do something!"
    ],
    [ "We hebben het op het moment erg druk." => "We're very busy just now." ],
    [
        "Lucht is voor mensen wat water is voor vissen." =>
          "Air is to man what water is to fish."
    ],
    [
        "Lucht is voor mensen wat water is voor vissen." =>
          "Air is for people what water is for fish."
    ],
    [
        "Lucht is voor mensen, wat water is voor vissen." =>
          "Air is to men what water is to fish."
    ],
    [
        "Ik heb de krant van vandaag nog niet gelezen." =>
          "I haven't read today's newspaper yet."
    ],
    [ "Ik moet het vinden." => "I have to find it." ],
    [ "Ik moet het vinden." => "I must find it." ],
    [ "De soep is te heet." => "The soup is too hot." ],
    [
        "Is jullie oom nog steeds in het buitenland?" =>
          "Is your uncle still abroad?"
    ],
    [ "Ik kan er niet vanaf komen." => "I can't get rid of it." ],
    [ "Wat is er mis mee?"          => "What's wrong with it?" ],
    [
        "Zij zijn getrouwd toen ze nog jong waren." =>
          "They married when they were young."
    ],
    [
        "Zij zijn getrouwd toen ze nog jong waren." =>
          "They got married when they were still young."
    ],
    [ "Ik ben op goede voet met hem." => "I am on good terms with him." ],
    [
        "Hebt gij uw huiswerk al af?" =>
          "Have you finished doing your homework yet?"
    ],
    [ "Hebt gij uw huiswerk al af?" => "Have you finished your homework yet?" ],
    [
        "Hebt gij uw huiswerk al af?" =>
          "Have you finished your homework already?"
    ],
    [ "Dit is een verhaal over sterren." => "This is a story about stars." ],
    [ "Hebt gij uw huiswerk al af?" => "Are you done with your homework yet?" ],
    [ "Ze heeft hulp nodig."        => "She needs help." ],
    [ "Ze heeft hulp nodig."        => "She is in need of help." ],
    [ "Ik heb altijd honger."       => "I'm always hungry." ],
    [ "Ik kon het met moeite zien." => "I was hardly able to see it." ],
    [
        "Dit is de jurk die ik vorige week heb gemaakt." =>
          "This is the dress I made last week."
    ],
    [
        "Ik heb een vriend die in Engeland woont." =>
          "I have a friend who lives in England."
    ],
    [
        "Heeft u niets kleiner dan dit?" =>
          "Don't you have anything smaller than this?"
    ],
    [ "Is er iets gebeurd?" => "Has something happened?" ],
    [
        "Er is een kerk dicht bij mijn huis." =>
          "There is a church near my house."
    ],
    [ "Laat de deur niet open." => "Don't leave the door open." ],
    [ "Laat de deur niet open." => "Don't leave door open." ],
    [
        "Wil je naar mijn feestje komen?" =>
          "Would you like to come to my party?"
    ],
    [
        "Mijn vader gaat volgende week naar buitenland." =>
          "My father is going to go abroad next week."
    ],
    [
        "Ik ga met het vliegtuig naar Amerika." =>
          "I am going to America by plane."
    ],
    [ "Ik ben nog nooit zo moe geweest." => "I've never been so tired." ],
    [ "Vond je de film leuk?"            => "Did you enjoy the film?" ],
    [ "Ik gaf hem wat advies."           => "I gave him some advice." ],
    [ "Het is vrij koud."                => "It's pretty cold." ],
    [ "Ben je nu tevreden?"              => "Are you satisfied now?" ],
    [
        "Kop op! Het is niet zo erg als je denkt." =>
          "Cheer up! Things are not as bad as you think."
    ],
    [
        "Ik heb geen zin om zo hard te lopen." =>
          "I don't feel like walking so fast."
    ],
    [ "Ik zal u gelukkig maken."         => "I'll make you happy." ],
    [ "Ik zal u gelukkig maken."         => "I will make you happy." ],
    [ "Ge zult morgen moeten komen."     => "You will have to come tomorrow." ],
    [ "Je kan niet op dat eiland wonen." => "You can't live on that island." ],
    [ "Ze spelen graag in de sneeuw."    => "They like to play in the snow." ],
    [ "Het wordt minder."                => "It's abating." ],
    [ "Ik werk niet op zondag."          => "I don't work on Sunday." ],
    [
        "Ben je al gewend aan Japans eten?" =>
          "Have you gotten used to eating Japanese food yet?"
    ],
    [
        "Wij zijn niet gemaakt voor elkaar." =>
          "We are not made for each other."
    ],
    [
        "Welke taal spreken ze in jouw land?" =>
          "What language do they speak in your country?"
    ],
    [ "Pas op de hond!"              => "Beware of the dog!" ],
    [ "Ze had een vreemde droom."    => "She dreamed a strange dream." ],
    [ "Met wie ben je gekomen?"      => "Who did you come with?" ],
    [ "Ik verloor alles wat ik had." => "I lost everything I had." ],
    [
        "De meeste mensen denken dat ik gek ben." =>
          "Most people think I'm crazy."
    ],
    [
        "Goed, laten we beginnen met ons werk." => "Well, let's start our work."
    ],
    [
        "Hebt ge een vraag over deze les?" =>
          "Do you have any question on this lesson?"
    ],
    [
        "Waar heb je het gevonden, op school of thuis?" =>
          "Where did you find it, at school or at home?"
    ],
    [ "Hoe snel ze loopt!"                  => "How fast she is running!" ],
    [ "Ik wou dat dit werk voorbij was."    => "I wish this job was over." ],
    [ "Ik ben nog nooit in Europa geweest." => "I have never been to Europe." ],
    [
        "Ze heeft haar geld, haar gezin en haar vrienden verloren." =>
          "She lost her money, her family, her friends."
    ],
    [ "Het was een erg lange vergadering." => "It was a very long meeting." ],
    [ "Ik kan niet erg goed zwemmen." => "I'm not very good at swimming." ],
    [
        "Ik heb een groot vertrouwen in de dokter." =>
          "I have great belief in the doctor."
    ],
    [
        "Herinner je je de keer dat we naar Parijs gingen?" =>
          "Do you remember the time we went to Paris?"
    ],
    [ "Mijn vader is altijd bezig."        => "My father is always busy." ],
    [ "Ik ben altijd klaar om te sterven." => "I'm always ready for death." ],
    [ "Ze kocht een boek in de winkel." => "She bought a book at the shop." ],
    [
        "Engels is voor mij te moeilijk om te begrijpen." =>
          "English is too difficult for me to understand."
    ],
    [
        "Misschien vond hij het wel een goed idee." =>
          "Maybe he liked the idea."
    ],
    [ "Waar heb je die vrouwen gezien?" => "Where did you see those women?" ],
    [ "Ze heeft het boek niet gelezen." => "She didn't read the book." ],
    [
        "Ik heb drie uur nodig gehad om mijn huiswerk te maken." =>
          "It took me three hours to do my homework."
    ],
    [ "Ik voel dat ik u moet helpen." => "I feel that I should help you." ],
    [ "Waar ben je gisteren geweest?" => "Where did you go yesterday?" ],
    [ "Mijn leven was in gevaar."     => "My life was in danger." ],
    [ "Ik ben een nieuwe student."    => "I am a new student." ],
    [ "Waar ben je gisteren geweest?" => "Where were you yesterday?" ],
    [ "Ik ben een nieuwe student."    => "I'm a new student." ],
    [
        "Het weer hier is hetzelfde als in Frankrijk." =>
          "The weather here is the same as in France."
    ],
    [ "Ik moet eigenlijk op school zijn." => "I should be at school." ],
    [ "Eet wat je wilt."                  => "Eat whatever you like." ],
    [ "Kijk eens naar dit."               => "Take a look at this." ],
    [
        "Weet jij hoe je bij Toms huis komt?" =>
          "Do you know how to get to Tom's house?"
    ],
    [ "Waar was je gisteravond?" => "Where were you last night?" ],
    [ "Je bent gek."             => "You are crazy." ],
    [
        "Soms kan hij een vreemde jongen zijn." =>
          "Sometimes he can be a strange guy."
    ],
    [ "Ik wou u geen pijn doen." => "I didn't mean to hurt you." ],
    [
        "Het lijkt erop dat het deze zomer opnieuw koud zal zijn." =>
          "It looks as though this summer will be cold again."
    ],
    [
        "Jij bent de vrouw van mijn dromen." =>
          "You are the woman of my dreams."
    ],
    [
        "Hij trok alles terug wat hij gezegd had." =>
          "He took back everything he said."
    ],
    [ "Doe wat je wilt."      => "Do as you want." ],
    [ "Hij kent de waarheid." => "He knows the truth." ],
    [
        "Blij zijn zij die van bloemen houden." =>
          "Happy are those who love flowers."
    ],
    [ "Laten we gaan als het niet regent." => "Let's go if it's not raining." ],
    [
        "Ik kan niet geloven dat ik dat vergeten ben." =>
          "I can't believe I forgot about that."
    ],
    [
        "Is hier iemand die niet akkoord gaat?" =>
          "Is there anyone here who disagrees?"
    ],
    [
        "Je zult op tijd op school zijn als je nu vertrekt." =>
          "You will be in time for school if you leave at once."
    ],
    [
        "Hij gaf mij de schuld van het ongeluk." =>
          "He blamed the accident on me."
    ],
    [
        "Het zou leuk zijn als je kon zingen." =>
          "It would be great if you could sing."
    ],
    [ "Kijk naar die grote hond."        => "Look at that big dog." ],
    [ "Hij kon niet heel snel lopen."    => "He couldn't run very fast." ],
    [ "Hij gaat daar elke dag naartoe."  => "He goes there every day." ],
    [ "Geef haar er niet de schuld van." => "Don't blame it on her." ],
    [
        "De kamer was zo donker dat we helemaal niets konden zien." =>
          "The room was so dark that we could see nothing at all."
    ],
    [
        "Mijn zoon ging naar Londen, waar ik geboren ben." =>
          "My son went to London, where I was born."
    ],
    [
        "Ge moet hem maar een klein beetje helpen." =>
          "You have only to give him a little help."
    ],
    [
        "Eens zult ge de waarheid te weten komen." =>
          "You will know the truth some day."
    ],
    [ "Ik weet wie mijn vijand is." => "I know who my enemy is." ],
    [
        "Denk je dat zoiets mogelijk is?" =>
          "Do you think such a thing is possible?"
    ],
    [ "Wie heeft een brief geschreven?"  => "Who wrote a letter?" ],
    [ "Ik zal u nooit verlaten."         => "I'll never leave you." ],
    [ "Ik kan je maar niet vergeten."    => "I just can't forget about you." ],
    [ "Hij kan Frans spreken."           => "He can speak French." ],
    [ "De volgende ochtend was hij weg." => "The next morning, he was gone." ],
    [
        "Ik zal nooit iemand zoals hij vinden." =>
          "I'll never find someone like him."
    ],
    [ "Het leven is vreemd."      => "Life is strange." ],
    [ "Ze schreef me snel terug." => "She wrote me back soon." ],
    [ "Ik heb je alles verteld."  => "I've told you everything." ],
    [
        "Ik was aan het zwemmen in de rivier." => "I was swimming in the river."
    ],
    [ "Dat is nu juist het probleem." => "Therein lies the problem." ],
    [
        "Er is weinig melk in het glas." => "There is little milk in the glass."
    ],
    [ "Hij heeft een kat en twee honden." => "He has a cat and two dogs." ],
    [ "Ga iets anders vinden om te doen." => "Go find something else to do." ],
    [
        "Er zit geen water meer in de fles." =>
          "There is no water left in the bottle."
    ],
    [ "Ik heb hem gevraagd om dat te doen." => "I asked him to do that." ],
    [ "U kunt uw eigen maken."              => "You can make your own." ],
    [ "Geeft u me de sleutel."              => "Give me the key." ],
    [ "Zeg hem dat niet, alsjeblieft!"      => "Don't tell him that, please!" ],
    [ "Ik haat je nog steeds."              => "I still hate you." ],
    [ "Heb je het druk op het moment?"      => "Are you busy right now?" ],
    [ "Je hebt verloren, geef het op!"      => "You have lost, give up!" ],
    [ "Hij is arm, maar eerlijk."           => "He is poor, but honest." ],
    [
        "Ik vertelde haar dat je een aardig meisje bent." =>
          "I told her that you're a nice girl."
    ],
    [
        "Ze kwam voorbij, zonder mij te zien." =>
          "She passed by without seeing me."
    ],
    [ "Je hebt een nieuw huis gekocht." => "You bought a new house." ],
    [
        "Het is beter rijk te leven, dan rijk te sterven." =>
          "It is better to live rich, than to die rich."
    ],
    [ "Ik blijf hier niet lang."   => "I will stay here for a short period." ],
    [ "Hij heeft grote problemen." => "He has big problems." ],
    [ "Wanneer ben je getrouwd?"   => "When did you get married?" ],
    [
        "Jij bent de mooiste vrouw die ik ooit gezien heb." =>
          "You are the most beautiful woman I have ever seen."
    ],
    [ "Ben je aan het studeren?" => "Are you studying?" ],
    [ "We hebben een witte kat." => "We have a white cat." ],
    [
        "Ik hou mijn kleren graag zo lang mogelijk." =>
          "I like to keep my clothes for as long as possible."
    ],
    [ "Laten we uit eten gaan vanavond." => "Let's eat out tonight." ],
    [
        "Zonder zon zouden we niet kunnen leven." =>
          "If there was no sun, we would not be able to live."
    ],
    [
        "Kom me alsjeblieft even helpen in mijn kamer." =>
          "Please come to my room to help me."
    ],
    [
        "Veel kinderen horen het verschil niet zo goed." =>
          "A lot of children don't hear the difference very well."
    ],
    [ "Wat denk je ervan?"        => "What do you think about it?" ],
    [ "Ga door met werken!"       => "Go ahead with your work." ],
    [ "Ze is mijn vriendin."      => "She is my girlfriend." ],
    [ "Wat denk je ervan?"        => "What do you think about that?" ],
    [ "Hij zat op het bed."       => "He sat on the bed." ],
    [ "Ik heb een beetje honger." => "I'm a bit hungry." ],
    [
        "Kunt u alstublieft plaats voor mij maken?" =>
          "Could you please make room for me?"
    ],
    [
        "Ik heb de sleutel gevonden waar ik naar op zoek was." =>
          "I found the key I had been looking for."
    ],
    [ "Wanneer heb je hem ontmoet?" => "When did you meet him?" ],
    [ "Ze is kleiner dan ik."       => "She's smaller than me." ],
    [
        "Ik weet zeker dat je het leuk zult vinden." =>
          "I'm sure you'll like it."
    ],
    [
        "Was deze brief geschreven door Ken?" =>
          "Was this letter written by Ken?"
    ],
    [ "Als het regent, komt hij niet." => "If it rains, he won't come." ],
    [ "Waar is mijn paraplu?"          => "Where is my umbrella?" ],
    [
        "Ik begrijp niet waarom hij de waarheid niet verteld heeft." =>
          "I don't understand why he didn't tell the truth."
    ],
    [
        "Er was veel sneeuw vorig jaar." => "There was a lot of snow last year."
    ],
    [ "Vorig jaar was er veel sneeuw." => "It snowed a lot last year." ],
    [ "We kennen hem."                 => "We know him." ],
    [
        "Zou je even kunnen wachten?" => "Would you mind waiting a few minutes?"
    ],
    [
        "Wanneer komt zijn nieuwe roman uit?" =>
          "When will his new novel come out?"
    ],
    [ "Ik hoorde je niet."     => "I didn't hear you." ],
    [ "Hoe is dat gebeurd?"    => "How did it happen?" ],
    [ "Deze hoed is van mij."  => "This hat is mine." ],
    [ "Ik ben niet je vijand." => "I am not your enemy." ],
    [ "Ik ben niet je vijand." => "I'm not your enemy." ],
    [
        "Het is een zonde dat je niet kan komen." =>
          "It's a pity that you can't come."
    ],
    [
        "Het is een zonde dat je niet kan komen." =>
          "It is a pity you cannot come."
    ],
    [
        "Het is een zonde dat je niet kan komen." =>
          "It is a pity that you can not come."
    ],
    [ "Hij is bang voor de honden."       => "He is afraid of the dogs." ],
    [ "Ik denk dat dat gerucht waar is."  => "I think that rumor is true." ],
    [ "Ik zal daar blijven."              => "I will stay there." ],
    [ "Volgende maand ga ik naar Parijs." => "I'm going to Paris next month." ],
    [
        "De tafel neemt niet veel plaats in." =>
          "The table doesn't take much room."
    ],
    [ "Laten we het nog eens proberen." => "Let's try once again." ],
    [ "Ik heb liever thee dan koffie."  => "I prefer tea to coffee." ],
    [ "Je zit in de verkeerde trein."   => "You are on the wrong train." ],
    [ "Hij had en dochter."             => "He had one daughter." ],
    [
        "De trein zat zo vol, dat niemand van ons kon zitten." =>
          "The train was so crowded that none of us could get a seat."
    ],
    [ "Ze moeten onmiddellijk hier komen." => "They must come here at once." ],
    [ "Ik mag je vriendin niet."           => "I don't like your girlfriend." ],
    [ "Hoe lang moet je wachten?" => "How long will you have to wait?" ],
    [
        "Ik zou je een vriend van mij willen voorstellen." =>
          "I would like you to meet a friend of mine."
    ],
    [
        "Wat zou je in de toekomst willen doen?" =>
          "What would you like to do in the future?"
    ],
    [ "Zal de politie komen?"        => "Will the police come?" ],
    [ "Ik spreek een beetje Japans." => "I speak a little Japanese." ],
    [ "Het is me allemaal gelijk."   => "It is all the same for me." ],
    [
        "Ik had nooit gedacht dat het zo gemakkelijk zou zijn." =>
          "I never thought it would be so easy."
    ],
    [ "Ik had veel honger."         => "I was very hungry." ],
    [ "Hij had een nieuw idee."     => "He had a new idea." ],
    [ "Ik ben nu op het vliegveld." => "I'm at the airport now." ],
    [
        "Ik zou een koffie willen drinken." => "I would like to drink a coffee."
    ],
    [ "Ik hoor dat hij ziek is." => "I hear he is ill." ],
    [
        "Er zijn veel sterren die groter zijn dan onze zon." =>
          "There exist several stars which are larger than our Sun."
    ],
    [
        "Er zijn veel sterren die groter zijn dan onze zon." =>
          "There are a lot of stars which are larger than our sun."
    ],
    [
        "Ik kan Chinees wel spreken, maar niet lezen." =>
          "I can speak Chinese, but I can't read Chinese."
    ],
    [
        "Er sterven elke dag veel goede mensen." =>
          "Many good people die every day."
    ],
    [ "Ik versta er niet veel van." => "I don't understand much about it." ],
    [ "Zeg me waar ze woont."       => "Tell me where she lives." ],
    [ "Hij ging naar de winkel."    => "He went to the shop." ],
    [ "Hij ging naar de winkel."    => "He went to the store." ],
    [
        "Ik ken een meisje van wie de vader advocaat is." =>
          "I know a girl whose father is lawyer."
    ],
    [
        "Hij wilde vroeg wakker gemaakt worden door zijn vrouw." =>
          "He wanted to be woken up early by his wife."
    ],
    [ "Mijn moeder is altijd bezig." => "My mother is always busy." ],
    [ "Ik speel met hem."            => "I play with him." ],
    [
        "Kom alsjeblieft zo snel mogelijk naar huis." =>
          "Please come home as quickly as possible."
    ],
    [
        "Ik ben niet zo jong als vroeger." =>
          "I'm not as young as I used to be."
    ],
    [ "Ik denk dat het een geheim is."  => "I guess it's a secret." ],
    [ "Laten we dat nog eens proberen." => "Let's try once again." ],
    [
        "Een vriend van mij studeert in het buitenland." =>
          "A friend of mine is studying abroad."
    ],
    [
        "Al mijn vrienden en familie zijn dood." =>
          "All my friends and family are dead."
    ],
    [ "Hij was te moe om te studeren." => "He was too tired to study." ],
    [
        "Heb je het huiswerk zelf gemaakt?" =>
          "Did you do the homework by yourself?"
    ],
    [
        "Ik heb het gekocht voor tien dollar." => "I bought it for ten dollars."
    ],
    [ "Hij nam me mee naar het station." => "He took me to the station." ],
    [ "Hij woont in een dorp."           => "He lives in a village." ],
    [ "Ik hou van dit spel."             => "I love this game." ],
    [
        "Als ze geen brood hebben, laat ze dan taart eten!" =>
          "If they don't have bread, let them eat cake."
    ],
    [
        "Ga je daar de hele dag blijven staan?" =>
          "Are you just going to stand there all day?"
    ],
    [
        "Meneer Brown heeft altijd een boek bij zich." =>
          "Mr Brown always carries a book with him."
    ],
    [
        "Meneer Brown heeft altijd een boek bij zich." =>
          "Mr. Brown always carries a book with him."
    ],
    [ "Ik neem alles terug."        => "I stand corrected." ],
    [ "Ik ben erg gevaarlijk."      => "I am very dangerous." ],
    [ "Ik ben in Amerika geboren."  => "I was born in America." ],
    [ "Zijn concert was zeer goed." => "His concert was very good." ],
    [
        "Kunt ge met de trein naar kantoor gaan?" =>
          "Can you go to the office by train?"
    ],
    [ "Hij keek uit het raam."      => "He looked out of the window." ],
    [ "Het ziet er vreemd uit."     => "It looks strange." ],
    [ "Geloof me maar gewoon."      => "Just take my word for it." ],
    [ "Laten we verder gaan."       => "Let's move on." ],
    [ "Ik mis mijn ouders."         => "I miss my parents." ],
    [ "Ze liet hem mijn foto zien." => "She showed him my picture." ],
    [
        "Vanaf morgen kunnen we samen naar het werk gaan." =>
          "From tomorrow on we can go to work together."
    ],
    [ "Moet ik je helpen?" => "Shall I help you?" ],
    [ "Moet ik je helpen?" => "Do you wish me to help?" ],
    [ "Hij zit aan tafel." => "He's sitting at the table." ],
    [
        "Ze is niet alleen aardig, maar ook eerlijk." =>
          "She is not only kind but honest."
    ],
    [
        "Hij lijkt het land verlaten te hebben." =>
          "He seems to have left the country."
    ],
    [ "Wij hebben genoeg tijd."        => "We have enough time." ],
    [ "Kan je me helpen?"              => "Can you help me?" ],
    [ "Jij kan zwemmen, maar ik niet." => "You can swim, but I can't swim." ],
    [
        "Ze geeft het grootste deel van haar geld uit aan kleren." =>
          "She spends most of her money on clothes."
    ],
    [ "Dit probleem gaat me te boven."  => "This problem is beyond me." ],
    [ "Van dit boek houd ik het meest." => "I love this book above all." ],
    [ "Ik kon het nauwelijks zien."     => "I was hardly able to see it." ],
    [
        "Voor zover ik weet, is dat gerucht niet waar." =>
          "To the best of my knowledge, the rumor is not true."
    ],
    [ "Waren ze niet tevreden?"            => "Weren’t they satisfied?" ],
    [ "Hij beloofde me om vroeg te komen." => "He promised me to come early." ],
    [
        "Wat gaan jullie vanavond doen?" =>
          "What are you going to do this evening?"
    ],
    [ "Ik ben kleiner dan u." => "I am shorter than you." ],
    [
        "Eigenlijk vond ze het helemaal niet leuk, maar ze zei niets." =>
"Truth be told, she didn't like it in the least, but she didn't say anything."
    ],
    [
        "Eigenlijk vond ze het helemaal niet leuk, maar ze zei niets." =>
"Strictly speaking, she didn't like it at all, but she didn't say a thing."
    ],
    [
        "Dit is de jongen die je horloge heeft gevonden." =>
          "This is the boy who found your watch."
    ],
    [ "Dit is het eind van mijn verhaal." => "This is the end of my story." ],
    [
        "Waarom vragen we hem niet om advies?" =>
          "Why don't we ask for his advice?"
    ],
    [
        "Ik had nooit gedacht dat het zo gemakkelijk ging zijn." =>
          "I never thought it would be so easy."
    ],
    [
        "Zal ze het vandaag af kunnen krijgen?" =>
          "Will she be able to finish it today?"
    ],
    [
        "Over wat hebt ge het eigenlijk?" =>
          "What on earth are you talking about?"
    ],
    [ "Hij kwam in mijn buurt wonen."     => "He moved into my neighborhood." ],
    [ "Ik zal je wat foto's laten zien."  => "I will show you some pictures." ],
    [ "Ben je ergens op aan het wachten?" => "Are you waiting for something?" ],
    [ "Wij leren Engels op school."       => "We learn English at school." ],
    [ "Het zou kunnen dat je hem gaat ontmoeten." => "You may meet him." ],
    [ "Het zou kunnen dat je hem gaat ontmoeten." => "You might meet him." ],
    [ "Er staat geen wind vandaag."               => "There's no wind today." ],
    [ "Dat ging per ongeluk!"                     => "I didn't mean to!" ],
    [ "Waar kennen jullie elkaar van?" => "How do you know each other?" ],
    [
        "Ik zou liever buiten gaan dan binnen te blijven." =>
          "I would rather go out than stay indoors."
    ],
    [ "Ik ben getrouwd." => "I'm married." ],
    [
        "Zeg je dat mijn leven in gevaar is?" =>
          "Are you saying my life is in danger?"
    ],
    [ "Doe uw schoenen uit." => "Take off your shoes." ],
    [
        "Ik herinner me het huis waar ik opgegroeid ben." =>
          "I remember the house where I grew up."
    ],
    [ "Deze vraag is niet makkelijk."    => "This question isn't easy." ],
    [ "Wie heeft deze brief geschreven?" => "Who wrote this letter?" ],
    [ "Deze vraag is niet makkelijk."    => "This question is not easy." ],
    [ "Hij las het boek gisteren."       => "He read the book yesterday." ],
    [ "Ik deed de deur achter me dicht." => "I shut the door behind me." ],
    [
        "Geef het aan iemand die u leuk vindt." => "Give it to anyone you like."
    ],
    [
        "Kan ik met iemand praten die Japans spreekt?" =>
          "Can I talk to someone who speaks Japanese?"
    ],
    [
        "Ze lijkt jong maar eigenlijk is ze ouder dan jij." =>
          "She looks young, but actually she's older than you are."
    ],
    [ "De vakantie is bijna om."      => "The vacation is close to an end." ],
    [ "Ik blijf hier tot tien uur."   => "I'll stay here until ten." ],
    [ "Ik groeide op in het land."    => "I grew up in the country." ],
    [ "En weer ging een dag voorbij." => "And another day went by." ],
    [
        "Er was niets in de kamer, behalve een oude stoel." =>
          "There was nothing but an old chair in the room."
    ],
    [ "Hoe zeg je dat?"                      => "How do you say that?" ],
    [ "We kennen elkaar niet."               => "We don't know each other." ],
    [ "Vraag hem alstublieft om te wachten." => "Please tell him to wait." ],
    [ "Hij is acht."                         => "He is eight." ],
    [
        "Ik ben van plan om volgende week naar Europa te vertrekken." =>
          "I'm planning to leave for Europe next week."
    ],
    [ "De stad was erg druk." => "The town was full of activity." ],
    [
        "Hij ging om tien uur naar bed zoals gewoonlijk." =>
          "He went to bed at ten as usual."
    ],
    [
        "Vertel niemand wat we aan het doen zijn." =>
          "Don't tell anyone what we're doing."
    ],
    [
        "Niet alle kinderen houden van appels." =>
          "Not all children like apples."
    ],
    [ "Hij eet aan één stuk door." => "He eats non-stop." ],
    [ "Pas op dat ge niet valt!"   => "Be careful not to fall." ],
    [ "Wij zijn goede vrienden."   => "We are good friends." ],
    [
        "Neem contact op met haar als je vragen hebt." =>
          "Contact her if you have any questions."
    ],
    [
        "Ik ben gisteren in de rivier gaan vissen." =>
          "I went fishing in the river yesterday."
    ],
    [ "Daar heb ik niet aan gedacht." => "I didn't think of that." ],
    [
        "Het spijt me, ik ben vergeten mijn huiswerk te doen." =>
          "I'm sorry, I forgot to do my homework."
    ],
    [ "Ik zag een vliegtuig." => "I saw a plane." ],
    [ "Ik zag een vliegtuig." => "I saw an airplane." ],
    [
        "Ze stond op om de telefoon op te nemen." =>
          "She stood up to answer the phone."
    ],
    [ "Kijk me aan." => "Look at me." ],
    [
        "Neem iets te eten als je honger hebt." =>
          "If you’re hungry, have something to eat."
    ],
    [ "Ik ben opgegroeid in het land."  => "I grew up in the country." ],
    [ "Zo gezegd, zo gedaan."           => "No sooner said than done." ],
    [ "Zo gezegd, zo gedaan."           => "It's as good as done." ],
    [ "Komt u binnen, de deur is open." => "Come in, the door's open." ],
    [
        "Dat zou ik nooit gedacht hebben." => "I would never have guessed that."
    ],
    [
        "Hij heeft zijn ouders gelukkig gemaakt." =>
          "He made his parents happy."
    ],
    [ "Zou u even kunnen wachten?" => "Would you mind waiting a few minutes?" ],
    [ "De meeste mensen denken dat."   => "Most people think so." ],
    [ "Ik denk dat hij onschuldig is." => "I believe him to be innocent." ],
    [ "Ik denk dat hij onschuldig is." => "I believe that he is innocent." ],
    [ "Ze waren moe van het wachten."  => "They were tired of waiting." ],
    [ "Hij kan zoiets zeggen."         => "He can say such things." ],
    [
        "Het is heel leuk Esperanto te leren." =>
          "It's really fun to learn Esperanto."
    ],
    [ "Hij is erg bang van honden." => "He is very afraid of dogs." ],
    [
        "Ik werk alle dagen van negen tot vijf." =>
          "I work from nine to five every day."
    ],
    [
        "Ze zijn vast op je aan het wachten." => "They must be waiting for you."
    ],
    [
        "Wat ik ben, heb ik te danken aan mijn moeder." =>
          "All I am I owe to my mother."
    ],
    [
        "Wat ik ben, heb ik te danken aan mijn moeder." =>
          "I am who I am thanks to my mother"
    ],
    [ "We moeten bij het vliegveld zijn." => "We need to get to the airport." ],
    [ "Ik houd altijd mijn woord."        => "I always keep my word." ],
    [ "Ik twijfel er niet aan."           => "I have no doubt about it." ],
    [ "Waar heb je dat geleerd?"          => "Where did you learn this?" ],
    [ "Waar heb je dat geleerd?"          => "Where did you learn that?" ],
    [ "Ze hadden geen eten."              => "They had no food." ],
    [
        "Ik ken de geschiedenis van Europa heel goed." =>
          "I know the history of Europe very well."
    ],
    [
        "Heb je iemand gezien in de winkel?" =>
          "Did you see anyone at the mall?"
    ],
    [
        "Mag ik alstublieft een glas water?" =>
          "Please give me a glass of water."
    ],
    [
        "Mijn broer is ziek sinds gisteren." =>
          "My brother has been sick since yesterday."
    ],
    [ "Mag ik alstublieft een glas water?" => "A glass of water, please." ],
    [ "Het is een geschenk voor u."        => "This gift is for you." ],
    [ "Morgen is het haar verjaardag."     => "Tomorrow is her birthday." ],
    [ "Ik heb nog steeds honger."          => "I'm still hungry." ],
    [
        "Hij geeft haar alles waar zij om vraagt." =>
          "He gives her everything she asks for."
    ],
    [ "Zij is zeer mooi."                => "She's very beautiful." ],
    [ "Ge zijt mijn vriend."             => "You are my friend." ],
    [ "Zij heeft weinig vrienden."       => "She doesn't have many friends." ],
    [ "Laten we beginnen met die vraag." => "Let's begin with that question." ],
    [ "Hij heeft een paraplu nodig."     => "He needs an umbrella." ],
    [
        "Ik geloof dat hij te vertrouwen is." =>
          "I believe that he's trustworthy."
    ],
    [ "Dit is een boek over Engeland." => "This is a book about England." ],
    [ "Geld maakt niet gelukkig."      => "Money doesn't buy happiness." ],
    [ "Dit boek was gemakkelijk."      => "This book was easy." ],
    [ "Wat maakte haar zo kwaad?"      => "What made her so angry?" ],
    [ "Ik heb mijn sleutel verloren."  => "I have lost my key." ],
    [ "Ik heb mijn sleutel verloren."  => "I lost my key." ],
    [
        "Wees niet bang om fouten te maken als je Engels spreekt." =>
          "Don't be afraid of making mistakes when speaking English."
    ],
    [ "Er is bijna geen wijn meer." => "There is little wine left." ],
    [ "Ik neem je mee."             => "I'll give you a ride." ],
    [
        "Er is een erg oude tempel in de stad." =>
          "There is a very old temple in the town."
    ],
    [
        "Dat is al wat ik op dit ogenblik kan zeggen." =>
          "That's all I can say at the moment."
    ],
    [ "Gisteren was het mijn verjaardag." => "Yesterday was my birthday." ],
    [ "Het was zijn eigen schuld."        => "It was his own fault." ],
    [ "Dit boek was erg interessant." => "This book was very interesting." ],
    [
        "Ik ben blij dat ik kon u helpen vorige week." =>
          "I'm glad I was able to help you last week."
    ],
    [
        "Na het eten vroeg ik om de rekening." =>
          "After the meal, I asked for the bill."
    ],
    [
        "Ik ken het meisje dat tennis speelt." =>
          "I know the girl playing tennis."
    ],
    [
        "Ik ken het meisje dat tennis speelt." =>
          "I know the girl who is playing tennis."
    ],
    [
        "Mijn vader kwam gisteravond laat thuis." =>
          "My father got home late last night."
    ],
    [ "Hij zat bij de rivier." => "He sat next to the stream." ],
    [ "Kan ik u helpen?"       => "Can I help you?" ],
    [ "Wie schreef dit boek?"  => "Who wrote this book?" ],
    [ "Kan ik u helpen?"       => "May I help you?" ],
    [
        "Ik heb geen flauw idee waarom het zo is." =>
          "I haven't the foggiest why it is so."
    ],
    [ "Hoe is het weer in New York?" => "How's the weather in New York?" ],
    [
        "Ik wou dat ze hier deze avond kwam." =>
          "I wanted her to come here this evening."
    ],
    [ "Mijn zus heeft een baan." => "My sister has a job." ],
    [ "Het plan zal werken."     => "The plan will work out." ],
    [ "Misschien was hij ziek."  => "He may have been ill." ],
    [ "Hij was misschien ziek."  => "He may have been ill." ],
    [ "Misschien was hij ziek."  => "Maybe he was ill." ],
    [
        "Mijn vader gaat niet altijd lopend naar het werk." =>
          "My father does not always walk to work."
    ],
    [
        "Ik lees dit soort boek niet vaak." =>
          "I don't read this kind of book much."
    ],
    [
        "Ik bleef thuis omdat ik ziek was." =>
          "I stayed at home because I was sick."
    ],
    [ "Zij kan tien talen spreken."  => "She is able to speak ten languages." ],
    [ "De trein kwam aan in Londen." => "The train arrived in London." ],
    [ "Ben je kwaad?"                => "Are you mad?" ],
    [
        "Ik heb een vriend wiens vader leraar is." =>
          "I have a friend whose father is a teacher."
    ],
    [
        "Je kan hem net zo goed niks over haar vertellen." =>
          "You may as well tell him nothing about her."
    ],
    [
        "Het is het eind van de wereld zoals we die kennen." =>
          "This is the end of the world as we know it."
    ],
    [
        "Deze berg is het hele jaar door bedekt met sneeuw." =>
          "This mountain is covered in snow all-year-round."
    ],
    [
        "Deze berg is het hele jaar door bedekt met sneeuw." =>
          "This mountain is covered with snow all year round."
    ],
    [
        "Deze berg is het hele jaar door bedekt met sneeuw." =>
          "This mountain is snow-covered the entire year."
    ],
    [
        "Deze berg is het hele jaar door bedekt met sneeuw." =>
          "This mountain is covered in snow all year round."
    ],
    [ "Ik heb een groot gezin."       => "I have a large family." ],
    [ "Zij is mijn oudere zus."       => "She is my elder sister." ],
    [ "Ik hou van ze allebei."        => "I like each of them." ],
    [ "Gaat u zitten."                => "Please take a seat." ],
    [ "Ik ben mijn sleutel verloren." => "I lost my key." ],
    [
        "Ik dacht net aan een nieuwe baan." =>
          "I was just thinking of a new job."
    ],
    [
        "Neem contact op met haar als u vragen hebt." =>
          "Contact her if you have any questions."
    ],
    [
        "Als ik geld had, kon ik het kopen." =>
          "If I had money, I could buy it."
    ],
    [ "Ben je geïnteresseerd in muziek?" => "Are you interested in music?" ],
    [ "Mag ik uw krant even zien?" => "Can I have a look at your newspaper?" ],
    [ "Ze deed alsof ze me niet hoorde." => "She pretended not to hear me." ],
    [ "Hij ging op reis naar Amerika."   => "He went on a voyage to America." ],
    [ "Ik zal boos worden."              => "I will become angry." ],
    [
        "Dat klinkt te mooi om waar te zijn." =>
          "That sounds too good to be true."
    ],
    [
        "Niet alles is voor geld te koop." =>
          "Not everything can be bought with money."
    ],
    [
        "Er is een groot verschil tussen een theorie en een idee." =>
          "There's a great difference between a theory and an idea."
    ],
    [ "Dank je, dat is alles." => "Thanks, that's all." ],
    [ "Dank je, dat is alles." => "Thanks, that's everything." ],
    [
        "Een hond rende achter een kat aan." => "A dog was running after a cat."
    ],
    [
        "Ik wilde net een brief schrijven, toen hij thuis kwam." =>
          "I was just going to write a letter when he came home."
    ],
    [
        "Ik denk dat ze ouder dan veertig is." =>
          "I think she is over forty years old."
    ],
    [ "Ga onmiddellijk naar de dokter!"   => "Go to the doctor at once!" ],
    [ "Ben je al eens in Parijs geweest?" => "Have you ever been to Paris?" ],
    [
        "In de winter wordt het vroeg donker." =>
          "The night falls fast in winter."
    ],
    [ "Waarom ben je gestopt?" => "Why did you stop?" ],
    [
        "Ze zei hem uit de buurt te blijven van slechte vrienden." =>
          "She told him to keep away from bad friends."
    ],
    [ "Vandaag is er geen les."          => "There's no class today." ],
    [ "Ik ben geïnteresseerd in muziek." => "I'm interested in music." ],
    [ "Ik geef toe, ik had het mis."     => "I admit it. I was wrong." ],
    [ "De deur is dicht."                => "The door is closed." ],
    [ "Ik heb het je dikwijls gezegd."   => "I've told you many times." ],
    [ "Veel kinderen, veel handen."      => "More kids, more hands." ],
    [ "Dat is best goed."                => "That's pretty good." ],
    [
        "Hij heeft hen lange tijd niet geschreven." =>
          "He hasn't written to them in a long time."
    ],
    [ "Hoe wilt ge uw koffie?" => "How would you like your coffee?" ],
    [ "Jij maakt me gelukkig." => "You make me happy." ],
    [
        "Iedereen in mijn gezin staat vroeg op." =>
          "Everyone in my family gets up early."
    ],
    [
        "Ik studeer het al vijf jaar." =>
          "I have been studying it for five years."
    ],
    [
        "Ik snap niet waar ik de fout in ging." =>
          "I don't understand where I went wrong."
    ],
    [ "Ze gaf hem zijn jas." => "She handed him his jacket." ],
    [
        "Onze kinderen houden van houden, maar ik hou meer van katten." =>
          "Our children like dogs, but I prefer cats."
    ],
    [ "Wat denk jij over deze zaak?" => "How do you view this matter?" ],
    [
        "Ik zal morgen een brief schrijven." =>
          "I am going to write a letter tomorrow."
    ],
    [ "Je hoeft daar niet heen te gaan." => "You don't need to go there." ],
    [
        "Als ik ze bel, neemt er niemand op." =>
          "When I phone them nobody answers."
    ],
    [
        "Ge kunt hetzelfde om het even waar vinden." =>
          "You can find the same thing anywhere."
    ],
    [
        "Ik heb niet minder dan vier broers." =>
          "I have no less than four brothers."
    ],
    [ "Je werkt te hard."            => "You work too hard." ],
    [ "Hij gaat je helpen."          => "He is going to help you." ],
    [ "Wat heb je in je zak?"        => "What have you got in your bag?" ],
    [ "Een kind heeft liefde nodig." => "A child needs love." ],
    [
        "Dat is het woordenboek dat ik alle dagen gebruik." =>
          "This is the dictionary I use every day."
    ],
    [ "Hij is hier gekomen om mij te helpen." => "He came here to help me." ],
    [ "Dat hoor ik graag."                    => "I'm glad to hear that." ],
    [ "Waar is de baas?"                      => "Where's the boss?" ],
    [ "Ze horen bij mij."                     => "They're with me." ],
    [ "Hoe ver is het naar het vliegveld?" => "How far is it to the airport?" ],
    [ "Hoe ver is het naar het vliegveld?" => "How far away is the airport?" ],
    [ "Loopt je horloge goed?"             => "Is your watch correct?" ],
    [
        "Zijn naam is bij iedereen in deze stad bekend." =>
          "His name is known to everyone in this town."
    ],
    [
        "Sinds die dag zal hij me nooit meer groeten." =>
          "From that day on, he'll never say hello to me again."
    ],
    [ "Er zijn een aantal problemen." => "There are a few problems." ],
    [ "Ik wil een boek schrijven."    => "I want to write a book." ],
    [
        "Ze was niet aanwezig school omdat ze ziek was." =>
          "She was absent from school because she was sick."
    ],
    [ "Dus je kan me niet helpen?" => "So you can't help me?" ],
    [
        "Mijn zus liet me een nieuw horloge zien." =>
          "My sister showed a new watch to me."
    ],
    [ "Ben je van plan die auto te kopen?" => "Do you plan to buy that car?" ],
    [
        "Ik zal je aan mijn moeder voorstellen." =>
          "Let me introduce my mother to you."
    ],
    [
        "Ik denk dat zijn leven gevaar loopt." =>
          "I think his life is in danger."
    ],
    [
        "Ik weet niet wanneer hij terug is gekomen uit Frankrijk." =>
          "I don't know when he returned from France."
    ],
    [
        "Ik weet niet wanneer hij terug is gekomen uit Frankrijk." =>
          "I don't know when he got back from France."
    ],
    [
        "Heb je de krant van vandaag al gelezen?" =>
          "Have you read today's paper yet?"
    ],
    [ "Ik eet omdat ik honger heb." => "I eat because I'm hungry." ],
    [ "Morgen is het zondag."       => "It is Sunday tomorrow." ],
    [ "Morgen is het zondag."       => "Tomorrow is Sunday." ],
    [
        "Ik heb twee keer zoveel boeken gelezen als hij." =>
          "I have read twice as many books as he has."
    ],
    [
        "Zij heeft me gezegd het raam open te doen." =>
          "She told me to open the window."
    ],
    [
        "Ik twijfel aan de waarheid van dit verhaal." =>
          "I doubt the truth of his story."
    ],
    [
        "Ik heb gisteren net zo'n pen gekocht als jij hebt." =>
          "I bought a pen like yours yesterday."
    ],
    [
        "Ga zeker onmiddellijk naar daar." =>
          "It is necessary for you to go there immediately."
    ],
    [ "Ze dacht aan geen kwaad." => "She thought no harm." ],
    [
        "Hij speelt beter piano dan ik." =>
          "He's better at the piano than I am."
    ],
    [ "Dat is een ander probleem." => "That is another matter." ],
    [ "Het gaat vrij koud worden." => "It is going to be quite cold." ],
    [
        "Ik heb iets nodig om mee te schrijven." =>
          "I need something to write with."
    ],
    [ "Waarom doe je je jas niet uit?" => "Why don't you take off your coat?" ],
    [ "Dit is het geval."              => "This is the case." ],
    [
        "Deze morgen was er een aardbeving." =>
          "There was an earthquake this morning."
    ],
    [ "Ik hou ook van deze kleur." => "I like this color as well." ],
    [
        "Ik wil dat het werk vlug gedaan is." => "I want the work done quickly."
    ],
    [
        "Kan je er ook één voor mij kopen?" =>
          "Can you buy one for me as well?"
    ],
    [
        "Als je goed kijkt, zie je niks." =>
          "If you look closely, you don't see anything."
    ],
    [ "Het regende gisteren de hele dag." => "It rained all day yesterday." ],
    [ "Hij maakte haar een nieuwe jas."   => "He made her a new coat." ],
    [ "Hij was een goede koning."         => "He was a good king." ],
    [ "Je mag me geloven."                => "You can believe me." ],
    [
        "Het spijt me dat ik je niet eerder kon schrijven." =>
          "I'm sorry I couldn't write to you sooner."
    ],
    [ "Hoe groot is uw familie?"    => "How large is your family?" ],
    [ "Wie houdt van oorlog?"       => "Who loves war?" ],
    [ "Ze is tevreden met de jurk." => "She is pleased with the dress." ],
    [ "Ik ga er alleen heen."       => "I'm going there alone." ],
    [
        "Het was dom van hem om zoiets te doen." =>
          "It was foolish of him to do such a thing."
    ],
    [
        "Dit is het leven dat ik gekozen heb." =>
          "This is the life that I chose."
    ],
    [ "Ik ben liever arm dan rijk." => "I'd rather be poor than rich." ],
    [ "Ik heb uw vriend ontmoet."   => "I met your friend." ],
    [
        "Zag je de hond niet door de tuin lopen?" =>
          "Didn't you see a dog pass through the yard?"
    ],
    [ "Ik wil naar Londen gaan."        => "I want to go to London." ],
    [ "Deze hoed is te klein voor jou." => "This hat's too small for you." ],
    [
        "Wanneer te beginnen is het grootste probleem." =>
          "When to start is the main problem."
    ],
    [
        "Dat jongetje lijkt op zijn vader." =>
          "That boy takes after his father."
    ],
    [ "Hij werkt acht uur per dag." => "He works eight hours every day." ],
    [ "Hoe heet deze straat?" => "What's the name of this street, please?" ],
    [ "Hoe heet deze straat?" => "What's this street called?" ],
    [ "Hoe heet deze straat?" => "What is the name of this street?" ],
    [
        "Je kunt water drinken, maar dat kun je ook laten." =>
          "You can drink water, but you can also let it be."
    ],
    [ "Hoe zou ik je gaan noemen?"      => "What should I call you?" ],
    [ "Twintig jaar is een lange tijd." => "Twenty years is a long time." ],
    [
        "Niet alle boeken zijn het waard om te lezen." =>
          "Not all the books are worth reading."
    ],
    [ "Wat eten we vanavond?" => "What do we eat tonight?" ],
    [ "De man heeft gelijk."  => "The man is right." ],
    [ "Wat heb je besloten?"  => "What have you decided?" ],
    [
        "De boeken van deze student zijn nieuw." =>
          "This student's books are new."
    ],
    [
        "Ik heb nog steeds niet gevonden wat ik zoek." =>
          "Still I haven't found what I'm looking for."
    ],
    [
        "Wat ben je van plan voor het weekend?" =>
          "What are your weekend plans?"
    ],
    [
        "Wat ben je van plan voor het weekend?" =>
          "What're your plans for the weekend?"
    ],
    [ "Het doet geen pijn."  => "It doesn't hurt." ],
    [ "Ik ben in gevaar."    => "I'm in danger." ],
    [ "Wie heeft er honger?" => "Who's hungry?" ],
    [
        "Hij antwoordde dat hij het niet wist." =>
          "He replied that he did not know."
    ],
    [ "Ge hebt veel fouten gemaakt."     => "You have made many mistakes." ],
    [ "Kan ik iets te eten krijgen?"     => "Can I have something to eat?" ],
    [ "Ik heb een vriend in Engeland."   => "I have a friend in England." ],
    [ "Ik heb goed advies nodig."        => "I need some good advice." ],
    [ "Oude mensen worden vroeg wakker." => "Old people wake up early." ],
    [
        "Nu we het toch over vreemde talen hebben, spreken jullie Frans?" =>
          "Speaking of foreign languages, do you speak French?"
    ],
    [
        "Ik heb het liever dat je niet zo veel rookt." =>
          "I'd rather you didn't smoke so much."
    ],
    [
        "Hij is niet meer dezelfde man als vroeger." =>
          "He's not the same man he used to be."
    ],
    [
        "Lang geleden was hier een brug." =>
          "A long time ago, there was a bridge here."
    ],
    [
        "Lang geleden was hier een brug." =>
          "A long time ago there was a bridge here."
    ],
    [ "Ik moet je verlaten."         => "I have to leave you." ],
    [ "Hij moet onmiddellijk komen." => "He should come right away!" ],
    [
        "Welke heb je liever, thee of koffie?" =>
          "Which do you prefer, tea or coffee?"
    ],
    [ "Ken jij zijn oudere broer?"        => "Do you know his older brother?" ],
    [ "De regen ging over in sneeuw."     => "The rain changed into snow." ],
    [ "Ben je tevreden?"                  => "Are you happy?" ],
    [ "Geef het mij, alstublieft."        => "Give it to me, please." ],
    [ "Waar gaat ge naartoe?"             => "Where are you going?" ],
    [ "Ik wens haar een goede nacht."     => "I wish her a good night." ],
    [ "Maak u maar geen zorgen over mij." => "Don't worry about me." ],
    [
        "Heb je iemand verteld wat je echte naam is?" =>
          "Have you told anyone what your real name is?"
    ],
    [ "Maak je geen zorgen om mijn hond." => "Don't worry about my dog." ],
    [
        "Ze denkt ze heeft altijd gelijk." =>
          "She thinks that she's always right."
    ],
    [ "Wat denkt u van oorlog?"   => "What do you think of war?" ],
    [ "Ga buiten, of kom binnen." => "Get out or come in." ],
    [ "Gisteren was het zondag."  => "It was Sunday yesterday." ],
    [ "Gisteren was het zondag."  => "Yesterday was Sunday." ],
    [ "We kennen elkaar al."      => "We already know each other." ],
    [
        "Lezen in een donkere kamer is niet goed." =>
          "It's not good to read in a dark room."
    ],
    [ "Hij gaat zelden naar de kerk." => "He seldom goes to church." ],
    [
        "Zeg wat je wilt, maar ik doe toch mijn eigen zin!" =>
          "Whatever you say, I'll do it my way."
    ],
    [
        "Ze is vaak te laat op school op maandag." =>
          "She is often late for school on Mondays."
    ],
    [ "Je kan hier niet zwemmen." => "You cannot swim here." ],
    [
        "Ik was gedwongen te stoppen met het plan." =>
          "I was forced to abandon the plan."
    ],
    [ "Wie maakt zich daar druk over?" => "Who cares about that?" ],
    [ "De hond is wit."                => "The dog is white." ],
    [
        "Heeft u de krant van vandaag al gelezen?" =>
          "Have you read today's paper yet?"
    ],
    [ "Ik denk dat ik gek word." => "I think I'm going crazy." ],
    [
        "Er was een klein beetje melk over in de fles." =>
          "There was a little milk left in the bottle."
    ],
    [ "Ik ben kleiner dan jij." => "I am shorter than you." ],
    [
        "Maak je geen zorgen, ik ga alleen." =>
          "Don't worry about it, I'll go myself."
    ],
    [
        "Naar men zegt, zou zijn vader in het buitenland overleden zijn." =>
          "It is said that his father died in a foreign country."
    ],
    [ "Ik heb een mes nodig."       => "I need a knife." ],
    [ "Meer kinderen, meer handen." => "More kids, more hands." ],
    [ "Ik ben rijst aan het eten."  => "I am eating rice." ],
    [ "We hebben je advies nodig."  => "We do need your advice." ],
    [
        "Ze zei mij dat ze een CD gekocht had." =>
          "She told me that she had bought a CD."
    ],
    [
        "Voor zover ik weet bestaat zo'n woord niet." =>
          "As far as I know, there is no such word."
    ],
    [
        "Ik heb dit boek voor mijzelf gekocht, niet voor mijn vrouw." =>
          "I bought the book for myself, not for my wife."
    ],
    [ "Ik zal jullie nooit verlaten." => "I'll never leave you." ],
    [
        "De één zijn dood is de ander zijn brood." =>
          "One man's meat is another man's poison."
    ],
    [ "Waar hebt ge pijn?"             => "Where do you have pain?" ],
    [ "Deze dag is zondag."            => "This day is Sunday." ],
    [ "Er ligt één appel op de tafel." => "There is one apple on the desk." ],
    [
        "Eet je soep voor hij koud wordt." =>
          "Eat your soup before it gets cold."
    ],
    [
        "Nog één stap en je bent dood." =>
          "One more step, and you'll be a dead man."
    ],
    [
        "Ik moest de hele dag in bed blijven." =>
          "I had to stay in bed all day."
    ],
    [
        "Ze zeggen dat hij in Duitsland geboren is." =>
          "They say that he was born in Germany."
    ],
    [
        "Ik zou heel graag een koud glas bier willen hebben." =>
          "I would love a cold glass of beer."
    ],
    [
        "Ik denk dat al een keer naar Boston bent geweest." =>
          "I guess you've been to Boston before."
    ],
    [ "Hoe lang is die brug?" => "How long is that bridge?" ],
    [
        "Hij heeft geluk zo'n goede vrouw te hebben." =>
          "He is fortunate having such a good wife."
    ],
    [
        "Doe haar de groeten als je haar ziet op het feest." =>
          "Please say hello to her if you see her at the party."
    ],
    [
        "Welke is groter, de zon of de aarde?" =>
          "Which is larger, the sun or the Earth?"
    ],
    [ "Zijn zij Japans of Chinees?" => "Are they Japanese or Chinese?" ],
    [ "Hij was in Frankrijk."       => "He was in France." ],
    [
        "Wees niet bang om fouten te maken wanneer je Engels spreekt." =>
          "Don't be afraid to make mistakes when speaking English."
    ],
    [
        "Ze heeft het boek van hem geleend." =>
          "She borrowed the book from him."
    ],
    [ "Ze doet de deur dicht." => "She closes the door." ],
    [ "Waar gaan we naartoe?"  => "Where are we going?" ],
    [
        "Je hoeft het niet aan je ouders te vertellen." =>
          "You mustn't tell that to your parents."
    ],
    [
        "Ik ben gelukkig met mijn vriendin." => "I am happy with my girlfriend."
    ],
    [
        "Maar zat hij naast je in het vliegtuig?" =>
          "But was he sitting next to you on the plane?"
    ],
    [ "Doe wat hij je vraagt." => "Do what he tells you." ],
    [
        "Ik vind het jammer dat ik je niet kan helpen." =>
          "I regret that I can't help you."
    ],
    [ "Hoe lang blijf je hier?" => "How long will you stay here?" ],
    [
        "Ik ga morgen een brief schrijven." =>
          "I am going to write a letter tomorrow."
    ],
    [ "Mijn vader leeft op de buiten." => "My father lives in the country." ],
    [
        "We zouden hier beter niet langer blijven." =>
          "We had better not remain here any longer."
    ],
    [ "Het gaat mij slecht."    => "I'm not well." ],
    [ "Ik heb uw advies nodig." => "I need your advice." ],
    [
        "Hoeveel dagen ben je van plan om te blijven?" =>
          "How many days do you plan to stay?"
    ],
    [
        "Ze heeft het ziekenhuis een uur geleden verlaten." =>
          "She left the hospital an hour ago."
    ],
    [ "Ze wonen in de buurt."                   => "They live nearby." ],
    [ "Ze wonen daar."                          => "They live there." ],
    [ "Ik ben nooit in het buitenland geweest." => "I've never been abroad." ],
    [
        "Ik ben nooit in het buitenland geweest." => "I have never been abroad."
    ],
    [
        "Het is vandaag warmer dan gisteren." =>
          "It is warmer today than yesterday."
    ],
    [
        "Ik had nooit gedacht dat ik zelf deze fout zou maken." =>
          "I never thought I'd make this mistake myself."
    ],
    [
        "Het enige wat jullie kunnen doen, is elkaar vertrouwen." =>
          "All you can do is trust one another."
    ],
    [ "De school begint om negen uur."    => "School begins at nine." ],
    [ "De school begint om negen uur."    => "School begins at 9." ],
    [ "De school begint om negen uur."    => "School starts at nine." ],
    [ "Ik maak me daar geen zorgen over." => "I am not worried about it." ],
    [ "Kijk naar hem en doe hetzelfde." => "Watch him and do the same thing." ],
    [ "Je moet hard leren."             => "You must study hard." ],
    [
        "New York is de grootste stad van de wereld." =>
          "New York is the biggest city in the world."
    ],
    [ "Ik nam een foto van mijn familie." => "I took a picture of my family." ],
    [ "Ik heb dit boek van hem geleend."  => "I borrowed this book from him." ],
    [ "Zeg hem het antwoord niet."        => "Don't tell him the answer." ],
    [ "Ik ben het niet vergeten."         => "I haven't forgotten." ],
    [ "Ze heeft zo'n mooie ogen."         => "She's got such lovely eyes." ],
    [
        "We gingen naar het park om te spelen." =>
          "We went to the park to play."
    ],
    [
        "Zit de kat op of onder de stoel?" =>
          "Is the cat on the chair or under the chair?"
    ],
    [
        "Ik hoop dat hij geen ongeluk heeft gehad." =>
          "I hope he hasn't had an accident."
    ],
    [ "Ze heeft hem een fototoestel gekocht." => "She bought him a camera." ],
    [ "Ik was op vakantie in het buitenland." => "I was abroad on vacation." ],
    [ "Verwacht niet te veel van hem." => "Don't expect too much of him." ],
    [ "Er ligt sneeuw op de berg."     => "There is snow on the mountain." ],
    [
        "Het leven gaat niet altijd over rozen." =>
          "In life there are ups and downs."
    ],
    [ "Het leven gaat niet altijd over rozen." => "Life ain't easy." ],
    [ "Het leven gaat niet altijd over rozen." => "Life is no bed of roses." ],
    [ "Het leven gaat niet altijd over rozen." => "Life isn't easy." ],
    [
        "Jij moet weten of je het koopt of niet." =>
          "It is up to you whether to buy it or not."
    ],
    [
        "Vroeg of laat zal hij me alles vertellen." =>
          "He will tell me everything sooner or later."
    ],
    [ "Ik heb Ken gisteren ontmoet." => "I met Ken yesterday." ],
    [ "Mijn hond is wit."            => "My dog is white." ],
    [ "Hij is altijd bezig."         => "He's always busy." ],
    [
        "Ik ontmoette hem drie jaar geleden voor het eerst." =>
          "I first met him three years ago."
    ],
    [
        "Het was liefde op het eerste gezicht." => "It was love at first sight."
    ],
    [ "Dit huis is niet te koop." => "This house is not for sale." ],
    [
        "Je moet het niet meteen doen." =>
          "You don't need to do that right away."
    ],
    [ "Hij is vandaag erg aardig." => "He is being very kind today." ],
    [ "Ik ben mijn vertrouwen in hem verloren." => "I lost my trust in him." ],
    [ "Voel je je ziek?"                        => "Do you feel sick?" ],
    [ "Het werk kan wachten."                   => "The work can wait." ],
    [ "Ik wil iemand om mee te praten." => "I want someone to talk to." ],
    [ "Kom hier, meisje, ga zitten!" => "Come here, little girl, sit down!" ],
    [
        "Wat hebt ge nog meer op zak?" =>
          "What else do you have in your pocket?"
    ],
    [ "Is er ergens een telefoon?" => "Is there a telephone anywhere?" ],
    [ "Ik ben zo sterk als gij."   => "I am as strong as you." ],
    [
        "Wat heb je met mijn bagage gedaan?" =>
          "What did you do with my baggage?"
    ],
    [
        "Ik groeide op in de buurt van een rivier." => "I grew up near a river."
    ],
    [
        "Ik word de god van de nieuwe wereld." =>
          "I am the god of the new world."
    ],
    [ "Dit huis is beroemd."      => "This house is famous." ],
    [ "Hij wilde geen oorlog."    => "He did not want war." ],
    [ "Hij werd heel gevaarlijk." => "He became very dangerous." ],
    [
        "Ik moet ergens een fout gemaakt hebben." =>
          "I must have made a mistake somewhere."
    ],
    [
        "Ik vind mijn Japans erg slecht." =>
          "I think my Japanese is really bad."
    ],
    [ "Wij houden van onze kinderen." => "We love our children." ],
    [ "Mijn oom is boos."             => "My uncle is angry." ],
    [ "Hebt ge het boek al gelezen?"  => "Have you already read this book?" ],
    [
        "Er zijn hier geen huizen in de buurt." =>
          "There are no houses around here."
    ],
    [ "Neem de telefoon op, alsjeblieft." => "Answer the phone, please." ],
    [ "Ze had witte schoenen aan."        => "She had white shoes on." ],
    [ "Ik heb het boek gelezen."          => "I have read the book." ],
    [
        "Er is niets nieuws onder de zon." =>
          "There is nothing new under the sun."
    ],
    [
        "Geef me iets koud om te drinken." => "Give me something cold to drink."
    ],
    [ "Doe uw schoenen uit, alstublieft." => "Please take off your shoes." ],
    [ "Met een beetje meer moeite."       => "With a little more effort." ],
    [
        "Ik ben opgegroeid in de buurt van een rivier." =>
          "I grew up near a river."
    ],
    [ "Men kan altijd wel tijd vinden." => "One can always find time." ],
    [ "Hier mag je niet stil zijn."   => "It's not allowed to be quiet here." ],
    [ "Is er ruimte voor nog iemand?" => "Is there space for another person?" ],
    [
        "Mijn vader gaat soms naar het buitenland." =>
          "My father sometimes goes abroad."
    ],
    [ "Mijn vader is bezig."    => "My father is busy." ],
    [ "Een meisje belde me op." => "A girl phoned me." ],
    [
        "Hij wist van het nieuws, maar hij hield het voor zichzelf." =>
          "He knew the news, but he kept it to himself."
    ],
    [ "Ik versta niet wat ze zei."      => "I can't make out what she said." ],
    [ "Mijn broer kan zeer snel lopen." => "My brother can run very fast." ],
    [ "ik vind de koude niet erg."      => "I don't mind the cold." ],
    [
        "Ik heb nooit meer iets van hem gehoord." =>
          "I never heard from him again."
    ],
    [
        "Ze vertelde mij wat ze in Australië gezien had." =>
          "She told me about what she saw in Australia."
    ],
    [ "Hier komt nooit een eind aan." => "This is never going to end." ],
    [
        "Hij heeft meer boeken dan alle anderen samen." =>
          "He's got more books than all the others put together."
    ],
    [ "Er sterven elke dag goede mensen." => "Good people die every day." ],
    [ "Mijn tante heeft drie kinderen."   => "My aunt has three children." ],
    [
        "Ik ben heel blij dat ik uit de middelbare school ben." =>
          "I am very glad to be out of high school."
    ],
    [
        "Je kunt beter wachten tot de politie komt." =>
          "You had better wait until the police come."
    ],
    [ "Wat doe je in je vrije tijd?" => "What do you do in your free time?" ],
    [ "Zo! Gij zijt haar broer!"     => "So you're her brother!" ],
    [
        "De brug is heel lang en heel hoog." =>
          "The bridge is very long and very tall."
    ],
    [
        "Ik hou meer van rijst dan van brood." => "I like rice more than bread."
    ],
    [
        "Ik hou meer van rijst dan van brood." =>
          "I like rice more than I like bread."
    ],
    [
        "Iedereen was geïnteresseerd in het verhaal." =>
          "Everybody was interested in the story."
    ],
    [ "Hij is bang voor de zee."           => "He's afraid of the sea." ],
    [ "Dat is drie dagen geleden gebeurd." => "That happened three days ago." ],
    [ "Ik kan het me niet voorstellen."    => "I cannot imagine it." ],
    [
        "Bij ons op school zijn er meer meisjes dan jongens." =>
          "There are more girls than boys at our school."
    ],
    [ "Wat kocht ze in die winkel?" => "What did she buy at that store?" ],
    [
        "Ik heb iemand nodig die mij begrijpt." =>
          "I need someone to understand me."
    ],
    [
        "Ik was beschaamd om in oude kleren uit te gaan." =>
          "I was ashamed to go out in old clothes."
    ],
    [
        "Dit is het ziekenhuis waarin ik ben geboren." =>
          "This is the hospital which I was born in."
    ],
    [
        "Ik vraag me af of hij vannacht zal komen?" =>
          "I wonder if he'll come tonight."
    ],
    [ "Iedereen wil gelukkig zijn."      => "Everybody wants to be happy." ],
    [ "Vraag alsjeblieft iemand anders." => "Please ask someone else." ],
    [
        "Ik zal het nooit aan iemand vertellen." =>
          "I shall never tell it to anybody."
    ],
    [ "Thuis blijven is niet leuk." => "Staying home isn't fun." ],
    [ "Ik geloof niet in God."      => "I don't believe in God." ],
    [
        "Ik zal jullie wat foto's laten zien." =>
          "I will show you some pictures."
    ],
    [
        "Het was een koude zomer dit jaar." =>
          "It was cold in the summer of this year."
    ],
    [ "Moeder doet nu aan tennis." => "Mother is now involved in tennis." ],
    [
        "Waarom moest hij zo lang op jou wachten?" =>
          "Why did he have to wait for you for so long?"
    ],
    [ "Blij u te leren kennen, Ken." => "Nice to meet you, Ken." ],
    [
        "Hij kwam laat in de avond thuis." =>
          "He came home late in the evening."
    ],
    [
        "Hij ging zitten om een roman te lezen." =>
          "He sat down to read a novel."
    ],
    [
        "Ik heb iemand nodig om me te begrijpen." =>
          "I need someone to understand me."
    ],
    [ "Waar zullen we vanavond eten?" => "Where shall we eat tonight?" ],
    [ "Ik ben kleiner dan jullie."    => "I am shorter than you." ],
    [ "Hij las verder in het boek."   => "He continued reading the book." ],
    [
        "Ik wil je niet tot last zijn met mijn problemen." =>
          "I don't want to burden you with my problems."
    ],
    [ "Ge moet uw best doen."  => "You must do your best." ],
    [ "Ik ken geen van beide." => "I know neither of them." ],
    [
        "De trein kwam op tijd aan in Kyoto." =>
          "The train arrived in Kyoto on time."
    ],
    [
        "De trein kwam op tijd aan in Kyoto." =>
          "The train arrived on time to Kioto."
    ],
    [ "Hij is de auto aan het wassen." => "He is washing the car." ],
    [
        "Onze school is heel dicht bij het park." =>
          "Our school is very close to the park."
    ],
    [ "Mijn moeder heeft vier broers." => "My mother has four brothers." ],
    [
        "Niet iedereen geloofde dat dit een goed plan was." =>
          "Not everyone believed this plan was a good one."
    ],
    [
        "We hebben dezelfde problemen als jij." =>
          "We have the same problems as you."
    ],
    [ "Waar doet het pijn?" => "Where does it hurt?" ],
    [
        "Weten is één ding, het ook doen is heel wat anders." =>
          "To know is one thing, and to do is another."
    ],
    [
        "Zelfs al is ze rijk, ze is niet gelukkig." =>
          "Although she is rich, she is not happy."
    ],
    [
        "Je had me dat gisteren moeten vertellen." =>
          "You should've told me yesterday."
    ],
    [
        "Het gerucht over haar dood bleek niet waar te zijn." =>
          "The rumor of her death turned out false."
    ],
    [ "Ik spreek helemaal geen Frans." => "I don't know any French." ],
    [ "Ik ben haar niet vergeten!"     => "I haven't forgotten her." ],
    [ "Begrijp je wat ik zeg?" => "Do you understand what I am saying?" ],
    [ "De lente is op weg!"    => "Spring is on the way!" ],
    [ "En een beetje brood."   => "And a little bread." ],
    [ "Het was een warme dag." => "It was a warm day." ],
    [ "Iedereen in zijn gezin is groot." => "Everyone in his family is tall." ],
    [
        "Ik ken een man die goed Russisch spreekt." =>
          "I know a man who can speak Russian well."
    ],
    [
        "Wilt ge zo goed zijn het venster open te doen?" =>
          "Would you please open the window?"
    ],
    [ "Het kan me niet schelen wat hij doet." => "I don't care what he does." ],
    [ "Hoe heet die vogel?"                   => "What is this bird called?" ],
    [ "Ik heb geen gezin."                    => "I have no family." ],
    [ "Hoe heet die vogel?"          => "What is the name of that bird?" ],
    [ "Mag ik nu beginnen met eten?" => "May I start eating now?" ],
    [ "Mag ik nu beginnen met eten?" => "May I begin to eat?" ],
    [
        "Af en toe ga ik naar de bibliotheek." =>
          "I go to the library from time to time."
    ],
    [ "Hij weet veel over dieren." => "He knows a lot about animals." ],
    [
        "Ik zal haar het boek morgen geven." =>
          "I will give her the book tomorrow."
    ],
    [
        "Ik heb iemand nodig om mee te praten." =>
          "I need someone to talk with."
    ],
    [ "Hoe wilt u de eieren hebben?"  => "How would you like your eggs?" ],
    [ "Ik eet een appel."             => "I am eating an apple." ],
    [ "Ik voel me moe."               => "I'm feeling tired." ],
    [ "Zijn plan is gevaarlijk!"      => "His plan is dangerous!" ],
    [ "Ik eet een appel."             => "I eat an apple." ],
    [ "Hoe heet deze vogel?"          => "What is this bird called?" ],
    [ "Hoe heet deze vogel?"          => "What is the name of that bird?" ],
    [ "Hoe heet deze vogel?"          => "What is the name of this bird?" ],
    [ "Ik voel me moe."               => "I feel tired." ],
    [ "Hoe voelde zij zich gisteren?" => "How did she feel yesterday?" ],
    [ "Zeg dat niet."                 => "Don't say that." ],
    [
        "Ik weet dat je een leerkracht bent." =>
          "I know that you are a teacher."
    ],
    [
        "Ik weet dat je een leerkracht bent." => "I know that you're a teacher."
    ],
    [ "Je moet een brief schrijven." => "You should write a letter." ],
    [
        "Ik zal hem het boek morgen geven." =>
          "I will give him the book tomorrow."
    ],
    [
        "Ik denk dat je het verkeerde nummer hebt." =>
          "I think you have the wrong number."
    ],
    [
        "De geschiedenis is de lerares van het leven." =>
          "History is the teacher of life."
    ],
    [
        "Wat doen jullie in je vrije tijd?" =>
          "What do you do in your free time?"
    ],
    [ "Wil je nog een kopje thee?" => "Will you have another cup of tea?" ],
    [
        "Zij en haar vriend wonen samen." =>
          "She and her boyfriend live together."
    ],
    [ "Je hebt geen hart." => "You have no heart." ],
    [
        "Er is iemand met wie ik eerst wil praten." =>
          "There's somebody I want to talk to first."
    ],
    [
        "De potlood die goed schrijft is van mij." =>
          "The pencil which writes well is mine."
    ],
    [
        "Ik denk dat we samen zaken kunnen doen." =>
          "I believe we can do business together."
    ],
    [
        "Wat heeft u met mijn bagage gedaan?" =>
          "What did you do with my baggage?"
    ],
    [
        "Japans spreken is makkelijk voor mij." =>
          "Speaking Japanese is easy for me."
    ],
    [
        "Ik wil je nog zien voor ik naar Europa vertrek." =>
          "I would like to see you before I leave for Europe."
    ],
    [ "Doe je ouders de groeten van me." => "Remember me to your parents." ],
    [
        "Ze kocht een woordenboek voor haar zuster." =>
          "She bought a dictionary for her sister."
    ],
    [ "Ze is trots op haar dochter." => "She takes pride in her daughter." ],
    [ "Ze is trots op haar dochter." => "She is proud of her daughter." ],
    [
        "Je mag mijn auto gebruiken, als je wil." =>
          "You can use my car, if you want to."
    ],
    [ "Waarom is ze niet gekomen?" => "Why didn't she come?" ],
    [ "Ik zag vijf mannen."        => "I saw five men." ],
    [
        "Ik weet niet hoe diep het meer is." =>
          "I don't know how deep the lake is."
    ],
    [
        "Hij zal volgende maand naar New York gaan." =>
          "He will go to New York next month."
    ],
    [
        "Hij beloofde me om vier uur te zullen komen." =>
          "He promised me to come at four."
    ],
    [ "Er ligt een appel op tafel."  => "There is an apple on the desk." ],
    [ "Er ligt een appel op tafel."  => "There is an apple on the table." ],
    [ "Hoeveel moet ik u?"           => "How much do I owe you?" ],
    [ "Moet ik een brief schrijven?" => "Do I have to write a letter?" ],
    [ "Ik gaf hem mijn adres."       => "I gave him my address." ],
    [ "Ik moet een brief schrijven." => "I have to write a letter." ],
    [ "Ik wil nog een kopje thee."   => "I want another cup of tea." ],
    [
        "Ik kijk er naar uit om je te ontmoeten." =>
          "I look forward to meeting you."
    ],
    [
        "Dit is één van de beste woordenboeken die ik heb." =>
          "This is one of the best dictionaries I have."
    ],
    [ "Dit boek was zeer interessant." => "This book was very interesting." ],
    [
        "Uw broer heeft mij gezegd dat ge naar Parijs geweest zijt." =>
          "Your brother said you'd gone to Paris."
    ],
    [
        "We waren erg onder de indruk van zijn nieuw boek." =>
          "We were very impressed by his new book."
    ],
    [
        "Ik vraag me af waarom vrouwen langer leven dan mannen." =>
          "I wonder why women live longer than men."
    ],
    [ "Wanneer hebt ge haar ontmoet?" => "When did you see her?" ],
    [ "Ze rende naar hem toe."        => "She ran up to him." ],
    [
        "Ik ben iemand die leeft bij het moment." =>
          "I'm a person who lives for the moment."
    ],
    [
        "Het is erg moeilijk jezelf te leren kennen." =>
          "It's very difficult to know yourself."
    ],
    [
        "Als ik jou was, zou ik harder leren." =>
          "If I were you, I'd study harder."
    ],
    [ "Hebt ge een fototoestel?"        => "Do you have a camera?" ],
    [ "Hij had één dochter."            => "He had one daughter." ],
    [ "Hij schrijft mij eens per week." => "He writes me once a week." ],
    [ "Hij schrijft mij eens per week." => "He writes to me once a week." ],
    [ "Doe haar de groeten van me."     => "Send her my regards." ],
    [
        "Dit boek is te moeilijk te begrijpen." =>
          "This book is too difficult to understand."
    ],
    [
        "Kan je je voorstellen hoe het leven zou zijn zonder televisie?" =>
          "Can you imagine what life would be like without television?"
    ],
    [
        "Engels spreken is niet makkelijk maar het is interessant." =>
          "To speak English is not easy, but it is interesting."
    ],
    [ "Maak je geen zorgen om mij." => "Don't worry about me." ],
    [
        "Je moet er onmiddellijk naartoe gaan." =>
          "It is necessary that you go there at once."
    ],
    [
        "Mensen van je leeftijd hebben vaak dit probleem." =>
          "People of your age often have this problem."
    ],
    [ "Ik spreek geen Frans." => "I don't speak French." ],
    [
        "Wat is de betekenis van deze zin?" =>
          "What is the meaning of this phrase?"
    ],
    [
        "Het doet mij plezier dat ge terug zijt." => "I'm glad to see you back."
    ],
    [ "Ik zag een huis in de verte." => "I saw a house in the distance." ],
    [
        "Ge moet zeker tegen zondag klaar zijn." =>
          "It is imperative for you to finish by Sunday."
    ],
    [
        "Ze reden naar het station per auto." =>
          "They drove to the station by car."
    ],
    [ "Doe de deur niet open."        => "Don't open the door." ],
    [ "Hij komt waarschijnlijk niet." => "He probably won't come." ],
    [ "Hij zal een brief schrijven."  => "He will be writing a letter." ],
    [
        "Heeft iemand anders een advies?" => "Does anyone else have any advice?"
    ],
    [
        "Ik ga er vanuit dat je Frans spreekt." =>
          "I assume that you can speak French."
    ],
    [ "Hij las erg veel." => "He used to read a lot." ],
    [ "Hij las erg veel." => "He read a lot." ],
    [
        "Hij weet veel over wilde dieren." =>
          "He knows a lot about wild animals."
    ],
    [ "De wereld is een klein dorp." => "The world is a small village." ],
    [ "Heb je hem pas leren kennen?" => "Did you meet him recently?" ],
    [ "Heb je hem pas leren kennen?" => "Did you just get to know him?" ],
    [
        "Erg bedankt voor al wat ge gedaan hebt." =>
          "Thank you very much for all you have done."
    ],
    [ "Doe de deur niet dicht."           => "Don't close the door." ],
    [ "Ik ga te voet naar school."        => "I go to school on foot." ],
    [ "Ik ga te voet naar school."        => "I walk to school." ],
    [ "Ze begon tegen de hond te praten." => "She began to talk to the dog." ],
    [
        "Zou u me kunnen vertellen hoe ik bij het station kom?" =>
          "Could you please tell me how to get to the station?"
    ],
    [ "Hij eet een appel."                 => "He's eating an apple." ],
    [ "Mijn oom is kwaad."                 => "My uncle is angry." ],
    [ "Van wie is deze camera?"            => "Whose is this camera?" ],
    [ "Ik heb je iets te vertellen."       => "I have something to tell you." ],
    [ "Wat heb je afgelopen nacht gedaan?" => "What did you do last night?" ],
    [ "Tijd is het beste medicijn."        => "Time is the best medicine." ],
    [ "Spreek je Japans?"                  => "Do you speak Japanese?" ],
    [
        "Ik zal op je kinderen passen vanavond." =>
          "I'll take care of your children tonight."
    ],
    [
        "Ik besloot mijn vriend om hulp te vragen." =>
          "I decided to ask for my friend's help."
    ],
    [
        "Ik vroeg me af of je vandaag zou komen opdagen." =>
          "I was wondering if you were going to show up today."
    ],
    [ "Ik wilde daar naartoe gaan."    => "I wanted to go there." ],
    [ "Er is geen lucht in de ruimte." => "There is no air in space." ],
    [
        "Hij die geen liefde kent, kent geen ongeluk." =>
          "One who knows no love knows no unhappiness."
    ],
    [ "Hij heeft een hond en zes katten." => "He has one dog and six cats." ],
    [
        "Je bent nog nooit in Europa geweest, toch?" =>
          "You've never been to Europe, have you?"
    ],
    [
        "Ik heb je nog nooit zo horen praten." =>
          "I've never heard you talk like that."
    ],
    [ "Bel mij niet meer."            => "Don't call me again." ],
    [ "Uw zuster is mooi als altijd." => "Your sister is beautiful as ever." ],
    [ "Wie houden wij voor de gek?"   => "Who are we kidding?" ],
    [
        "Hij is twee keer zo zwaar als zijn vrouw." =>
          "He is twice as heavy as his wife."
    ],
    [
        "Wees niet bang om een fout te maken." =>
          "Don't be afraid to make a mistake."
    ],
    [
        "Ze begint om zeven uur met werken." =>
          "She starts her job at seven o'clock."
    ],
    [ "Ze voelde zich een beetje moe." => "She felt a bit tired." ],
    [ "Hou de deur open."              => "Keep the door open." ],
    [ "Dat boek was interessant."      => "That book was interesting." ],
    [ "Vissen leven in het water."     => "Fish live in the water." ],
    [
        "Ik zou graag in New York willen wonen." =>
          "I'd like to live in New York."
    ],
    [
        "Mijn vader woont en werkt in Tokio." =>
          "My father lives and works in Tokyo."
    ],
    [
        "Er zit een grond van waarheid in wat hij zegt." =>
          "There is a certain amount of truth in what he's saying."
    ],
    [ "Ik hou niet van klassieke muziek." => "I don't like classical music." ],
    [
        "Wat zoudt ge doen in mijn plaats?" =>
          "What would you do if you were in my place?"
    ],
    [ "Wat zoudt ge doen in mijn plaats?" => "What would you do in my place?" ],
    [
        "Wat zoudt ge doen in mijn plaats?" =>
          "If you were in my place, what would you do?"
    ],
    [ "We kunnen net zo goed meteen gaan." => "We may as well go at once." ],
    [ "Heb je mijn fototoestel gezien?"    => "Did you see my camera?" ],
    [ "Is het allemaal echt voorbij?"      => "Is it really all over?" ],
    [ "Lees wat je wilt."                  => "Read whatever you like." ],
    [ "Is dat uw doel?"                    => "Is that your goal?" ],
    [
        "Uw ouders zijn niet gekomen zeker?" =>
          "Your parents didn't come, did they?"
    ],
    [
        "Op dit moment ben ik een bier aan het drinken." =>
          "I'm drinking a beer right now."
    ],
    [ "Ik houd van deze foto." => "I love this photo." ],
    [
        "Het spijt me dat ik je vanavond niet kan ontmoeten." =>
          "I'm sorry that I can't meet you tonight."
    ],
    [
        "Kinderen doen eerder hun vrienden dan hun ouders na." =>
          "Children imitate their friends rather than their parents."
    ],
    [ "Hij keek de kamer rond."              => "He looked around the room." ],
    [ "Mijn tante had drie kinderen."        => "My aunt had three kids." ],
    [ "Mijn tante had drie kinderen."        => "My aunt had three children." ],
    [ "Wat is het slechte nieuws?"           => "What is the bad news?" ],
    [ "Ik zei dat alleen maar om te lachen." => "It was just a joke." ],
    [ "Ik zie geen verschil."                => "I don't see any difference." ],
    [
        "We zijn waarschijnlijk een paar dagen weg." =>
          "We'll probably be away for a few days."
    ],
    [ "Hij stak zijn hand niet op." => "He did not put up his hand." ],
    [ "Dat zijn jouw zaken niet."   => "It's none of your business." ],
    [ "Ik wou dat ik kon zwemmen."  => "I wish I could swim." ],
    [
        "Weet je toevallig waar ze woont?" =>
          "Do you happen to know where she lives?"
    ],
    [ "Zij heeft drie broers." => "She has three brothers." ],
    [ "De soep is heet."       => "The soup's very hot." ],
    [
        "Ik heb hem leren kennen in Frankrijk." =>
          "I got acquainted with him in France."
    ],
    [ "Maak je er geen zorgen over!" => "Don't worry about it!" ],
    [
        "Er komt iemand de trap op." => "There's somebody coming up the stairs."
    ],
    [ "Ik ga graag alleen te voet."      => "I like walking alone." ],
    [ "Ik ga graag alleen te voet."      => "I like walking by myself." ],
    [ "Ze heeft een hond en zes katten." => "She has a dog and six cats." ],
    [ "Heb je een potlood?"              => "Have you got a pencil?" ],
    [
        "Hij schrijft zelden naar zijn vader." =>
          "He seldom writes to his father."
    ],
    [
        "Gisteren heb ik een brief van haar gekregen." =>
          "I had a letter from her yesterday."
    ],
    [
        "Hij heeft me verteld om het raam open te houden." =>
          "He told me to leave the window open."
    ],
    [
        "Kinderen zijn soms bang van het donker." =>
          "Children are sometimes afraid of the dark."
    ],
    [ "Kort haar vind ik leuk." => "I like short hair." ],
    [
        "We kunnen elke morgen de klok van de kerk horen." =>
          "We can hear the church bell every morning."
    ],
    [
        "Zij is gewend laat op te blijven." => "She is used to staying up late."
    ],
    [
        "Ik wil niet schrijven met deze pen." =>
          "I don't want to write with this pen."
    ],
    [
        "Ik heb dat verhaal in een of ander boek gelezen." =>
          "I have read that story in some book."
    ],
    [
        "Ik had iets langer nodig dan gewoonlijk om in te slapen." =>
          "It took me a little more time than usually to fall asleep."
    ],
    [
        "Laat de kans niet aan je voorbij gaan!" => "Don't let the chance slip!"
    ],
    [ "Dat was niet mijn bedoeling."   => "That wasn't my intention." ],
    [ "Ging je gisteren naar kantoor?" => "Did you go to office yesterday?" ],
    [
        "Eerlijk, ik kan hem niet vertrouwen." => "Honestly, I can't trust him."
    ],
    [
        "Hoeveel mensen zijn er in Europa?" =>
          "How many people are there in Europe?"
    ],
    [
        "Ik heb gisteren een kat in de zak gekocht." =>
          "I bought a pig in a poke yesterday."
    ],
    [
        "Ze hielp haar vader bij het werk in de tuin." =>
          "She helped her father with the work in the garden."
    ],
    [
        "Alles wat je je kunt voorstellen is echt." =>
          "Everything you can imagine is real."
    ],
    [
        "Ik zou u graag zien voor ik naar Europa vertrek." =>
          "I would like to see you before leaving for Europe."
    ],
    [ "Ik spreek een beetje Frans." => "I can speak French a little." ],
    [ "Ik spreek een beetje Frans." => "I can speak a little French." ],
    [
        "Volgende week reis ik naar Europa." =>
          "I will be traveling in Europe next week."
    ],
    [ "Deze CD is van mijn zoon." => "This CD belongs to my son." ],
    [ "Deze CD is van mijn zoon." => "This CD is my son's." ],
    [ "Deze CD is van mijn zoon." => "This is my son's CD." ],
    [
        "Wat zie je er vreselijk uit, wat is er gebeurd?" =>
          "You look terrible. What happened?"
    ],
    [
        "Ze deed alsof ze er niets vanaf wist." =>
          "She acted as if she knew nothing about it."
    ],
    [
        "Ze heeft iemand nodig die haar kan begrijpen." =>
          "She needs someone who is able to understand her."
    ],
    [
        "Ik zie je morgen in de bibliotheek." =>
          "See you tomorrow at the library."
    ],
    [
        "Ik zie je morgen in de bibliotheek." =>
          "See you tomorrow in the library."
    ],
    [
        "Ik zie je morgen in de bibliotheek." =>
          "I'll see you at the library tomorrow."
    ],
    [
        "Ik zie je morgen in de bibliotheek." =>
          "I'll see you tomorrow at the library."
    ],
    [ "Er is niemand gekomen vandaag."   => "Nobody showed up today." ],
    [ "Werk je op zondag?"               => "Do you work on Sundays?" ],
    [ "Het eten ziet er erg lekker uit." => "The food looks very delicious." ],
    [ "Hij kan niet goed zingen."        => "He cannot sing well." ],
    [ "Hij kan niet goed zingen."        => "He can't sing well." ],
    [ "Ik wil geen vlees."               => "I don't want meat." ],
    [ "Ben ik in Londen?"                => "Am I in London?" ],
    [
        "Ik heb hem vorig jaar op een feestje ontmoet." =>
          "I met him last year at a party."
    ],
    [ "Hij is een belangrijk persoon." => "He is a person of importance." ],
    [
        "Kunt ge u voorstellen hoe mijn leven is?" =>
          "Do you have any idea what my life is like?"
    ],
    [ "Maak je geen zorgen over mij." => "Don't worry about me." ],
    [
        "Ze hebben hun ouders bezocht gisteren." =>
          "They visited their parents yesterday."
    ],
    [ "Kan je echt niet zwemmen?" => "Can't you really swim?" ],
    [ "Ik heb veel foto's."       => "I have a lot of photos." ],
    [ "Ik heb veel foto's."       => "I have many photos." ],
    [ "Ik zal je nooit vergeten." => "I'll never forget you." ],
    [
        "We hebben goed weer gehad de afgelopen tijd." =>
          "We've been having good weather."
    ],
    [ "Je hebt het duidelijk mis."        => "Clearly you are mistaken." ],
    [ "Kinderen hebben liefde nodig."     => "Children need loving." ],
    [ "Het is leuk om honkbal te spelen." => "It is fun to play baseball." ],
    [ "Het is leuk om honkbal te spelen." => "Playing baseball is fun." ],
    [ "Het is leuk om honkbal te spelen." => "It's fun to play baseball." ],
    [
        "Ik droom ervan een leraar te worden." =>
          "I dream of becoming a teacher."
    ],
    [ "Hou jezelf niet voor de gek." => "Don't fool yourself." ],
    [ "Deze vlag is erg mooi."       => "This flag is very pretty." ],
    [ "Kan iemand me helpen?"        => "Can anyone help me?" ],
    [
        "We hebben veel sneeuw gehad dit jaar." =>
          "We have had plenty of snow this year."
    ],
    [
        "Mensen moeten zich aan de regels houden." =>
          "People have to obey the rules."
    ],
    [
        "Hebben jullie de krant van vandaag al gelezen?" =>
          "Have you read today's paper yet?"
    ],
    [
        "Ik heb de indruk dat het al de hele dag regent." =>
          "I'm under the impression that it's been raining all day."
    ],
    [ "We zijn zeven jaar geleden getrouwd." => "We married seven years ago." ],
    [
        "Wat ge ook zegt, ik zal met haar trouwen." =>
          "Whatever you say, I'll marry her."
    ],
    [ "Engels spreken is niet makkelijk." => "Speaking English is not easy." ],
    [ "Engels spreken is niet makkelijk." => "To speak English is not easy." ],
    [ "Engels spreken is niet makkelijk." => "Speaking English isn't easy." ],
    [ "Ze houdt heel erg van katten."     => "She really likes cats a lot." ],
    [
        "De reden die hij gaf zijn moeilijk om te begrijpen." =>
          "The reason which he gave is hard to understand."
    ],
    [
        "Mijn moeder kan goed piano spelen." =>
          "My mother plays the piano well."
    ],
    [ "Ik ben bij Dan op bezoek geweest." => "I visited Dan." ],
    [
        "Men zegt dat zijn vader overleden is in een vreemd land." =>
          "It is said that his father died in a foreign country."
    ],
    [
        "We gingen zonder hem, want hij was nog niet klaar." =>
          "We went without him, as he wasn't ready."
    ],
    [ "Ik denk dat het het proberen waard is." => "I think it's worth a try." ],
    [
        "Ze heeft altijd tijd in de namiddag." =>
          "She always has time in the afternoon."
    ],
    [ "Doe de groeten aan je vader." => "Say hi to your father for me." ],
    [ "Dit is het einde."            => "This is the end." ],
    [ "Waar wonen jullie allemaal?"  => "Where do you all live?" ],
    [
        "Onze leraar spreekt soms te snel." =>
          "Our teacher sometimes speaks too fast."
    ],
    [
        "Zijn ouders gaan elke zondag naar de kerk." =>
          "His parents go to church every Sunday."
    ],
    [ "Hoe gaat het met je jongere zus?" => "How's your little sister?" ],
    [
        "Wat is de grootste stad van Duitsland?" =>
          "What's the largest city in Germany?"
    ],
    [
        "Het is twee uur in de namiddag." =>
          "It's two o'clock in the afternoon."
    ],
    [ "Het is twee uur in de namiddag." => "It's 2:00 p.m." ],
    [
        "Wat vind je van vis voor het avondeten?" =>
          "What about having fish for dinner?"
    ],
    [ "Blijf hier bij ons."                  => "Stay here with us." ],
    [ "De lucht voelde een beetje koud aan." => "The air felt a little cold." ],
    [
        "De een na de ander werd ziek in het dorp." =>
          "The people in the village fell ill one after another."
    ],
    [ "Hoe spel je je naam?" => "How do you spell your name?" ],
    [
        "Hij heeft beslist om daar alleen te gaan." =>
          "He made up his mind to go there alone."
    ],
    [ "Zeg het op een andere manier."     => "Say it in another way." ],
    [ "Ik ben beschaamd om haar te zien." => "I am ashamed to see her." ],
    [
        "Hij wordt zeker vroeg of laat president." =>
          "He is sure to become the President sooner or later."
    ],
    [ "Het is je enige kans."           => "It's your only chance." ],
    [ "Ik verwacht een brief van haar." => "I'm expecting a letter from her." ],
    [
        "Ik wil graag een kamer met uitzicht op de tuin." =>
          "I'd like a room facing the garden."
    ],
    [
        "Wanneer ben je klaar om te vertrekken?" =>
          "When will you get ready to leave?"
    ],
    [
        "Er komt geen water uit de douche." =>
          "Water is not coming out of the shower."
    ],
    [ "Ik wens u een goede reis." => "I wish you a pleasant voyage." ],
    [ "De thee is warm."          => "The tea is hot." ],
    [
        "Ik zou graag in deze rivier zwemmen." =>
          "I'd like to swim in this river."
    ],
    [ "Hoe was je vakantie?" => "How was your vacation?" ],
    [
        "Ik ontmoette hem juist toen hij uit school kwam." =>
          "I met him just as he was coming out of school."
    ],
    [
        "Misschien herinnert ze me niet, maar ik herinner me haar nog." =>
          "She may not remember me, but I do remember her."
    ],
    [ "Wie nam de foto?"                 => "Who took the picture?" ],
    [ "Er zat een kat op de stoel."      => "A cat was sitting on the chair." ],
    [ "Mijn moeder kookt voor mij."      => "My mother is cooking for me." ],
    [ "Hij is in goede gezondheid."      => "He is in good health." ],
    [ "Ik zou graag in Frankrijk wonen." => "I would like to live in France." ],
    [ "Hij had geen plek om te wonen."   => "He had no place to live." ],
    [
        "Ik kan nog steeds niet goed Chinees schrijven." =>
          "I still don't write Chinese well."
    ],
    [
        "Het spreekt voor zich dat geluk niet te koop is." =>
          "It goes without saying that you can't buy happiness."
    ],
    [ "Onze school begint om acht uur." => "Our school begins at eight." ],
    [
        "Hij beloofde dat tegen niemand te zeggen." =>
          "He promised not to tell that to anyone."
    ],
    [
        "Iedereen die hem kent vindt hem leuk." =>
          "Those who know him like him."
    ],
    [
        "Mijn vader eet niet veel fruit." =>
          "My father does not eat much fruit."
    ],
    [ "Ik zou liever thuis blijven." => "I would rather stay at home." ],
    [ "Ik zou liever thuis blijven." => "I'd rather stay at home." ],
    [ "Deze vlag is heel mooi."      => "This flag is very beautiful." ],
    [
        "Ik heb niet genoeg geld voor het ogenblik." =>
          "I don't have enough money at the moment."
    ],
    [ "Die stropdas staat je erg goed."   => "That tie suits you very well." ],
    [ "Geen nieuws is goed nieuws."       => "No news is good news." ],
    [ "Waarom kom je niet eerder?"        => "Why don't you come earlier?" ],
    [ "Schrijft ge een brief?"            => "Are you writing a letter?" ],
    [ "Het is warm genoeg om te zwemmen." => "It's warm enough to swim." ],
    [
        "Doe alstublieft uw vrouw de groeten voor me." =>
          "Please say hello to your wife for me."
    ],
    [ "Mijn vader is vijftig jaar oud."    => "My father is fifty years old." ],
    [ "Hij heeft zijn koffie graag zwart." => "He likes his coffee black." ],
    [ "Iedereen heeft zijn prijs."         => "Everyone has his price." ],
    [ "Schrijf je naam hier op."           => "Write down your name here." ],
    [
        "Stel niet uit tot morgen wat je vandaag kunt doen." =>
          "Don't put off until tomorrow what you can do today."
    ],
    [ "Doe de deur achter je dicht."    => "Shut the door behind you." ],
    [ "Doe de deur achter je dicht."    => "Close the door after you." ],
    [ "Mijn broer is klein maar sterk." => "My brother is small but strong." ],
    [ "Je moet stoppen met drinken."    => "You should stop drinking." ],
    [ "Ik wil Duits spreken."           => "I want to speak German." ],
    [
        "Omdat het koud was, hebben we een vuur gemaakt." =>
          "It being cold, we made a fire."
    ],
    [
        "Omdat het koud was, hebben we een vuur gemaakt." =>
          "Since it was cold, we made a fire."
    ],
    [ "Ik weet dat het je niks kan schelen." => "I know you don't care." ],
    [
        "Hoe vind je eten in de ruimte?" =>
          "How do you find food in outer space?"
    ],
    [ "Maak je geen zorgen over ons." => "Don't worry about us." ],
    [
        "Alleen mijn moeder begrijpt me echt." =>
          "Only my mother really understands me."
    ],
    [
        "Ik ben van plan naar Frankrijk te gaan volgend jaar." =>
          "I plan to go to France next year."
    ],
    [ "Ik probeerde met je te praten." => "I was trying to talk to you." ],
    [
        "Ik heb een oom die in Kyoto woont." =>
          "I have an uncle who lives in Kyoto."
    ],
    [ "Het is best koud vandaag."       => "It's rather cold today." ],
    [ "Ga eens even kijken wie het is." => "Please go and see who it is." ],
    [ "God zij met ons."                => "May God be with us." ],
    [ "God zij met ons."                => "God be with us." ],
    [
        "Ik zoek een geschenk voor mijn moeder." =>
          "I am looking for a present for my mother."
    ],
    [
        "Ik zoek een geschenk voor mijn moeder." =>
          "I'm looking for a present for my mother."
    ],
    [ "Deze appel is erg rood." => "This apple is very red." ],
    [ "Ik heb een domme vraag." => "I have a stupid question." ],
    [
        "Ik hoop dat we in contact zullen kunnen blijven." =>
          "I hope we will be able to keep in touch."
    ],
    [ "Kom binnen, de deur is open." => "Come in, the door's open." ],
    [
        "Misschien zal hij wel nooit beroemd worden." =>
          "Perhaps he'll never become famous."
    ],
    [
        "Ik nam geen deel aan het gesprek." =>
          "I didn't participate in the conversation."
    ],
    [ "Ik ben vrij op zondag." => "I'm free on Sunday." ],
    [ "Wat aardig van u!"      => "How nice of you!" ],
    [
        "Mijn jongere broer is groter dan ik." =>
          "My younger brother is taller than I am."
    ],
    [ "Je zult het verschil zien." => "You will see the difference." ],
    [ "Je zult het verschil zien." => "You'll see the difference." ],
    [ "Ik heb geen potlood."       => "I don't have a pencil." ],
    [
        "Hij is de persoon aan wie ik mijn woordenboek heb gegeven." =>
          "He is the person to whom I gave my dictionary."
    ],
    [ "Het regent de hele tijd." => "It is raining all the time." ],
    [
        "Mijn moeder heeft me alle liefde die ik nodig had gegeven." =>
          "My mother gave me all the love I needed."
    ],
    [
        "Speelt ge tennis na de school?" => "Will you play tennis after school?"
    ],
    [
        "Kinderen hebben een hoop slaap nodig." =>
          "Children need a lot of sleep."
    ],
    [ "Hij is erg aardig."          => "He is very kind." ],
    [ "Je moet nu niet vertrekken." => "You must not leave right now." ],
    [
        "Ze speelt elke dag tennis na school." =>
          "She plays tennis after school every day."
    ],
    [
        "Wat was het laatste concert dat je bezocht hebt?" =>
          "What was the last concert you went to?"
    ],
    [ "Ik ben verliefd op jou."               => "I'm in love with you." ],
    [ "Zullen we lopend of met de auto gaan?" => "Shall we walk or drive?" ],
    [ "Hij heeft helemaal gelijk."            => "He is quite right." ],
    [ "Ik moest te voet naar huis gaan."      => "I had to walk home." ],
    [ "Ze eten een keer per week vlees."      => "They eat meat once a week." ],
    [ "Ik heb een paraplu gekocht."           => "I bought an umbrella." ],
    [
        "Je hebt het recht om boos te zijn." =>
          "You have good reason to be angry."
    ],
    [
        "Daar kan ik met mijn verstand niet bij." =>
          "That's too much for my little brain."
    ],
    [ "Daar kan ik met mijn verstand niet bij." => "That goes over my head." ],
    [ "Mijn broer is gezond."                   => "My brother is healthy." ],
    [ "Waarom haat je me?"                      => "Why do you hate me?" ],
    [
        "Ze heeft veel respect voor haar leraar." =>
          "She has a lot of respect for her teacher."
    ],
    [
        "Je hebt dit boek misschien al gelezen." =>
          "You may have read this book already."
    ],
    [ "Dit is goed vlees." => "This is good meat." ],
    [
        "Je bent de belangrijkste persoon in mijn leven." =>
          "You're the most important person in my life."
    ],
    [ "Geef me eens iets om te schrijven." => "Give me something to write." ],
    [ "Ik bel je binnen een week."  => "I will call you within a week." ],
    [ "Ik zag hem naar mij kijken." => "I saw him looking at me." ],
    [ "Er sterven elke dag mensen." => "People die every day." ],
    [
        "Het spijt me dat ik je aan het huilen heb gemaakt." =>
          "I'm sorry for making you cry."
    ],
    [
        "Ze heeft niet veel vrienden in Kyoto." =>
          "She does not have many friends in Kyoto."
    ],
    [
        "Ik heb haar leren kennen in Londen." =>
          "I met her in London for the first time."
    ],
    [
        "Hij heeft Europa een paar keer bezocht." =>
          "He has visited Europe several times."
    ],
    [
        "Waar is de mooiste plaats op aarde?" =>
          "Where is the most beautiful place in the world?"
    ],
    [
        "Ik denk dat je een heleboel vragen hebt." =>
          "I guess you've got a lot of questions."
    ],
    [ "Waar ga je heen?" => "Where are you going to?" ],
    [ "Waar ga je heen?" => "Where are you going?" ],
    [
        "Er zijn geen woorden voor hoe geweldig jij bent." =>
          "No words can express how amazing you are."
    ],
    [
        "Gisteren ging ik in de rivier zwemmen." =>
          "I went to swim in the river yesterday."
    ],
    [
        "Ik zal je missen wanneer je weg bent." =>
          "I'll miss you when you are gone."
    ],
    [
        "In mijn droom kwam ik een wolf tegen." =>
          "In my dream, I encountered a wolf."
    ],
    [ "Mijn tuin is klein."           => "My garden is small." ],
    [ "Willen jullie thee of koffie?" => "You want to drink tea or coffee?" ],
    [
        "Ze was heel aardig tegen iedereen." => "She was very kind to everyone."
    ],
    [ "Ik kan niet nog meer bier drinken." => "I can't drink any more beer." ],
    [
        "Ben je ooit in het buitenland geweest?" => "Have you ever been abroad?"
    ],
    [ "Zit er vlees in dit eten?"    => "Does this food contain any meat?" ],
    [ "Hij heeft niet graag katten." => "He does not like cats." ],
    [
        "Ik heb al lang geleden de interesse voor geld verloren." =>
          "I lost interest in money a long time ago."
    ],
    [
        "Ik reis liever per trein dan per vliegtuig." =>
          "I prefer traveling by train to flying."
    ],
    [ "Ik tennis af en toe."          => "I play tennis once in a while." ],
    [ "Wij zijn alle drie studenten." => "All three of us are students." ],
    [ "Waar ging je heen?"            => "Where did you go?" ],
    [
        "Kinderen houden er echt van om op het strand te spelen." =>
          "Children really like playing on the beach."
    ],
    [ "Dit is ook vrij kort." => "This is also rather short." ],
    [
        "Niemand kan denken, maar iedereen heeft zijn mening klaar." =>
          "No one knows how to think, but everyone's got an opinion ready."
    ],
    [
        "Ik werd wakker en zag een inbreker in mijn kamer." =>
          "I awoke to find a burglar in my room."
    ],
    [ "Hebt gij dit boek geschreven?" => "Did you write this book?" ],
    [ "Doe me alsjeblieft geen pijn." => "Please don't hurt me." ],
    [
        "Deze foto heb ik vorige week gemaakt." =>
          "I took this picture a week ago."
    ],
    [
        "Deze foto heb ik vorige week gemaakt." =>
          "I took that picture a week ago."
    ],
    [ "Hij werd gedwongen om over te werken." => "He was forced to work." ],
    [
        "Als je me laat spreken, dan kan ik alles uitleggen." =>
          "If you allow me to speak, I'll be able to explain everything."
    ],
    [ "Heeft u iets aan te geven?" => "Have you anything to declare?" ],
    [ "Hoeveel geld heeft hij?"    => "How much money does he have?" ],
    [ "Zij is mijn zuster."        => "She's my sister." ],
    [
        "Toen ik op straat liep, ontmoette ik een oude vriend." =>
          "Walking along the street, I met an old friend."
    ],
    [
        "Welke kleur heeft de auto die ze zelf gekocht heeft?" =>
          "What colour is the car she bought herself?"
    ],
    [ "Welke tas is van jou?"     => "Which bag is yours?" ],
    [ "Ik was in Tokio gisteren." => "I was in Tokyo yesterday." ],
    [ "Welke tas is van jou?"     => "Which cup is yours?" ],
    [
        "Deze kamer is aangenaam om in te werken." =>
          "This room is pleasant to work in."
    ],
    [ "We hebben niet gesproken gisteren." => "We didn't talk yesterday." ],
    [
        "Voor de eerste keer in mijn leven heb ik Rome bezocht." =>
          "I visited Rome for the first time in my life."
    ],
    [
        "Parijs is een van de grootste steden van de wereld." =>
          "Paris is one of the largest cities in the world."
    ],
    [
        "Parijs is een van de grootste steden van de wereld." =>
          "Paris is one of the biggest cities in the world."
    ],
    [ "Wanneer ben je naar Parijs gekomen?" => "When did you come to Paris?" ],
    [
        "Laten we er na school over praten." =>
          "Let's talk about it after school."
    ],
    [
        "Ik mag zijn manier van praten niet." =>
          "I don't like his way of talking."
    ],
    [
        "Het probleem is dat het te duur is." =>
          "The trouble is that it costs too much."
    ],
    [ "Hadden we maar een tuin!"  => "If only we had a garden!" ],
    [ "Mijn nieuwe jurk is rood." => "My new dress is red." ],
    [
        "Ze werden gedwongen hun huis tegen hun wil in te verlaten." =>
          "They were forced to leave the house against their will."
    ],
    [ "Hij ging vissen in de rivier." => "He went fishing in the river." ],
    [
        "Wat hij ook zegt, vertrouw hem niet." =>
          "No matter what he says, don't trust him."
    ],
    [
        "Wat ga je van het weekend doen?" =>
          "What'll you be doing over the weekend?"
    ],
    [
        "Ik ben moe na het zwemmen in die rivier." =>
          "I am tired after swimming in that river."
    ],
    [ "Welke taal spreken ze in Amerika?" => "What do they speak in America?" ],
    [
        "Ik geloof niet in het bestaan van God." =>
          "I do not believe in the existence of God."
    ],
    [
        "Hij loopt nooit te koop met zijn leren." =>
          "He never makes a show of his learning."
    ],
    [ "Mag ik het eens passen?"      => "May I try it on?" ],
    [ "Mag ik het eens passen?"      => "May I try this on?" ],
    [ "Hij speelt zeer goed tennis." => "He plays tennis very well." ],
    [ "Er is iets mis met de motor." => "Something is wrong with the engine." ],
    [
        "Weet je hoe je een woordenboek moet gebruiken?" =>
          "Do you know how to use a dictionary?"
    ],
    [
        "De aarde is een stuk groter dan de maan." =>
          "The earth is a lot larger than the moon."
    ],
    [ "Ik heb een bril nodig om te lezen." => "I need glasses to read." ],
    [ "New York is een grote stad."        => "New York is a big city." ],
    [ "Heb je een hobby?"                  => "Do you have a hobby?" ],
    [ "Ik ben dicht bij de brug."          => "I am close to the bridge." ],
    [
        "Ik heb mijn portemonnee verloren op weg naar school." =>
          "I lost my purse on my way to school."
    ],
    [ "Hij is drie jaar geleden overleden." => "He died three years ago." ],
    [
        "Ik heb haar laat in de avond ontmoet." =>
          "I met her late in the evening."
    ],
    [ "Hij is te trots om op te geven." => "He is too proud to give up." ],
    [ "We kunnen geen melk drinken."    => "We can't drink milk." ],
    [
        "Hoe lang is het fietsen van hier naar jouw huis?" =>
          "How long does it take from here to your house by bike?"
    ],
    [
        "Geef mij één reden om zoiets te doen." =>
          "Give me a reason for doing such a thing."
    ],
    [ "Ik ben klaar om te vertrekken." => "I'm ready to go." ],
    [ "Hij is de oudste."              => "He is the eldest." ],
    [ "Wat is daar precies gebeurd?"   => "What exactly happened there?" ],
    [
        "Ik moet kiezen tussen die twee." =>
          "I have to choose between these two."
    ],
    [
        "Ik moet kiezen tussen die twee." => "I have to choose between the two."
    ],
    [ "Ik heb veel dromen." => "I have a lot of dreams." ],
    [
        "Ben je klaar om het slechte nieuws te horen?" =>
          "Are you ready to hear the bad news?"
    ],
    [
        "Hij was verkouden, maar ging toch naar zijn werk." =>
          "He had a cold, but he went to work."
    ],
    [ "Wat denkt u over deze zaak?" => "How do you view this matter?" ],
    [ "Heb je je boek gevonden?"    => "Did you find your book?" ],
    [ "Zijn vriendin is Japans."    => "His girlfriend is Japanese." ],
    [
        "Ik wilde de auto kopen, maar ik ben arm." =>
          "I would buy the car, but I am poor."
    ],
    [
        "Ik ontmoet je zondag om drie uur." =>
          "I'll come and see you at 3:00 p.m. on Sunday."
    ],
    [
        "Hij gaat slapen met het licht aan." =>
          "He goes to sleep with the lights left on."
    ],
    [ "Waarom zeg je dat?" => "Why do you say that?" ],
    [
        "Ik heb haar in geen eeuwigheid gezien." =>
          "I haven't seen her for ages."
    ],
    [
        "Er zijn veel dieren in het park." =>
          "There are lots of animals in the park."
    ],
    [ "Ik vind dat je werk in orde is." => "I think your work is all right." ],
    [
        "Hij kwam naar Tokyo met een grote droom." =>
          "He came up to Tokyo with a big dream."
    ],
    [ "Wat wilt u voor het ontbijt?" => "What do you want for breakfast?" ],
    [
        "Ik zou je een koffie aanbieden als je tijd had." =>
          "I would offer you a coffee if you had the time."
    ],
    [
        "Ik heb niets verstaan van wat hij zei." =>
          "I couldn't understand anything that he said."
    ],
    [
        "Hij stond altijd klaar om mensen te helpen die problemen hadden." =>
          "He was always ready to help people in trouble."
    ],
    [ "Zij houdt erg van vissen." => "She loves to fish." ],
    [ "Geef me de sleutel."       => "Give me the key." ],
    [ "Waar ging hij heen?"       => "Where was he headed?" ],
    [
        "Ik dacht dat je graag nieuwe dingen leerde." =>
          "I thought you liked to learn new things."
    ],
    [ "Dit boek gaat over China." => "This book deals with China." ],
    [ "Je klinkt als je moeder."  => "You sound like your mother." ],
    [ "Alle mensen zijn gelijk."  => "All men are equal." ],
    [ "Ontmoet je hem vaak?"      => "Do you meet him often?" ],
    [
        "Mijn appartement is niet ver van hier." => "My apartment is near here."
    ],
    [
        "Hij luisterde naar muziek op zijn kamer." =>
          "He listened to music in his room."
    ],
    [
        "Het is gevaarlijk om in die rivier te zwemmen." =>
          "That river is dangerous to swim in."
    ],
    [ "Ik heb iets in mijn oog." => "I got something in my eye." ],
    [
        "Laat me de weg naar de bushalte zien." =>
          "Show me the way to the bus stop."
    ],
    [
        "Kunt u me deze foto's laten zien, alstublieft?" =>
          "Show me the photos, please."
    ],
    [
        "Ze bracht het boek terug naar de bibliotheek." =>
          "She took the book back to the library."
    ],
    [
        "Kunt u me deze foto's laten zien, alstublieft?" =>
          "Please, show me these photos."
    ],
    [
        "Ze bracht het boek terug naar de bibliotheek." =>
          "She returned the book to the library."
    ],
    [
        "Het laat alleen maar zien dat je geen robot bent." =>
          "It only shows you're not a robot."
    ],
    [
        "Hij is bezorgd dat hij misschien te laat komt." =>
          "He's worried that he might be late."
    ],
    [
        "Onze lerares ziet er heel jong uit." => "Our teacher looks very young."
    ],
    [
        "Ik begrijp niet wat zijn echte doel is." =>
          "I fail to understand his true aim."
    ],
    [ "Kijk niet terug." => "Don't look back." ],
    [
        "Het kan me niet schelen of hij akkoord gaat of niet." =>
          "I don't care whether he agrees or not."
    ],
    [ "Mijn zus is beroemd."            => "My sister is famous." ],
    [ "Ik houd van talen!"              => "I like languages!" ],
    [ "Ik moet naar de wc."             => "I have to go to the bathroom." ],
    [ "De katten zijn bang voor water." => "The cats are afraid of water." ],
    [
        "Ik stap uit in het volgende station." =>
          "I am getting off at the next station."
    ],
    [
        "Ik stap uit in het volgende station." =>
          "I'm getting off at the next station."
    ],
    [ "Dit keer is Parijs mijn doel." => "This time my goal is Paris." ],
    [ "Ik ben een vrije man."         => "I'm a free man." ],
    [ "Hij houdt van vissen."         => "He loves to fish." ],
    [
        "Veel mensen willen niet geloven dat dit een verzonnen verhaal is." =>
          "Many people did not want to believe that this story was made up."
    ],
    [
        "Veel mensen willen niet geloven dat dit een verzonnen verhaal is." =>
"Many people did not want to believe that this was a fabricated story."
    ],
    [
        "Als hij vloeiend Engels spreekt, neem ik hem aan." =>
          "If he's fluent in English, I'll hire him."
    ],
    [
        "Zijn broer en hij zijn twee handen op één buik." =>
          "He and his brother are two peas in a pod."
    ],
    [ "Wanneer kan ik hier zwemmen?" => "When can I swim here?" ],
    [ "Wat voor ziekte heb ik?"      => "What illness do I have?" ],
    [
        "Het is reeds tijd om naar huis te gaan." =>
          "It's already time to go home."
    ],
    [ "Toen was ik student."               => "I was a student at that time." ],
    [ "Ik denk dat hij succes zal hebben." => "I think that he will succeed." ],
    [
        "Het weer van gisteren was vreselijk." =>
          "The weather yesterday was horrible."
    ],
    [ "Wat hebt ge gisteravond gedaan?" => "What did you do last night?" ],
    [ "Wat denkt ge over deze zaak?"    => "How do you view this matter?" ],
    [ "Laat ons iets proberen."         => "Let's try something." ],
    [
        "Ik zou hem schrijven als ik zijn adres wist." =>
          "If I knew his address, I would write to him."
    ],
    [ "Ik ben het geheel met je eens." => "I quite agree with you." ],
    [
        "Ik stap uit op het volgende station." =>
          "I am getting off at the next station."
    ],
    [
        "Ik stap uit op het volgende station." =>
          "I'm getting off at the next station."
    ],
    [
        "Je begrijpt misschien wel geen woord van wat ik vandaag zeg." =>
          "You probably don't understand a word I'm saying today."
    ],
    [ "De man eet brood."          => "The man is eating bread." ],
    [ "Het feestje was echt leuk." => "The party was a lot of fun." ],
    [ "Het feestje was echt leuk." => "The party was really fun." ],
    [
        "Er zijn vandaag meer wolken dan gisteren." =>
          "There's more cloud today than yesterday."
    ],
    [ "Ik ben van plan advocaat te worden." => "I intend to become a lawyer." ],
    [
        "Het leven is hard, maar ik ben harder." =>
          "Life is hard, but I am harder."
    ],
    [
        "Ik kon het niet helpen te lachen toen ik hem zag." =>
          "I could not help laughing when I saw him."
    ],
    [ "Kleren maken de man." => "Clothes make the man." ],
    [
        "Er waren vier mensen in de auto wanneer het ongeval gebeurde." =>
          "Four people were in the car when the accident happened."
    ],
    [ "De oude man leeft alleen." => "The old man lives by himself." ],
    [ "De oude man leeft alleen." => "The old man lives alone." ],
    [
        "Mag ik nog een stuk taart hebben?" =>
          "May I have another piece of cake?"
    ],
    [
        "Het horloge op het bureau is van mij." =>
          "The watch on the desk is mine."
    ],
    [
        "Er is een man die op de boerderij werkt." =>
          "There is a man working on the farm."
    ],
    [
        "Waarom was ik hier niet van op de hoogte?" =>
          "Why was I not aware of this?"
    ],
    [
        "Ik denk niet dat zij het zou verstaan." =>
          "I don't think she would understand it."
    ],
    [
        "Ik kan geen enkele fout in zijn theorie vinden." =>
          "I can't find a single flaw in his theory."
    ],
    [ "Ik dacht dat hij onschuldig was." => "I thought that he was innocent." ],
    [
        "Maandag is zeker niet mijn favoriete dag in de week." =>
          "Monday definitely isn't my favourite day of the week."
    ],
    [ "Willen jullie iets drinken?"    => "Would you like to drink anything?" ],
    [ "Kan je me wat geld geven?"      => "Can you give me some money?" ],
    [ "Ik bleef de hele nacht wakker." => "I stayed up all night." ],
    [
        "Ik kan niet begrijpen wat er is gebeurd." =>
          "I cannot understand what happened."
    ],
    [ "Ik groeide op in deze buurt."    => "I grew up in this neighborhood." ],
    [ "We hebben honger."               => "We are hungry." ],
    [ "Ik kan niet zwemmen."            => "I can't swim." ],
    [ "Ze kan niet lezen of schrijven." => "She can't write or read." ],
    [
        "Dit is het raam dat kapot gemaakt werd door de jongen." =>
          "This is the window which was broken by the boy."
    ],
    [
        "Ik werkte de hele dag hard, dus ik was erg moe." =>
          "I worked hard all day, so I was very tired."
    ],
    [
        "Deze zomer zullen we naar de bergen gaan en naar zee." =>
          "This summer we'll go to the mountains and to the sea."
    ],
    [
        "Ze sprak alsof er niets gebeurd was." =>
          "She spoke as though nothing had happened."
    ],
    [
        "Ik was dom genoeg om het te geloven." =>
          "I was stupid enough to believe it."
    ],
    [ "Morgen is haar verjaardag."   => "Tomorrow is her birthday." ],
    [ "Een storm in een glas water." => "A storm in a teacup." ],
    [
        "Het is onmogelijk op dat eiland te wonen." =>
          "It's impossible to live on that island."
    ],
    [
        "Zijn haar is blond en hij ziet er jong uit." =>
          "His hair is blond and he looks young."
    ],
    [ "Ik ben opgegroeid in deze buurt." => "I grew up in this neighborhood." ],
    [ "Waarom heb je bloemen gekocht?"   => "Why did you buy flowers?" ],
    [ "Hij is heel geleerd."             => "He is very learned." ],
    [
        "Ze antwoordde dat ze de man nooit eerder gezien had." =>
          "She replied that she had never seen the man before."
    ],
    [
        "Hij ging niet voor niets naar de universiteit." =>
          "He did not go to college for nothing."
    ],
    [ "Zij willen rijk worden." => "They want to become rich." ],
    [
        "Je kan alleen binnen komen als je ons wachtwoord weet." =>
          "You can come in if and only if you know our password."
    ],
    [ "Geef je over aan de vijand."      => "Surrender to the enemy." ],
    [ "Heeft u een rijbewijs?"           => "Do you have a driver's license?" ],
    [ "Misschien wist zij het antwoord." => "She may have known the answer." ],
    [
        "Ik kan geen enkele fout in haar theorie vinden." =>
          "I can't find a single flaw in her theory."
    ],
    [
        "De soep in de kom was heel lekker." =>
          "The soup in the bowl was very delicious."
    ],
    [ "Doe je boek dicht." => "Close your book." ],
    [
        "Ik zou vandaag liever willen studeren dan spelen." =>
          "I would rather study than play today."
    ],
    [ "Het wordt donker buiten."        => "It is getting dark outside." ],
    [ "Ik dacht dat hij een arts was."  => "I thought that he was a doctor." ],
    [ "Ik zie tranen in je ogen."       => "I see tears in your eyes." ],
    [ "Ze zou iedereen gelukkig maken." => "She would make everyone happy." ],
    [
        "Omdat het zo heet was, zijn we zwemmen geweest." =>
          "Since it was so hot, we went swimming."
    ],
    [ "Ik kan hem nergens vinden."     => "I can't find him anywhere." ],
    [ "Mijn huis staat op een heuvel." => "My house is on a hill." ],
    [
        "Ze leest elke morgen de krant." =>
          "She reads the newspaper every morning."
    ],
    [ "Het regende een week lang." => "The rain lasted a week." ],
    [
        "Het kan moeilijk zijn om een appartement te vinden." =>
          "Finding an apartment can be difficult."
    ],
    [ "Heb je hem ooit zien zwemmen?" => "Have you ever seen him swimming?" ],
    [ "Waar is de president?"         => "Where's the president?" ],
    [
        "Deze zomer gaan we naar de bergen en naar zee." =>
          "This summer we'll go to the mountains and to the sea."
    ],
    [ "Ik ging naast hem zitten." => "I sat down next to him." ],
    [
        "Wanneer de lente komt, wordt het warm." =>
          "When spring comes, it gets warms."
    ],
    [
        "Welke taal spreekt men in Amerika?" =>
          "What language is spoken in America?"
    ],
    [
        "Welke taal spreekt men in Amerika?" => "What do they speak in America?"
    ],
    [ "Ik heb met vrienden gesproken." => "I talked to friends." ],
    [ "Wij hebben uw hulp nodig."      => "We require your help." ],
    [ "Wij hebben uw hulp nodig."      => "We need your help." ],
    [
        "Jij hebt nooit tijd voor de belangrijke dingen!" =>
          "You never have time for important things!"
    ],
    [ "De les begint om tien uur." => "The class start at ten." ],
    [ "Ik kan niet verder lopen."  => "I can't walk any farther." ],
    [ "Ze is een lekker meisje."   => "She is a pretty girl to look at." ],
    [ "Weinig mensen denken zo."   => "Few people think so." ],
    [
        "Waarom kom je de laatste tijd niet opdagen bij je werk?" =>
          "Why haven't you been showing up to work lately?"
    ],
    [
        "Deze foto herinnert mij altijd aan mijn vader." =>
          "This photograph always reminds me of my father."
    ],
    [ "Hij kan niet zwemmen."     => "He can't swim." ],
    [ "Hij kan niet zwemmen."     => "He cannot swim." ],
    [ "Waar heb je dit gevonden?" => "Where did you find this?" ],
    [
        "Als kind ging ik dikwijls vissen met mijn vader." =>
          "As a child I often went fishing with my father."
    ],
    [ "Ze staan op het punt weg te gaan." => "They're about to leave." ],
    [ "De hond viel het jongetje aan." => "The dog attacked the little boy." ],
    [
        "Het was aangenaam en warm in huis." =>
          "It was nice and warm inside the house."
    ],
    [ "Ken heeft een gitaar." => "Ken has a guitar." ],
    [
        "Ik was moe en, wat nog erger is, ik wilde slapen." =>
          "I was tired and, what is worse, I was sleepy."
    ],
    [
        "Wat is de hoofdstad van de Verenigde Staten van Amerika?" =>
          "What is the capital of the United States?"
    ],
    [
        "Ik was dom genoeg om hem te geloven." =>
          "I was foolish enough to believe him."
    ],
    [
        "Deze oude tafel wordt nog steeds gebruikt." =>
          "This old table is still in use."
    ],
    [
        "Ik wil geen verpleegster meer zijn." =>
          "I don't want to be a nurse any more."
    ],
    [ "Er is geen zout meer."    => "There is no salt left." ],
    [ "Er is geen zout meer."    => "There's no more salt." ],
    [ "Ze beloofde me te komen." => "She promised me that she'd come." ],
    [
        "Ik weet niet hoe ik het moet uitleggen." =>
          "I don't know how to explain it."
    ],
    [ "Ik wilde rode schoenen." => "I wanted red shoes." ],
    [
        "Ik werd door een oude vriend uitgenodigd." =>
          "I was invited by an old friend."
    ],
    [
        "Ik zou graag zo'n camera hebben." =>
          "I would like to get a camera like this."
    ],
    [ "Was je gezicht en je handen." => "Wash your face and hands." ],
    [ "Hij begrijpt je niet."        => "He doesn't understand you." ],
    [
        "Het is moeilijk voor buitenlanders om Japans te leren." =>
          "It is hard for foreigners to learn Japanese."
    ],
    [
        "Het is moeilijk voor buitenlanders om Japans te leren." =>
          "It's hard for foreigners to learn Japanese."
    ],
    [ "Waarom geloof jij niet in God?" => "Why do you not believe in God?" ],
    [ "Kan ik helpen?"                 => "Can I help?" ],
    [
        "Het meisje is klein voor haar leeftijd." =>
          "The girl is small for her age."
    ],
    [ "Ge zijt op de verkeerde weg." => "You're going the wrong way." ],
    [
        "De man viel haar aan met de bedoeling haar te doden." =>
          "The man attacked her with the intention of killing her."
    ],
    [
        "Als je zoveel eet, zal je dik worden." =>
          "If you eat that much, you'll get fat."
    ],
    [ "Dit was het einde van de les." => "That was the end of the class." ],
    [ "Ze zingt heel goed."           => "She sings very well." ],
    [
        "Ze zijn drie maanden geleden getrouwd." =>
          "They got married three months ago."
    ],
    [ "Ik heb geen spijt u te ontmoeten." => "I do not regret meeting you." ],
    [
        "Ik hou van honden en mijn zus houdt van katten." =>
          "I like dogs and my sister likes cats."
    ],
    [
        "Zijn moeder was beschaamd over hem." =>
          "His mother was ashamed of him."
    ],
    [
        "Ik heb de indruk dat ik haar al ergens ontmoet heb." =>
          "I remember meeting her somewhere."
    ],
    [ "Er is niemand gekomen."   => "Nobody came." ],
    [ "Je hebt bijna gelijk."    => "You're almost right." ],
    [ "Ik heb niets geleerd."    => "I didn't learn anything." ],
    [ "Ze was nu buiten gevaar." => "She was now out of danger." ],
    [
        "Hoe noem je deze vogel in het Engels?" =>
          "What do you call this bird in English?"
    ],
    [
        "Ze probeerde elk woord van de leraar op te schrijven." =>
          "She tried to take down every word the teacher said."
    ],
    [ "Ze wees naar hem."        => "She pointed at him." ],
    [ "Ik wil mijn ontbijt."     => "I want to have my breakfast." ],
    [ "Praat niet zo tegen hem." => "Don't speak to him like that." ],
    [
        "Ik wil niet dat iemand dit mist." =>
          "I don't want anyone to miss this."
    ],
    [
        "Je zou beter moeten weten nu je achttien bent." =>
          "You should know better now you are eighteen."
    ],
    [
        "Ik wil dat je naar het postkantoor gaat." =>
          "I want you to go to the post office."
    ],
    [ "Zijt ge alleen naar hier gekomen?" => "Did you come here alone?" ],
    [
        "Hij schrijft zelden naar zijn ouders." =>
          "He seldom writes to his parents."
    ],
    [ "Ik wil een nieuwe auto kopen." => "I want to buy a new car." ],
    [ "Ik was aan het slapen."        => "I was sleeping." ],
    [ "Zijn vrouw is Franse."         => "His wife is French." ],
    [
        "Hij heeft een boek geschreven over China." =>
          "He wrote a book on China."
    ],
    [
        "Zij gaat volgende week naar Frankrijk." =>
          "She is going to France next week."
    ],
    [
        "Ik heb enkele eieren gekocht, en wat melk." =>
          "I bought a few eggs and a little milk."
    ],
    [ "Hoeveel boeken heeft hij?"        => "How many books does he have?" ],
    [ "Vind je dit een mooie kleur?"     => "Do you like this color?" ],
    [ "Zelfs ik kan het niet geloven."   => "Even I can't believe that." ],
    [ "Een ongeluk komt zelden alleen."  => "Misfortunes never come singly." ],
    [ "Een ongeluk komt zelden alleen."  => "When it rains, it pours." ],
    [ "Een ongeluk komt zelden alleen."  => "Misfortunes rarely come singly." ],
    [ "Dat is geen verrassing voor mij." => "That doesn't surprise me." ],
    [ "Ik kan niet zonder jouw raad."    => "I can't do without your advice." ],
    [ "Het regende hard de hele dag door." => "It rained hard all day." ],
    [ "Je moet heel hard werken."          => "You need to work very hard." ],
    [
        "Ik kan geen Engels spreken, en Spaans nog minder." =>
          "I cannot speak English, much less Spanish."
    ],
    [
        "Ik heb geen zin om vanavond bier te drinken." =>
          "I do not feel like drinking beer tonight."
    ],
    [ "Ik heb tien pennen meer dan jij." => "I have ten more pens than you." ],
    [ "Hoe hoog is die berg?"            => "How high is that mountain?" ],
    [
        "Ik denk erover naar het buitenland te gaan." =>
          "I'm thinking of going abroad."
    ],
    [ "We werken van negen tot vijf." => "We work from nine to five." ],
    [ "Ik ga naar Tokio morgen."      => "I am going to Tokyo tomorrow." ],
    [ "Dat lijkt me interessant!"     => "It seems interesting to me." ],
    [ "Ze heeft geen rijbewijs." => "She doesn't have a driving licence." ],
    [ "Ze heeft geen rijbewijs." => "She doesn't have a driver's license." ],
    [
        "Hij kwam met een grote bos bloemen." =>
          "He came bearing a large bunch of flowers."
    ],
    [
        "Hij zocht in de kamer naar de verloren sleutel." =>
          "He searched the room for the lost key."
    ],
    [
        "Laat het verleden achter je en ga door." =>
          "Leave the past behind and go on."
    ],
    [ "Doe je ogen niet dicht."          => "Don't shut your eyes." ],
    [ "Ze deed haar ogen open."          => "She opened her eyes." ],
    [ "Hij wachtte op hem tot tien uur." => "He waited for him until 10." ],
    [
        "Hij is niet zo slim als zijn broer." =>
          "He is not as intelligent as his brother."
    ],
    [
        "Mijn zus werkt als lerares Engels." =>
          "My sister's work is teaching English."
    ],
    [ "Kan ik je wat water geven?" => "Shall I get you some water?" ],
    [
        "Onze school is aan de andere kant van de rivier." =>
          "Our school is across the river."
    ],
    [ "U mag op de stoel gaan zitten."  => "You may sit down on the chair." ],
    [ "Hij kan zwemmen als een vis."    => "He is able to swim like a fish." ],
    [ "Mijn huis ligt ver over de zee." => "My home lies far across the sea." ],
    [
        "Enkele van de boeken die hij heeft, zijn Engelse romans." =>
          "Some of the books that he has are English novels."
    ],
    [ "Het was donker onder de brug." => "It was dark under the bridge." ],
    [ "Ik wil een kopje thee."        => "I want a cup of tea." ],
    [ "Ze leest graag boeken."        => "She likes to read books." ],
    [ "De klok loopt voor."           => "The clock is fast." ],
    [ "Hier is de rekening."          => "Here is the bill." ],
    [
        "Het meisje met de blauwe jas is mijn dochter." =>
          "The girl in the blue coat is my daughter."
    ],
    [ "Ik ben de afwas aan het doen." => "I'm washing the dishes." ],
    [
        "Ik heb nu juist veel problemen." =>
          "I have a lot of problems at the moment."
    ],
    [ "Wat gebeurd is, is gebeurd." => "What is done cannot be undone." ],
    [ "Wat gebeurd is, is gebeurd." => "What's done cannot be undone." ],
    [ "Wat gebeurd is, is gebeurd." => "What's done is done." ],
    [
        "Ik heb een vriend die in Kioto woont." =>
          "I have a friend who lives in Kyoto."
    ],
    [
        "Mijn benen worden beter van dag tot dag." =>
          "My legs are getting better day by day."
    ],
    [ "Ze begrijpt je niet."         => "She doesn't understand you." ],
    [ "Ik hoop dat hij op me wacht." => "I hope he will wait for me." ],
    [
        "Hij staat erop nog een spel te spelen." =>
          "He insists on playing another game."
    ],
    [ "Ik was gek op taart." => "I was fond of cake." ],
    [
        "Behalve hij, kwam niemand naar het feestje." =>
          "With the exception of him, nobody else came to the party."
    ],
    [
        "Hij dorst zich daar niet meer te laten zien." =>
          "He didn't dare to show himself there anymore."
    ],
    [ "Ik ben zijn naam vergeten."         => "I forgot his name." ],
    [ "Ik zou een ongeluk kunnen krijgen!" => "I might have an accident!" ],
    [ "Ze zitten aan tafel."     => "They are sitting at the table." ],
    [ "Je broer vraagt om hulp." => "Your brother is asking for help." ],
    [
        "Hij heeft voor zichzelf beslist dat hij daar alleen zou gaan." =>
          "He made up his mind to go there alone."
    ],
    [ "Het antwoord maakte mij boos."   => "The answer irritated me." ],
    [ "Laten we iets proberen!"         => "Let's try something." ],
    [ "Hij heeft minder brood."         => "He has less bread." ],
    [ "Hebt u iets aan te geven?"       => "Do you have anything to declare?" ],
    [ "Ik vertel je beter de waarheid." => "I'd better tell you the truth." ],
    [
        "Ik kwam gisteren langs haar huis." =>
          "I passed by her house yesterday."
    ],
    [ "Wat denken jullie van oorlog?"       => "What do you think of war?" ],
    [ "Zijn vader is vorig jaar overleden." => "His father died last year." ],
    [
        "Zijn vader is vorig jaar overleden." =>
          "His father passed away last year."
    ],
    [ "De jongen zat op een stoel." => "The boy sat on a chair." ],
    [
        "Wilt ge nog een tas koffie?" => "Would you like another cup of coffee?"
    ],
    [ "Je hebt helemaal gelijk." => "You are absolutely right." ],
    [ "Je hebt helemaal gelijk." => "You're completely right." ],
    [
        "Behalve dan dat het hier niet zo eenvoudig is." =>
          "Except that here, it's not so simple."
    ],
    [
        "Ik kon niet gaan werken want ik was ziek." =>
          "I couldn't go to work because I was sick."
    ],
    [
        "Water kun je drinken, maar je kunt het ook laten lopen." =>
          "You can drink water, but you can also pass it."
    ],
    [
        "Water kun je drinken, maar je kunt het ook laten lopen." =>
          "You can drink water, but you can also let it walk."
    ],
    [
        "Er staat iemand achter de muur." =>
          "Someone is standing behind the wall."
    ],
    [ "Waarom ben je alweer te laat?" => "Why did you arrive late again?" ],
    [
        "Je zou het niet hebben moeten doen zonder mijn toestemming." =>
          "You should not have done it without my permission."
    ],
    [
        "Het was koud gisteren, maar vandaag is het nog kouder." =>
          "It was cold yesterday, but it is even colder today."
    ],
    [
        "Ik moet volgende week naar Tokio." =>
          "I am supposed to go to Tokyo next week."
    ],
    [ "Dat vliegtuig is pas groot!" => "How huge that airship is!" ],
    [ "Ik hoor zelden van hem."     => "I seldom hear from him." ],
    [ "De aarde is rond."           => "The earth is round." ],
    [ "Houd je vriend van thee?"    => "Does your friend like tea?" ],
    [ "Ze heeft blauwe ogen."       => "She has blue eyes." ],
    [
        "Ik zat twaalf uur op de trein." =>
          "I was on the train for twelve hours."
    ],
    [ "Ze zijn even sterk als wij." => "They are as strong as us." ],
    [
        "Ge zoudt altijd de waarheid moeten zeggen." =>
          "You should always tell the truth."
    ],
    [
        "Ik neem nog liever ontslag dan onder hem te gaan werken." =>
          "I would rather quit than work under him."
    ],
    [ "Mij is iets anders geleerd." => "I was taught something different." ],
    [
        "Soms doet het pijn de waarheid te spreken." =>
          "Sometimes telling the truth hurts."
    ],
    [
        "Laat de hond niet op ons bed slapen." =>
          "Don't let the dog sleep in our bed."
    ],
    [ "Zijn naam is bekend bij iedereen." => "His name is known to all." ],
    [ "Ik kon het nergens vinden."        => "I couldn't find it anywhere." ],
    [
        "Ze zijn tien jaar getrouwd geweest." =>
          "They have been married for ten years."
    ],
    [ "Ik hou van honden."           => "I like dogs." ],
    [ "Is het werk te zwaar voor u?" => "Is the work too hard for you?" ],
    [
        "Mijn moeder kocht vorige zondag een mooie jurk voor me." =>
          "My mother bought me a nice dress last Sunday."
    ],
    [
        "Wie was het die gisteren deze rok kocht?" =>
          "Who was it that bought this skirt yesterday?"
    ],
    [ "Ik schrijf een brief." => "I am writing a letter." ],
    [ "Ik schrijf een brief." => "I write a letter." ],
    [
        "We hebben het zo druk dat we alle hulp kunnen gebruiken." =>
          "We are so busy we'll take any help we can get."
    ],
    [ "Het is bijna lente." => "Spring is just around the corner." ],
    [
        "We wonen in de buurt van een grote bibliotheek." =>
          "We live near a big library."
    ],
    [ "Je hoeft niet meteen te gaan."  => "You don't need to go at once." ],
    [ "Wat doet gij in uw vrije tijd?" => "What do you do in your free time?" ],
    [
        "Wat doet gij in uw vrije tijd?" => "What do you do in your spare time?"
    ],
    [
        "Denkt je echt erover niet te gaan?" =>
          "Are you seriously thinking about not going?"
    ],
    [ "Ik wil dat je een liedje zingt." => "I want you to sing a song." ],
    [
        "Hij is niet Amerikaans maar Engels." =>
          "He is not an American but an Englishman."
    ],
    [
        "Ik heb nog steeds niets gevonden." => "I still haven't found anything."
    ],
    [ "We moeten ons aan de wet houden."  => "We ought to obey the law." ],
    [ "Ik kon de hele nacht niet slapen." => "I couldn't sleep all night." ],
    [
        "Wie is de vrouw met de bruine jas?" =>
          "Who is that woman with the brown coat?"
    ],
    [
        "Maar ik kan hen niet te goed verstaan." =>
          "But I can't understand them very well."
    ],
    [
        "Heb je vandaag al in je dagboek geschreven?" =>
          "Have you written in your diary yet today?"
    ],
    [
        "Nog één uur en de kalkoen is klaar." =>
          "One more hour and the turkey will be ready."
    ],
    [
        "Wanneer kwam je uit Tokio terug?" =>
          "When did you come back from Tokyo?"
    ],
    [ "Ik ga een nieuwe auto kopen." => "I am going to buy a new car." ],
    [ "Ik ga een nieuwe auto kopen." => "I'm going to buy a new car." ],
    [ "Toen waren we jonger."        => "We were younger then." ],
    [ "Het ziet er naar uit dat het gaat regenen." => "It is likely to rain." ],
    [ "Ik was aan het roken."                      => "I was smoking." ],
    [ "De honden zijn in de tuin." => "The dogs are in the garden." ],
    [ "Kunt u me helpen?"          => "Could you help me?" ],
    [ "Kunt u me helpen?"          => "Can you help me?" ],
    [ "Wie is deze kerel?"         => "Who is this guy?" ],
    [
        "Hij die denkt genoeg te hebben geleerd, heeft niets geleerd." =>
          "He who thinks he has learned enough has learned nothing."
    ],
    [ "Wie woont in de kamer beneden?" => "Who lives in the room below?" ],
    [
        "Mijn klok loopt vijf minuten voor." => "My clock is five minutes fast."
    ],
    [ "Ik ben niet dik." => "I'm not fat." ],
    [ "Ik ben niet dik!" => "I'm not fat!" ],
    [
        "In Australië spreken ze Engels." =>
          "In Australia, they speak English."
    ],
    [
        "In Australië spreken ze Engels." => "In Australia, English is spoken."
    ],
    [
        "Ze spreken Engels in Australië." => "They speak English in Australia."
    ],
    [ "Ik ben er binnen een minuut." => "I'll be there in a minute." ],
    [ "Was je gisteravond moe?"      => "Were you tired last night?" ],
    [
        "Wij zijn hier lang genoeg geweest." => "We have been here long enough."
    ],
    [
        "Onze school is minder dan tien minuten lopen vanaf mijn huis." =>
          "Our school is within ten minutes' walk of my house."
    ],
    [ "Vinden andere mensen me leuk?" => "Do other people like me?" ],
    [ "Twijfel er nooit aan."         => "Don't ever doubt it." ],
    [ "Ik ken enkel zijn naam."       => "I only know him by name." ],
    [ "Geef me een precies antwoord." => "Give me a precise answer." ],
    [
        "Ze heeft deze pen bij die winkel gekocht." =>
          "She bought this pen at that store."
    ],
    [
        "Het is lang geleden sinds we elkaar voor het laatst zagen." =>
          "It's been a long time since we last saw each other."
    ],
    [
        "Het Engels is niet mijn moedertaal." =>
          "English is not my native language."
    ],
    [
        "Het Engels is niet mijn moedertaal." =>
          "English is not my mother tongue."
    ],
    [
        "Welke kleur heeft de auto die ze voor zichzelf gekocht heeft?" =>
          "What colour is the car which she bought for herself?"
    ],
    [
        "Mijn moeder heeft ons een interessant verhaal verteld." =>
          "My mother told us an interesting story."
    ],
    [ "Neem uw kinderen mee."      => "Bring your children along." ],
    [ "Regende het hier gisteren?" => "Did it rain here yesterday?" ],
    [
        "Ik bracht de hele dag door aan het strand." =>
          "I spent the entire day on the beach."
    ],
    [
        "Ze was afgelopen maand in Amerika." => "She was in America last month."
    ],
    [
        "Morgen breng ik de boeken naar de bibliotheek." =>
          "Tomorrow, I'll take the books to the library."
    ],
    [ "Hij voelde zich moe." => "He felt tired." ],
    [
        "Zijn huis is aan de overkant van de straat." =>
          "His house is across the street."
    ],
    [
        "Ik heb met mijn ouders gesproken over studeren in het buitenland." =>
          "I talked with my parents about my studying abroad."
    ],
    [ "Morgen is mijn vrije dag."     => "Tomorrow is my day off." ],
    [ "Wilt u thee of koffie?"        => "You want to drink tea or coffee?" ],
    [ "Tot morgen in de bibliotheek." => "See you tomorrow at the library." ],
    [ "Ik hou van zwemmen."           => "I like to swim." ],
    [ "Ik hou van zwemmen."           => "I like swimming." ],
    [
        "Ik kan goede verhalen schrijven als ik daar zin in heb." =>
          "I can write good stories when I feel like it."
    ],
    [
        "Mijn vader is maar vijftien jaar." =>
          "My father is only fifteen years old."
    ],
    [ "Ze kookt voor hem."             => "She cooks for him." ],
    [ "Een boek lezen is interessant." => "Reading a book is interesting." ],
    [
        "Niemand heeft ooit zoiets gezien." =>
          "No one had even seen something like it."
    ],
    [ "Ik heb drie honden." => "I have three dogs." ],
    [ "Ben je bezig?"       => "Are you busy?" ],
    [
        "En als we deze avond eens buiten gingen eten?" =>
          "How about eating out this evening?"
    ],
    [
        "Mijn vader speelt golf, maar niet goed." =>
          "My father does play golf, but not well."
    ],
    [ "Waar hebben jullie over gesproken?" => "What did you talk about?" ],
    [
        "Jij kan niet zwemmen, of toch?" => "You are not able to swim, are you?"
    ],
    [ "Eigenlijk is het uw fout."       => "Actually it's your fault." ],
    [ "Beide broers zijn nog in leven." => "Both brothers are still alive." ],
    [
        "In zekere zin is dat wat hij zegt waar." =>
          "In a sense what he says is true."
    ],
    [ "Gij zijt niet jonger dan ik." => "You are no younger than I am." ],
    [ "In welk jaar bent u geboren?" => "What year were you born?" ],
    [ "Ik ben gezond."               => "I'm healthy." ],
    [
        "Hij droeg haar bagage naar de trein." =>
          "He carried her luggage to the train."
    ],
    [ "Ik wil naar Tokyo gaan."         => "I want to go to Tokyo." ],
    [ "Hij doet het raam open."         => "He is opening the window." ],
    [ "Ik ben bijna een ander persoon." => "I'm almost another person." ],
    [
        "Ik ben ontgoocheld dat hij hier niet is." =>
          "I'm disappointed that he's not here."
    ],
    [
        "Ik ben een jaar geleden gestopt met roken." =>
          "I gave up smoking a year ago."
    ],
    [ "Ik ben het vergeten." => "I forgot it." ],
    [ "Ik ga beginnen."      => "I'm going to start." ],
    [ "Ik ga beginnen."      => "I am going to start." ],
    [
        "Je hebt weer dezelfde fout gemaakt." =>
          "You have made the very same mistake again."
    ],
    [
        "Haar moeder is vorig jaar overleden." =>
          "Her mother passed away last year."
    ],
    [
        "Ik vind het belangrijk om de waarheid te vertellen." =>
          "I think it's important to tell the truth."
    ],
    [ "Ik doe mijn best." => "I am doing my best." ],
    [
        "Een vreemde taal leren is makkelijk." =>
          "It is easy to learn a foreign language."
    ],
    [ "Waarom vraagt u dat?"              => "Why do you ask?" ],
    [ "Engels wordt hier niet gesproken." => "English is not spoken here." ],
    [ "Ik ben een Japanse lerares."       => "I'm a Japanese teacher." ],
    [ "Hij kan zijn hoed niet vinden."    => "He can't find his hat." ],
    [ "Het is dik aan tussen hen."        => "Those two are pretty close." ],
    [
        "Ze werd bleek toen ze het nieuws hoorde." =>
          "She turned pale when she heard that news."
    ],
    [
        "Wat is de mooiste plek van de wereld?" =>
          "What's the most beautiful place in the world?"
    ],
    [
        "Ze was druk bezig met haar huiswerk." =>
          "She was busy doing her homework."
    ],
    [ "Wilt ge koffie of thee?"       => "Would you like coffee or tea?" ],
    [ "Ik ben vandaag in Tokyo."      => "I am in Tokyo today." ],
    [ "Maak de zin af."               => "Complete the sentence." ],
    [ "Ik kan u niet te veel danken." => "I cannot thank you too much." ],
    [
        "Kan ik een glas water krijgen alstublieft?" =>
          "I'd like a glass of water, please."
    ],
    [
        "Mijn familie woont daar al twintig jaar." =>
          "My family has lived here for twenty years."
    ],
    [ "Ze speelt elke dag piano." => "She plays the piano every day." ],
    [
        "Waar het hart vol van is, loopt de mond van over." =>
          "What fills the heart, will flow over from the mouth."
    ],
    [
        "Ik ben zeer blij dat je dat plan aanvaard hebt." =>
          "I am very happy that you have agreed to that plan."
    ],
    [
        "Als antwoord sloeg hij mij op mijn hoofd." =>
          "His answer was to strike me on the head."
    ],
    [ "Ze vonden de film niet goed." => "They didn't like the film." ],
    [ "Ze vonden de film niet goed." => "They didn't like the movie." ],
    [
        "De dokter heeft mij gezegd dat ik moest stoppen met roken." =>
          "The doctor told me to give up smoking."
    ],
    [
        "Ik was alleen maar een douche aan het nemen." =>
          "I was just taking a shower."
    ],
    [ "Hoe was uw verjaardag?" => "How was your birthday?" ],
    [ "Hij is in Tokio."       => "He is in Tokyo." ],
    [ "Zij eet een appel."     => "She's eating an apple." ],
    [ "Hij is in Tokio."       => "He's in Tokyo." ],
    [ "Hij woont boven mij."   => "He lives above me." ],
    [ "Dat ben ik vergeten."   => "I forgot about that." ],
    [
        "Er is geen enkele wolk aan de hemel." =>
          "There's not a cloud in the sky."
    ],
    [
        "Er is geen enkele wolk aan de hemel." =>
          "There isn't a cloud in the sky."
    ],
    [ "We hebben hem leven gevonden." => "We found him alive." ],
    [ "Mag ik een kopje koffie?"      => "A cup of coffee, please." ],
    [ "Mag ik een kopje koffie?"      => "One cup of coffee, please." ],
    [ "Wij spreken allemaal Engels."  => "All of us talk in English." ],
    [
        "Wees niet bang om fouten te maken." =>
          "Don't be afraid of making mistakes."
    ],
    [
        "Het is waar dat hij de eerste prijs gewonnen heeft." =>
          "It is true that he won first prize."
    ],
    [
        "Het is duidelijk dat hij een groot kunstenaar is." =>
          "It is clear that he is a great artist."
    ],
    [ "Ik kan lopen." => "I'm able to run." ],
    [
        "Ik was verrast, zoveel mensen te zien op het concert." =>
          "I was surprised to see so many people at the concert."
    ],
    [
        "Hij praat alsof hij alles weet." =>
          "He talks as if he knows everything."
    ],
    [ "Zal je hen helpen?" => "Will you help them?" ],
    [
        "Laten we thuis blijven als het morgen regent." =>
          "If it rains tomorrow, let's stay home."
    ],
    [ "Dat versta ik niet." => "I don't understand it." ],
    [
        "Het is hoog tijd plaats te maken voor jongere mensen." =>
          "It's high time to make room for young people."
    ],
    [ "Waarom kwam je niet vroeger?" => "Why didn't you come sooner?" ],
    [
        "Hij weet bijna niets over dat dier." =>
          "He knows almost nothing about that animal."
    ],
    [
        "Hij kwam, hoewel ik hem gezegd had het niet te doen." =>
          "He came even though I told him not to."
    ],
    [ "Ik ben bang om te vallen."          => "I'm afraid to fall." ],
    [ "Ik wil in het buitenland studeren." => "I want to study abroad." ],
    [
        "Ik wil ergens naartoe gaan in Europa." =>
          "I want to go somewhere in Europe."
    ],
    [ "Ik kan u nauwelijks horen." => "I can hardly hear you." ],
    [ "De motor werkt niet goed."  => "The motor does not function properly." ],
    [ "De motor werkt niet goed."  => "The engine doesn't function properly." ],
    [
        "Je zal langer leven als je niet rookt." =>
          "You will live longer if you don't smoke."
    ],
    [ "Ga niet zonder hoed." => "Don't go without a hat." ],
    [
        "Als ik een vogel was, zou ik naar jou toe vliegen." =>
          "Were I a bird, I would fly to you."
    ],
    [
        "Als ik een vogel was, zou ik naar jou toe vliegen." =>
          "If I were a bird, I would fly to you."
    ],
    [ "Je werkt hard." => "You work hard." ],
    [
        "Ik vond haar kat in een lege kamer." =>
          "I found her cat in an empty room."
    ],
    [
        "Mijn moeder maakt het ontbijt klaar." =>
          "My mother is cooking breakfast."
    ],
    [
        "Ik ben nog nooit in Engeland geweest." =>
          "I have never been to England."
    ],
    [ "Ik hou van klassieke muziek." => "I like classical music." ],
    [
        "Verveel je je niet wanneer je alleen bent?" =>
          "Don't you get bored when you're alone?"
    ],
    [
        "Je kan door de bomen het bos niet zien." =>
          "You can't see the forest for the trees."
    ],
    [
        "Het punt is dat ze honger hebben." =>
          "The point is that they are hungry."
    ],
    [ "Haar vader is overleden." => "Her father died." ],
    [
        "Ik wil deze namiddag niet buiten gaan." =>
          "I don't want to go outside this afternoon."
    ],
    [ "Ik koop een nieuwe auto."    => "I am buying a new car." ],
    [ "Kan jij mij wat geld geven?" => "Can you give me some money?" ],
    [
        "We keken allemaal uit het raam." =>
          "All of us looked through the window."
    ],
    [
        "Zijn zoon is het afgelopen jaar gestorven." =>
          "His son died last year."
    ],
    [
        "Laat gij uw kinderen koffie drinken?" =>
          "Do you let your children drink coffee?"
    ],
    [ "De film duurde twee uur."    => "The film lasted 2 hours." ],
    [ "De kinderen waren erg stil." => "The children were being very quiet." ],
    [ "Heb je de sleutels nodig?"   => "Do you need the keys?" ],
    [ "Je mag kiezen welke je wilt" => "You may choose whichever you like." ],
    [ "Heeft u ook bier?"           => "Have you got any beer?" ],
    [ "Zoek je een baan?"           => "Are you looking for a job?" ],
    [
        "Deze auto is het niet waard gerepareerd te worden." =>
          "This car isn't worth repairing."
    ],
    [
        "Ze vertelde me een interessant verhaal." =>
          "She told me an interesting story."
    ],
    [ "Ik zat naast hem."           => "I sat next to him." ],
    [ "Ik heb veel over u gehoord." => "I've heard a lot about you." ],
    [
        "Het is niet licht genoeg om foto's te nemen." =>
          "There is insufficient light to take pictures."
    ],
    [
        "Dit is de kerk waarin we getrouwd zijn." =>
          "This is the church where we got married."
    ],
    [
        "Hij nam zijn pen en begon te schrijven." =>
          "He took up his pen and began to write."
    ],
    [
        "Misschien kan iemand anders ons helpen." =>
          "Maybe someone else can help us."
    ],
    [ "Zijt ge niet gelukkig?"        => "Aren't you happy?" ],
    [ "Ik kom meteen naar je toe."    => "I'll come to you straight away." ],
    [ "Ik luister graag naar muziek." => "I like listening to music." ],
    [
        "Ik breng je wel naar het vliegveld." =>
          "I'll drive you to the airport."
    ],
    [
        "Ik kon geen contact krijgen met hem." =>
          "I couldn't get in touch with him."
    ],
    [
        "Ik zal je een fiets voor je verjaardag geven." =>
          "I will give you a bicycle for your birthday."
    ],
    [
        "Voor je verjaardag zal ik je een fiets geven." =>
          "I will give you a bicycle for your birthday."
    ],
    [ "Ik heb niemand die mij helpt." => "I have no one to help me." ],
    [ "Ik zoek een baan."             => "I'm looking for a job." ],
    [ "Eerlijk gezegd, haat ik hem."  => "Frankly speaking, I hate him." ],
    [ "Vreemd dat niemand ons kent."  => "It's strange that nobody knows us." ],
    [ "Je zou je belofte moeten houden." => "You should keep your promise." ],
    [ "Ik zal u mijn verhaal vertellen." => "I'll tell you my story." ],
    [
        "Hoeveel talen zijn er in Europa?" =>
          "How many languages are there in Europe?"
    ],
    [
        "Je zoon is bijna een kopie van je vader." =>
          "Your son is almost the copy of your father."
    ],
    [ "Zal je me de waarheid vertellen?"     => "Will you tell me the truth?" ],
    [ "Hij vroeg om mijn raad."              => "He asked for my advice." ],
    [ "Mijn oom heeft mij een boek gegeven." => "My uncle gave me a book." ],
    [
        "Ik heb al met deze student gesproken." =>
          "I already talked to this student."
    ],
    [
        "Ik heb al met deze student gesproken." =>
          "I've already talked to this student."
    ],
    [ "Ge moet alleen hard werken." => "You only have to work hard." ],
    [ "De zon schijnt niet altijd." => "The sun doesn't always shine." ],
    [ "Ik ben zo dik."              => "I'm so fat." ],
    [ "Wat wilt ge drinken?"        => "What would you like to drink?" ],
    [
        "Als ik nog één zin over tennis hoor, word ik gek." =>
          "If I hear one more sentence about tennis, I'll go crazy."
    ],
    [ "Ik geef niet om mijn toekomst." => "I don't care about my future." ],
    [
        "Hij studeert Engels, maar hij studeert ook Duits." =>
          "He studies English, but he also studies German."
    ],
    [ "Ik studeer graag Engels." => "I like studying English." ],
    [ "Ik studeer graag Engels." => "I like to study English." ],
    [ "Dit is erg lekker."       => "This is really delicious." ],
    [
        "Kinderen zouden elke dag melk moeten drinken." =>
          "Children should drink milk every day."
    ],
    [
        "Een van de appels viel op de grond." =>
          "One of the apples fell to the ground."
    ],
    [
        "Geloof je in het bestaan van God?" =>
          "Do you believe in the existence of God?"
    ],
    [ "Ik zal jou dit boek geven."     => "I will give you this book." ],
    [ "Ik kan geen bier meer drinken." => "I can't drink any more beer." ],
    [ "Het ligt onder de stoel."       => "It is under the chair." ],
    [ "Het raam is open."              => "The window is open." ],
    [
        "Hij kan niks zien zonder zijn bril." =>
          "He cannot see anything without his glasses."
    ],
    [
        "Ze heeft iemand nodig die haar kan verstaan." =>
          "She needs someone who is able to understand her."
    ],
    [
        "Deze theorie is voor mij te moeilijk om te verstaan." =>
          "This theory is too difficult for me to comprehend."
    ],
    [ "School begint in de lente." => "School begins in spring." ],
    [
        "In Australië spreekt men Engels." =>
          "In Australia, they speak English."
    ],
    [
        "In Australië spreekt men Engels." =>
          "They speak English in Australia."
    ],
    [
        "In Australië spreekt men Engels." =>
          "In Australia, one speaks English."
    ],
    [
        "Iemand anders moet gezien hebben wat er gebeurde." =>
          "Someone else must have seen what happened."
    ],
    [
        "Ze klaagde dat het te heet was in de kamer." =>
          "She complained that it was too hot in the room."
    ],
    [ "Hij houdt van zwemmen."        => "He likes to swim." ],
    [ "Je hebt de verkeerde persoon." => "You’ve got the wrong person." ],
    [ "Wat voor soort fruit wil je?"  => "What kind of fruit do you want?" ],
    [ "Ik geef je vijf dollar."       => "I'll give you five dollars." ],
    [ "Wanneer heb je leren zwemmen?" => "When did you learn to swim?" ],
    [ "We zagen hem nergens."         => "We didn't see him anywhere." ],
    [ "Wanneer is uw verjaardag?"     => "When's your birthday?" ],
    [
        "Er zijn veel goede redenen om het niet te doen." =>
          "There are many good reasons not to do it."
    ],
    [
        "Ik heb het boek van het laatste semester nog steeds." =>
          "I still have the book from last semester."
    ],
    [
        "Een klein dorp groeide uit tot een grote stad." =>
          "A small village grew into a large city."
    ],
    [
        "De oude man viel op de grond." =>
          "The old man fell down on the ground."
    ],
    [
        "Ik heb vandaag niet genoeg tijd om te lunchen." =>
          "I don't have enough time to eat lunch today."
    ],
    [
        "Ik denk dat ze over de zestig is." =>
          "I should think she is over sixty."
    ],
    [ "Waarom is ze zo stil?" => "Why is she so silent?" ],
    [
        "Zijt ge gestopt aan het rood licht?" =>
          "Did you stop at the red light?"
    ],
    [ "De jongen liep weg." => "The boy ran away." ],
    [ "Ik heb twee auto's." => "I have two cars." ],
    [
        "De stoel staat dicht bij de deur." => "The chair is close to the door."
    ],
    [
        "Ik weet niet of hij dood of levend is." =>
          "I don't know whether he is dead or alive."
    ],
    [
        "Uw vrienden zullen u missen wanneer u weg bent." =>
          "You will be missed by your friends when you're gone."
    ],
    [ "Mijn oom gaf hem een geschenk." => "My uncle gave him a present." ],
    [
        "Ze vroeg me hoeveel talen ik sprak." =>
          "She asked me how many languages I spoke."
    ],
    [
        "Ga niet naar buiten, het regent hard." =>
          "Don't go outside. It's raining hard."
    ],
    [ "De mens is een wolf voor de mens." => "Man is a wolf to man." ],
    [
        "Er is niets zo waardevol als de liefde." =>
          "There's nothing as precious as love."
    ],
    [ "Een mens moet werken."            => "A man must work." ],
    [ "Zij deed mee aan de wedstrijd."   => "She took part in the contest." ],
    [ "We keken allemaal door het raam." => "We all looked out the window." ],
    [
        "Het is jammer dat hij niet met haar kan trouwen." =>
          "It's a pity that he can't get married to her."
    ],
    [
        "Ik heb van hem gehoord, maar ik ken hem niet persoonlijk." =>
          "I know of him, but I don't know him personally."
    ],
    [
        "Ik heb van hem gehoord, maar ik ken hem niet persoonlijk." =>
          "I've heard of him, but I don't know him personally."
    ],
    [
        "Ik heb van hem gehoord maar ik ken hem niet persoonlijk." =>
          "I've heard of him, but I don't know him personally."
    ],
    [
        "Gewoonlijk zegt men dat vrouwen langer leven dan mannen." =>
          "They usually say that women live longer than men."
    ],
    [
        "Mannen en vrouwen hebben elkaar nodig." =>
          "Men and women need each other."
    ],
    [
        "Naar mijn mening is Duits de beste taal ter wereld." =>
          "In my opinion, German is the best language in the world."
    ],
    [
        "Er viel een koude regen in de stad." =>
          "A cold rain fell over the city."
    ],
    [
        "Waarom kan ik niet zingen zoals zij?" =>
          "Why can't I sing like they can?"
    ],
    [ "De berg is bedekt met sneeuw." => "The mountain is covered with snow." ],
    [
        "Ik speelde vaak honkbal toen ik jong was." =>
          "I often played baseball when I was young."
    ],
    [ "Hij is aanwezig op de vergadering." => "He is present at the meeting." ],
    [ "Hij deed wat hem gevraagd werd."    => "He did what he had been told." ],
    [
        "Jouw ogen doen me denken aan sterren." =>
          "Your eyes remind me of stars."
    ],
    [
        "Hij deed grote moeite mij te helpen." =>
          "He went out of his way to assist me."
    ],
    [ "De zomer is voorbij." => "Summer is gone." ],
    [ "De zomer is voorbij." => "The summer is over." ],
    [ "Ze zat naast me."     => "She sat next to me." ],
    [ "De zomer is voorbij." => "Summer is over." ],
    [ "De zomer is voorbij." => "Summer has ended." ],
    [
        "Je had je moeten voorstellen." =>
          "You should have introduced yourself."
    ],
    [ "Ik wil nog wat langer slapen." => "I want to sleep a little longer." ],
    [
        "Hij vroeg me waar mijn oom woonde." =>
          "He asked me where my uncle lived."
    ],
    [
        "Een, twee, drie, vier, vijf, zes, zeven, acht, negen, tien." =>
          "One, two, three, four, five, six, seven, eight, nine, ten."
    ],
    [
        "Hij ziet het bos niet door al die bomen." =>
          "He can't see the forest for the trees."
    ],
    [
        "Hij ziet het bos niet door al die bomen." =>
          "Because of these trees, he can't see the forest."
    ],
    [
        "Hij ziet het bos niet door al die bomen." =>
          "The trees don't let him see the forest."
    ],
    [
        "Kom niet te dicht bij het vuur." => "Don't come too close to the fire."
    ],
    [ "Bel mij af en toe." => "Call me once in a while." ],
    [ "Bel mij af en toe." => "Call me now and then." ],
    [ "Wat een warme dag!" => "What a hot day it is!" ],
    [
        "Ik zal morgenochtend op je wachten op het station." =>
          "I'll be waiting for you at the station tomorrow morning."
    ],
    [
        "Houd het medicijn uit de buurt van kinderen." =>
          "Keep the medicine away from children."
    ],
    [
        "Heb je gewoonlijk thee voor het ontbijt?" =>
          "Do you usually have tea for breakfast?"
    ],
    [
        "Ik heb een afspraak met de dokter." =>
          "I have an appointment with the doctor."
    ],
    [
        "Een jongen van zeventien is vaak even groot als zijn vader." =>
          "A boy of seventeen is often as tall as his father."
    ],
    [
        "Het is moeilijk om uit bed te komen op koude morgens." =>
          "It's difficult to get out of bed on cold mornings."
    ],
    [
        "Ik breng u wel naar het vliegveld." => "I'll drive you to the airport."
    ],
    [
        "Mijn moeder kocht een gele paraplu voor mijn broer." =>
          "Mother bought my brother a yellow umbrella."
    ],
    [
        "Mijn moeder kocht een gele paraplu voor mijn broer." =>
          "My mother bought my brother a yellow umbrella."
    ],
    [ "Hij is gisteren overleden." => "He died yesterday." ],
    [ "Hij is gisteren overleden." => "He passed away yesterday." ],
    [ "Hij is gisteren overleden." => "He deceased yesterday." ],
    [ "Hij kan nauwelijks lezen."  => "He can barely read." ],
    [
        "Heb je gezegd dat ik nooit zou kunnen winnen?" =>
          "Did you say that I could never win?"
    ],
    [
        "Ik wist niet waar het vandaan kwam." =>
          "I didn't know where it came from."
    ],
    [
        "Ik vond het vreemd dat hij niet was komen opdagen." =>
          "I thought it was strange that he didn't turn up."
    ],
    [ "Het zal vlug dag worden." => "Day will break soon." ],
    [
        "Ik ben niet gewoon voor een publiek te spreken." =>
          "I'm not used to speaking in public."
    ],
    [ "Doe de deur dicht." => "Close the door." ],
    [
        "We zijn van plan morgen te gaan wandelen." =>
          "We plan to go hiking tomorrow."
    ],
    [ "De fles is van glas."       => "The bottle is made of glass." ],
    [ "Zij kan heel goed zingen."  => "She can sing very well." ],
    [ "Jouw dochter is zeer mooi." => "Your daughter is very pretty." ],
    [
        "Russisch is erg moeilijk te leren." =>
          "Russian is very difficult to learn."
    ],
    [
        "Ze zijn zes maanden geleden getrouwd." =>
          "They got married six months ago."
    ],
    [
        "De kinderen vonden de film niet leuk." =>
          "The children didn't like the movie."
    ],
    [
        "De kinderen vonden de film niet leuk." =>
          "The children didn't like the film."
    ],
    [
        "Ik heb geen geld meer in m'n portemonnee." =>
          "I have no more money in my wallet."
    ],
    [ "Ik heb liever vlees dan vis." => "I like meat better than fish." ],
    [ "Ik heb liever vis dan vlees." => "I prefer fish to meat." ],
    [ "Wilt u iets drinken?"         => "Would you like to drink anything?" ],
    [
        "Om jou de waarheid te vertellen, ik ben jouw pen verloren." =>
          "To tell you the truth, I lost your pen."
    ],
    [
        "Dit is wat ik gekocht heb in Spanje." =>
          "This is what I bought in Spain."
    ],
    [ "Hij heeft twee auto's."          => "He has two cars." ],
    [ "De school begint om half negen." => "School begins at eight-thirty." ],
    [
        "De school begint om half negen." => "School begins at half past eight."
    ],
    [ "De school begint om half negen." => "School begins at 8:30 a.m." ],
    [
        "Waarom vertel je me dit allemaal?" =>
          "Why are you telling me all this?"
    ],
    [ "Welk jaar is het?" => "What year is it?" ],
    [
        "Dat liedje doet me aan thuis denken." =>
          "That song reminds me of my home."
    ],
    [
        "Bij mij thuis drinken we veel bier." =>
          "In my house we drink a lot of beer."
    ],
    [ "Kom en schrijf uw naam." => "Come and write your name." ],
    [
        "Hij laat altijd het venster open als hij slaapt." =>
          "He always leaves the window open when he sleeps."
    ],
    [ "Ik zit dikwijls in de problemen." => "I'm often in trouble." ],
    [ "Ik groeide op in de bergen."      => "I grew up in the mountains." ],
    [
        "Als het morgen regent, blijven we thuis." =>
          "If it rains tomorrow, we'll stay at home."
    ],
    [
        "Hij kwam pas toen ik belde." =>
          "It was not until I called that he came."
    ],
    [
        "Londen is een van de grootste steden van de wereld." =>
          "London is one of the largest cities in the world."
    ],
    [
        "Hij schijnt lange tijd ziek te zijn geweest." =>
          "He seems to have been ill for a long time."
    ],
    [ "Laten we in de rivier zwemmen." => "Let's go and swim in the river." ],
    [
        "Parijs is de hoofdstad van Frankrijk." =>
          "Paris is the capital of France."
    ],
    [ "Hij eet niets anders dan fruit." => "He eats nothing more than fruit." ],
    [ "Hij eet niets anders dan fruit." => "He eats nothing but fruit." ],
    [
        "Hij eet niets anders dan fruit." =>
          "He doesn't eat anything other than fruit."
    ],
    [
        "Deze foto herinnert me aan toen ik een student was." =>
          "This picture reminds me of when I was a student."
    ],
    [ "De hele wereld kijkt toe."      => "The whole world is watching." ],
    [ "Ik ken haar adres."             => "I know her address." ],
    [ "Heb je een rood potlood?"       => "Do you have a red pencil?" ],
    [ "Je rijdt te snel."              => "You're driving too fast." ],
    [ "Je bent te jong om te trouwen." => "You're too young to marry." ],
    [ "Doe de deur open alstublieft."  => "Open the door, please." ],
    [
        "Ik hou meer van appels dan van sinaasappels." =>
          "I like apples more than oranges."
    ],
    [ "Op maandag is hij altijd thuis." => "On Mondays, he's always at home." ],
    [ "Op maandag is hij altijd thuis." => "He's always at home on Mondays." ],
    [ "Ik ben opgegroeid in de bergen." => "I grew up in the mountains." ],
    [ "Doe de televisie uit alstublieft."   => "Please turn off the TV." ],
    [ "Deze pen schrijft niet goed."        => "This pen doesn't write well." ],
    [ "Ik krijg wat ik wil."                => "I get anything I want." ],
    [ "Wat heb je afgelopen zondag gedaan?" => "What did you do last Sunday?" ],
    [
        "Vroeg in de morgen heb ik een wandeling gedaan." =>
          "I went for a walk early in the morning."
    ],
    [ "Soms droom ik over thuis."     => "I sometimes dream of home." ],
    [ "Zijn verhaal was interessant." => "His story was interesting." ],
    [ "Zijt ge zeker?"                => "Are you sure?" ],
    [
        "Hoeveel moeite kost het om aan je eerste baan te komen?" =>
          "How much effort does it take to get your first job?"
    ],
    [
        "De aarde is kleiner dan de zon." =>
          "The earth is smaller than the sun."
    ],
    [
        "Iedereen kan zijn eigen naam schrijven." =>
          "Anyone can write his own name."
    ],
    [
        "Ik heb het zo vlug mogelijk nodig." =>
          "I need it as quickly as possible."
    ],
    [
        "Ik ging gisteren naar de dierentuin." => "I went to the zoo yesterday."
    ],
    [ "Ik wil een nieuwe fiets kopen." => "I want to buy a new bicycle." ],
    [ "Ze was echt onder de indruk."   => "She was really impressed." ],
    [ "Mijn broer woont in Tokio."     => "My brother lives in Tokyo." ],
    [
        "De wens is de vader van de gedachte." =>
          "Necessity is the mother of invention."
    ],
    [
        "De wens is de vader van de gedachte." =>
          "The desire is the father of the thought."
    ],
    [ "Water is onmisbaar voor het leven." => "Water is essential to life." ],
    [ "Wiens boek is dit?"                 => "Whose book is this?" ],
    [ "Ik denk dat ze jou gebruiken."      => "I think they're using you." ],
    [
        "Ik bezocht Parijs een lange tijd geleden." =>
          "I visited Paris a long time ago."
    ],
    [
        "Mijn beste vriend geeft me altijd goede raad." =>
          "My best friend always gives me good advice."
    ],
    [
        "De oude man is vorige week overleden." => "The old man died last week."
    ],
    [ "Breng hem naar binnen." => "Bring him in." ],
    [ "Lucht die schoenen!"    => "Air those shoes!" ],
    [
        "Men kan deze deur op geen enkele manier open krijgen." =>
          "This door can't be opened in any way."
    ],
    [
        "Vrouwen leven over het algemeen langer dan mannen." =>
          "Women generally live longer than men."
    ],
    [
        "Vrouwen leven over het algemeen langer dan mannen." =>
          "Women tend to live longer than men."
    ],
    [ "Hij vroeg me waarom ik lachte." => "He asked me why I was laughing." ],
    [
        "Ze was erg bezorgd om de gezondheid van haar man." =>
          "She was very worried about her husband's health."
    ],
    [ "Ge drinkt te veel koffie."     => "You drink too much coffee." ],
    [ "Ze zullen nooit akkoord gaan." => "They will never agree." ],
    [
        "Ik zou je graag om een gunst vragen." =>
          "I'd like to ask a favor of you."
    ],
    [
        "Ze zei dat ze elke ochtend een douche nam." =>
          "She said that she takes a shower every morning."
    ],
    [ "Ik zal een nieuwe kopen."     => "I'll buy a new one." ],
    [ "Hij is bijna zes voet groot." => "He is almost six feet tall." ],
    [
        "Ik ben te lui om mijn huiswerk te maken." =>
          "I'm too lazy to do my homework."
    ],
    [ "Vertel eens waar je aan denkt."  => "Tell me what you're thinking." ],
    [ "Maak nu je huiswerk."            => "Do your homework right now." ],
    [ "We hadden thuis moeten blijven." => "We should have stayed at home." ],
    [
        "Hij vertrekt naar school om zeven uur." =>
          "He leaves for school at seven."
    ],
    [
        "Hoeveel dagen kost het meestal om daar te komen?" =>
          "How many days does it usually take to get there?"
    ],
    [
        "Er is slechts één ding dat we kunnen doen nu!" =>
          "There's only one thing we can do now!"
    ],
    [
        "Welk verschil is er tussen een dorp en een stad?" =>
          "What's the difference between a village and a town?"
    ],
    [ "Ze is een heel grappig meisje." => "She's a very very funny girl." ],
    [
        "Ik vond het moeilijk om vriendelijk te zijn tegen anderen." =>
          "I found it difficult to be kind to others."
    ],
    [ "Geef me alstublieft nog een kans." => "Please give me another chance." ],
    [ "Ik heb hier een heleboel vrienden." => "I have a lot of friends here." ],
    [
        "Gisteren heb ik een erg interessant verhaal gelezen." =>
          "Yesterday, I read a really interesting story."
    ],
    [ "Deze honden zijn groot."  => "These dogs are big." ],
    [ "Tot morgen op kantoor."   => "See you tomorrow in the office." ],
    [ "China is een groot land." => "China is a large country." ],
    [
        "Waar heb je die sleutel gevonden?" =>
          "Where was it that you found this key?"
    ],
    [
        "We hopen dat je snel beter wordt." =>
          "We are hoping for your quick recovery."
    ],
    [ "Ze maakte weer dezelfde fout." => "She made the same mistake again." ],
    [
        "Dit was precies wat hij zocht." =>
          "He was looking for this very thing."
    ],
    [
        "Ik leerde hem drie jaar geleden kennen." =>
          "I first met him three years ago."
    ],
    [
        "Je moet niet kwaad spreken over andere jongens in zijn klas." =>
          "You must not speak ill of other boys in his class."
    ],
    [ "Je bent echt niet dom." => "You're really not stupid." ],
    [ "Laten we er één nemen." => "Let's get one." ],
    [
        "Zodra hij alleen was, opende hij de brief." =>
          "The moment he was alone, he opened the letter."
    ],
    [
        "Zodra hij alleen was, opende hij de brief." =>
          "As soon as he was left alone, he opened the letter."
    ],
    [
        "Ik heb één broer en twee zussen." =>
          "I've got one brother and two sisters."
    ],
    [
        "Ik heb één broer en twee zussen." =>
          "I have one brother and two sisters."
    ],
    [
        "Slaap is nodig voor een goede gezondheid." =>
          "Sleep is necessary for good health."
    ],
    [ "Hij kan snel zwemmen." => "He can swim fast." ],
    [
        "Ik zou met iemand zoals haar willen trouwen." =>
          "I would like to marry somebody like her."
    ],
    [ "Alle mensen moeten sterven."   => "All men must die." ],
    [ "Mijn dochter wil een piano."   => "My daughter wants a piano." ],
    [ "Hij is geen arts maar leraar." => "He is not a doctor but a teacher." ],
    [ "Welke neem jij?"               => "Which do you take?" ],
    [
        "De twee bergen zijn even hoog." =>
          "The two mountains are of equal height."
    ],
    [ "Mijn vrienden noemen me Ken."        => "My friends call me Ken." ],
    [ "Het is je favoriete liedje."         => "It's your favorite song." ],
    [ "De appel valt niet ver van de boom." => "Like breeds like." ],
    [
        "De appel valt niet ver van de boom." =>
          "The apple does not fall far from the tree."
    ],
    [
        "De appel valt niet ver van de boom." =>
          "The apple does not fall far from the trunk."
    ],
    [
        "De appel valt niet ver van de boom." =>
          "The apple doesn't fall far from the tree."
    ],
    [ "We zijn buiten gevaar." => "We are out of danger." ],
    [ "Is dat te koop?"        => "Is that for sale?" ],
    [
        "Mijn vader kwam vannacht laat thuis." =>
          "My father got home late last night."
    ],
    [ "Ik heb geen flauw idee." => "I don't have the faintest idea." ],
    [
        "Ge moet u enkele dagen stil houden." =>
          "You must keep quiet for a few days."
    ],
    [ "De lucht wordt donker." => "The sky is getting dark." ],
    [ "Zwart staat je goed."   => "Black becomes you." ],
    [ "Ik heb geen toekomst."  => "I have no future." ],
    [
        "Ze kan beter zingen dan wie ook in haar klas." =>
          "She can sing better than anybody else in her class."
    ],
    [ "Ik schrijf liever aan elkaar."  => "I prefer to write in cursive." ],
    [ "Laat ons naar beneden gaan."    => "Let's go down." ],
    [ "Laten we naar het meer rijden." => "Let's drive to the lake." ],
    [
        "We keken uit het raam, maar zagen niks." =>
          "We looked out the window but saw nothing."
    ],
    [
        "Je blijft keer op keer dezelfde fouten maken." =>
          "You continue making the same mistakes time after time."
    ],
    [
        "Ze draagt nu al een maand dezelfde hoed." =>
          "She's been wearing the same hat for a month."
    ],
    [
        "Niemand wordt gelukkig van oorlog." =>
          "War doesn't make anybody happy."
    ],
    [ "We hebben elkaar gisteren gesproken." => "We spoke yesterday." ],
    [ "Maak je niet druk over de prijs." => "Don't think about the price." ],
    [ "Hij kan geen auto kopen."         => "He isn't able to buy a car." ],
    [ "Hij kan geen auto kopen."         => "He can't buy a car." ],
    [ "Zij geeft ons de schuld."         => "She blames us." ],
    [ "Ik sliep met mijn kleren aan."    => "I slept with my clothes on." ],
    [ "Haar geloof in God is erg sterk." => "Her belief in God is very firm." ],
    [
        "Ik kijk ernaar als ik terug kom." =>
          "I'll look it over after I come back."
    ],
    [ "Waarom belde je me?"          => "Why did you call me?" ],
    [ "Zijn beide ouders zijn dood." => "Both his parents are dead." ],
    [
        "Het is gevaarlijk om zo snel te rijden." =>
          "It is dangerous to drive so fast."
    ],
    [ "Wilt u nog een kopje thee?"   => "Will you have another cup of tea?" ],
    [ "Ik wil graag een kop koffie." => "I'd like a cup of coffee." ],
    [ "Ik moet onder de douche."     => "I need to take a shower." ],
    [ "Hij is de grootste jongen"    => "He is the tallest boy." ],
    [
        "Dat is niet echt een verrassing toch?" =>
          "It's not much of a surprise, is it?"
    ],
    [ "Wij zullen je helpen, goed?"    => "We'll help you, okay?" ],
    [ "Zij houdt van vissen."          => "She loves to fish." ],
    [ "Waarom wil je deze boek kopen?" => "Why do you want to buy this book?" ],
    [
        "Doe het raam op slot voor je naar bed gaat." =>
          "Lock the window before going to bed."
    ],
    [
        "Ik geloof niet dat zij het zou verstaan." =>
          "I don't believe she would understand it."
    ],
    [
        "Heb jij ooit al een beer in de bergen gezien?" =>
          "Have you ever seen a bear in the mountain?"
    ],
    [
        "Ze vroeg me vijf gedichten te lezen." => "He asked me to read 5 poems."
    ],
    [
        "Ze vroeg me vijf gedichten te lezen." =>
          "She asked me to read 5 poems."
    ],
    [ "Mijn beide ouders zijn dood." => "My parents are both dead." ],
    [ "Mijn beide ouders zijn dood." => "Both of my parents are dead." ],
    [
        "Ik zal mijn woord houden, wat er ook gebeurt." =>
          "I'll keep my word, whatever may happen."
    ],
    [
        "Het spijt me dat ik je zoveel problemen heb bezorgd." =>
          "I'm sorry to have caused you so much trouble."
    ],
    [
        "Hoe weet je dat licht sneller is dan geluid?" =>
          "How do you know that light travels faster than sound?"
    ],
    [
        "Toen ze jong was, was ze zeer populair." =>
          "When she was young, she was very popular."
    ],
    [
        "Maar hoe ga je beslissen wat belangrijk is en wat niet?" =>
          "But how are you going to decide what is important, and what isn't?"
    ],
    [
        "Kun je me laten zien hoe je deze camera gebruikt?" =>
          "Will you show me how to use this camera?"
    ],
    [ "Ik geef niet om bier." => "I don't care for beer." ],
    [
        "Ik was verliefd op het eerste gezicht." =>
          "I fell in love at the first glance."
    ],
    [
        "Mijn moeder wil dat ik in Zwitserland ga studeren." =>
          "My mom wants me to study in Switzerland."
    ],
    [ "Ze is op weg naar Thailand." => "She set out for Thailand." ],
    [
        "Er waren geen rozen in de tuin." =>
          "There weren't any roses in the garden."
    ],
    [
        "Ik heb Frans geleerd in plaats van Duits." =>
          "I learned French instead of German."
    ],
    [ "Ik vind deze blauwe jurk leuk."   => "I like this blue dress." ],
    [ "We werden onmiddellijk vrienden." => "We immediately became friends." ],
    [ "Je kon niet kiezen."              => "You couldn't choose." ],
    [ "Je kon niet kiezen."              => "You could not choose." ],
    [
        "Er is hier niet genoeg ruimte voor veertig mensen." =>
          "There isn't enough space here for forty people."
    ],
    [
        "Er is hier niet genoeg ruimte voor veertig mensen." =>
          "There's not enough space here for 40 people."
    ],
    [
        "Zeg me waar ik ben, en wat er gebeurt, alsjeblieft." =>
          "Tell me where I am, and what's going on, oh please."
    ],
    [
        "Ik zei hem wat te doen maar hij wou niet luisteren." =>
          "I told him what to do, but he wouldn't listen."
    ],
    [
        "Weet jij in welk dorp hij geboren is?" =>
          "Do you know the town where he was born?"
    ],
    [ "Ze ging naar de kapper." => "She went to the hairdresser's." ],
    [
        "Hij sloot de deur en ging naar boven." =>
          "He closed the door and went to the top."
    ],
    [
        "Deze film is geschikt voor kinderen." =>
          "This movie is suitable for children."
    ],
    [ "Hoe ging je toespraak?" => "How did your speech go?" ],
    [
        "Ze zijn altijd vroeg wakker, zelfs op zondag." =>
          "They always wake up early, even on Sundays."
    ],
    [
        "Waar kan ik een kaart van Europa kopen?" =>
          "Where can I go to get a map of Europe?"
    ],
    [ "Het glas is vol melk." => "The glass is full of milk." ],
    [
        "Zij vroeg haar zoon een minuut te wachten." =>
          "She told her son to wait a minute."
    ],
    [
        "Ik ga je voorstellen aan mijn familie." =>
          "I am going to introduce you to my family."
    ],
    [
        "Het was zijn schuld niet, want hij deed zijn best." =>
          "It was not his fault, for he did his best."
    ],
    [ "Ze sprak mij aan in het Spaans." => "She spoke to me in Spanish." ],
    [
        "Wat zal je doen wanneer je volwassen bent?" =>
          "What will you do when you grow up?"
    ],
    [
        "Ik glimlach elke keer als ik haar zie." =>
          "I smile every time I see her."
    ],
    [
        "Ik had bijna mijn paraplu in de trein laten liggen." =>
          "I almost left my umbrella in the train."
    ],
    [
        "Als je nu niet begint, zul je te laat zijn." =>
          "If you don't start at once, you will be late."
    ],
    [
        "Een mens leeft niet van brood alleen." =>
          "Man does not live by bread alone."
    ],
    [ "Ik denk dat het klopt."         => "I think it's OK." ],
    [ "Mijn ouders zijn allebei dood." => "My parents are both dead." ],
    [
        "Wilt u me uw paspoort even laten zien alstublieft?" =>
          "Will you show me your passport, please?"
    ],
    [ "Waar is de bibliotheek?" => "Where is the library?" ],
    [ "Het is een pop."         => "It's a doll." ],
    [
        "Ze zag eruit alsof ze lange tijd ziek geweest was." =>
          "She looked as if she had been sick for a long time."
    ],
    [
        "Ik was zeer onder de indruk van zijn toespraak." =>
          "I was much impressed by his speech."
    ],
    [
        "Bussen in het land komen gewoonlijk niet op tijd." =>
          "Buses in the country do not usually come on time."
    ],
    [
        "Bussen in het land komen gewoonlijk niet op tijd." =>
          "Buses in the country don't usually come on time."
    ],
    [
        "Deze kamer is niet geschikt om in te slapen." =>
          "This room is not suitable for sleeping."
    ],
    [ "Ik ben elke avond thuis." => "I am at home every evening." ],
    [
        "Ik kan niet snel wandelen, maar wel lang." =>
          "I can't walk fast, but I can walk for a long time."
    ],
    [
        "Ik ben aan het lunchen met mijn zus." =>
          "I am eating lunch with my sister."
    ],
    [ "Mijn zus speelt met een pop." => "My sister is playing with a doll." ],
    [
        "Ik zal je een goed advies geven." =>
          "I'll give you a piece of good advice."
    ],
    [
        "Ik zal je een goed advies geven." =>
          "I'll give you a good piece of advice."
    ],
    [
        "Ik ging naar de dierentuin met mijn zuster." =>
          "I went to the zoo with my sister."
    ],
    [
        "Er stond een verlaten auto naast de rivier." =>
          "There was an abandoned car by the river."
    ],
    [ "We zullen je heel erg missen."   => "We will miss you badly." ],
    [ "Het gerucht bleek waar te zijn." => "The rumor proved true." ],
    [ "Kom je hier elke avond?"         => "Do you come here every night?" ],
    [ "Ik eet geen vlees."              => "I don't eat meat." ],
    [
        "Ik zou hem niet willen ontmoeten in een donkere plaats." =>
          "I wouldn't like to meet him in a dark place."
    ],
    [
        "De lente is voorbij en de zomer begint." =>
          "Spring has passed and summer starts."
    ],
    [
        "Ga van nu af aan voorzichtiger met je geld om." =>
          "From now on, be more careful with your money."
    ],
    [ "Hij heeft een bril nodig." => "He needs glasses." ],
    [
        "Ik ben bang dat het morgen gaat regenen." =>
          "I'm afraid it will rain tomorrow."
    ],
    [
        "Van ver gezien lijkt het op een bal." =>
          "Seen from a distance, it looks like a ball."
    ],
    [ "Een ongeval deed zich juist voor." => "An accident just happened." ],
    [
        "Zelfs kinderen kunnen dit boek lezen." =>
          "Even children can read this book."
    ],
    [
        "Voor zover ik weet is hij niet lui." =>
          "As far as I know, he isn't lazy."
    ],
    [
        "Hij kwam een half uur te laat opdagen." =>
          "He turned up half an hour late."
    ],
    [ "Hij kwam gisteren uit Tokyo."      => "He came from Tokyo yesterday." ],
    [ "Mijn ouders kennen mijn vriendin." => "My parents know my girlfriend." ],
    [
        "Ik moest kiezen tussen die twee." => "I had to choose between the two."
    ],
    [ "Eind goed, al goed." => "All's well that ends well." ],
    [ "Eind goed, al goed." => "All is well that ends well." ],
    [
        "Ik schaam me er niet voor dat ik arm ben." =>
          "I'm not ashamed that I am poor."
    ],
    [ "We missen je allemaal heel erg." => "We all miss you very much." ],
    [ "Wat probeer je te zeggen?"       => "What are you getting at?" ],
    [ "Ik heb een geweldig leven."      => "I have a great life." ],
    [ "Waar wilt ge naartoe?"           => "Where do you want to go?" ],
    [ "Zijt ge allemaal klaar?"         => "Are you all ready?" ],
    [ "We zouden graag helpen."         => "We'd be happy to help." ],
    [
        "Ik verwacht dat hij ons zal helpen." =>
          "I expect that he will help us."
    ],
    [
        "Ik ga liever dood dan toe te geven." =>
          "I would rather die than yield."
    ],
    [ "Niets nieuws onder de zon." => "Nothing new under the sun." ],
    [
        "De klok loopt tien minuten achter." => "The clock is ten minutes slow."
    ],
    [ "Hij stopte de auto."             => "He stopped the car." ],
    [ "Ik hoop zijn foto gauw te zien." => "I hope to see his picture soon." ],
    [ "Hij eet de klok rond."           => "He eats around the clock." ],
    [ "Wil je nog een stuk cake?" => "Would you like another piece of cake?" ],
    [ "De vrouw is dik."          => "The woman is fat." ],
    [ "Ik kan je onmogelijk helpen." => "I cannot possibly help you." ],
    [
        "Het is haar droom verpleegster te worden." =>
          "Her dream is to become a nurse."
    ],
    [
        "Ze wil niet afhankelijk zijn van haar ouders." =>
          "She does not want to be dependent on her parents."
    ],
    [
        "Wil je graag witte of rode wijn?" =>
          "Would you like white wine or red?"
    ],
    [ "Zij speelt zeer goed piano." => "She plays the piano very well." ],
    [
        "De top van de berg is bedekt met sneeuw." =>
          "The summit of the mountain is covered with snow."
    ],
    [ "Hij speelt goed gitaar." => "He plays the guitar well." ],
    [
        "Hoeveel katten zijn er in dit huis?" =>
          "How many cats are there in this house?"
    ],
    [
        "Wanneer komt het nieuwe tijdschrift uit?" =>
          "When will the new magazine come out?"
    ],
    [ "Aan wie hebt u het gegeven?" => "To whom did you give it?" ],
    [
        "Zoals iemand leeft, zo zal hij ook sterven." =>
          "As a man lives, so shall he die."
    ],
    [ "Ik zal me even voorstellen." => "I'll just introduce myself." ],
    [
        "Naar mijn mening is Esperanto erg belangrijk." =>
          "In my opinion, Esperanto is very important."
    ],
    [
        "Enkele kinderen zijn op het gras aan het spelen." =>
          "Some children are playing on the grass."
    ],
    [ "Ik hou van katten."        => "I like cats." ],
    [ "Hij heeft vreemde ideeën." => "He has strange ideas." ],
    [ "Ik hou van katten."        => "I love cats." ],
    [
        "Ik kreeg problemen met de politie omdat ik te hard reed." =>
          "I got into trouble with the police for driving too fast."
    ],
    [
        "Je bent tien keer zwaarder dan ik." =>
          "You're ten times heavier than I am."
    ],
    [
        "Ze huilde alleen maar de hele tijd." =>
          "She did nothing but cry all the while."
    ],
    [
        "Wanneer zijt ge begonnen met Duits te leren?" =>
          "When did you begin learning German?"
    ],
    [ "Haar kamer heeft rode muren." => "Her room has red walls." ],
    [
        "Ik was erg moe, daarom ging ik vroeg naar bed." =>
          "Being very tired, I went to bed early."
    ],
    [
        "Ik kan het verschil tussen die twee niet uitleggen." =>
          "I can't explain the difference between those two."
    ],
    [
        "Hij kan nauwelijks zijn naam schrijven." =>
          "He can scarcely write his name."
    ],
    [
        "Als je honger hebt, smaakt alles goed." =>
          "When you are hungry, anything tastes good."
    ],
    [
        "Waarom is hij niet gestopt met roken?" => "Why didn't he stop smoking?"
    ],
    [ "Maak me wakker om zeven uur." => "Wake me up at seven o'clock." ],
    [
        "Er is altijd iets dat gedaan dient te worden." =>
          "There's always something that needs to be done."
    ],
    [ "Ze houden van dat lied." => "They love that song." ],
    [
        "Ik heb besloten door te studeren." =>
          "I've decided to continue studying."
    ],
    [ "Heb je de deur op slot gedaan?" => "Did you lock the door?" ],
    [
        "Hij is duidelijk niet zo'n soort persoon." =>
          "Obviously, he's not that kind of person."
    ],
    [
        "Voor zover ik mij kan herinneren is hij een eerlijk man." =>
          "To the best of my knowledge, he's an honest man."
    ],
    [
        "Wat heb je met mijn handtas gedaan?" =>
          "What did you do with my purse?"
    ],
    [ "Mijn lief houdt niet van mij." => "My lover doesn't love me." ],
    [ "Wat wilt ge als ontbijt?"      => "What do you want for breakfast?" ],
    [
        "Ik wilde niet dat dit zou gebeuren." => "I didn't want this to happen."
    ],
    [ "De hond ging op de postbode af." => "The dog went for the postman." ],
    [ "Wat is de maan vanavond mooi!" => "What a fine moon we have tonight!" ],
    [
        "Zijt ge al eens in Amerika geweest?" =>
          "Have you ever been to America?"
    ],
    [ "Ze was aanwezig op het feestje." => "She was present at the party." ],
    [
        "Uw naam staat als eerste op mijn lijst." =>
          "Your name stands first on my list."
    ],
    [
        "Boeken lezen is erg interessant." =>
          "Reading books is very interesting."
    ],
    [ "Ik ben een buitenlander." => "I'm a foreigner." ],
    [ "Vroeger was alles beter." => "Everything was better in the past." ],
    [
        "Waarom belde je me niet afgelopen nacht?" =>
          "Why didn't you call me last night?"
    ],
    [ "Kom alstublieft binnen." => "Please step inside." ],
    [
        "Ik heb in drie dagen niks meer gegeten." =>
          "I haven't eaten anything in the past three days."
    ],
    [ "De kat is zwart."                   => "The cat is black." ],
    [ "Alle appels zijn rood."             => "All apples are red." ],
    [ "Ik voel me niet lekker."            => "I don't feel well." ],
    [ "Hij gelooft mij helemaal niet."     => "He doesn't believe me at all." ],
    [ "Ze liet de hand van de jongen los." => "She let go of the boy's hand." ],
    [ "Ze luistert niet naar hem."         => "She doesn't listen to him." ],
    [ "Laten we kaart spelen."             => "Let's play cards." ],
    [
        "Gisteravond was ik liever naar het concert geweest." =>
          "I'd rather have gone to the concert last night."
    ],
    [
        "Hoeveel keer ben je in Europa geweest?" =>
          "How many times have you been to Europe?"
    ],
    [ "Wilt ge een tas koffie?" => "Do you want a cup of coffee?" ],
    [
        "Voor zover ik weet, is hij schuldig." =>
          "As far as I know, he's guilty."
    ],
    [ "Mag ik de rekening alstublieft." => "May I have the check, please?" ],
    [ "Hoe kom ik aan de andere kant?"  => "How do I get to the other side?" ],
    [
        "Ik ben van plan samen met hem te lunchen." =>
          "I plan to have lunch with him."
    ],
    [ "Wat is het juiste antwoord?"       => "What is the correct answer?" ],
    [ "Denk jij dat vissen kunnen horen?" => "Do you think fish can hear?" ],
    [
        "Denk jij dat vissen kunnen horen?" =>
          "Do you think that fish can hear?"
    ],
    [
        "Ik wenste dat ik Engels kon spreken." =>
          "I wish I could speak English."
    ],
    [
        "We waren van plan om daar ongeveer twee weken te blijven." =>
          "We intended to stay there about two weeks."
    ],
    [ "Vraag haar hoeveel soep ze wil." => "Ask her how much soup she wants." ],
    [ "We wonen dicht bij het station." => "We live close to the station." ],
    [ "Ik zal jou mijn verhaal vertellen." => "I'll tell you my story." ],
    [ "Ze vertelde me haar geheim niet." => "She didn't tell me her secret." ],
    [ "Kennen jullie elkaar?"            => "Do you know each other?" ],
    [ "Je betekent veel voor me."        => "You mean a lot to me." ],
    [ "Zo loste ik het probleem op." => "This is how I solved the problem." ],
    [ "Er hangt een kaart aan de muur." => "There is a map on the wall." ],
    [
        "Ik ben het uurwerk verloren dat mijn vader mij gegeven had." =>
          "I lost the watch that my father gave me."
    ],
    [
        "Ik ben het uurwerk verloren dat mijn vader mij gegeven had." =>
          "I lost the watch my father had given me."
    ],
    [
        "Waarom vertel je me niet wat je je herinnert?" =>
          "Why don't you tell me what you remember?"
    ],
    [ "De kat slaapt graag naast me."  => "The cat likes to sleep beside me." ],
    [ "Hebt ge iets over hem gehoord?" => "Have you heard from him?" ],
    [ "Hebt ge iets over hem gehoord?" => "Did you hear of him?" ],
    [ "Zij doet het raam open."        => "She opens the window." ],
    [ "Zij doet het raam open."        => "She is opening the window." ],
    [ "Dat is toch mijn CD?"           => "That's my CD, isn't it?" ],
    [
        "Wij zijn anders dan dieren omdat wij kunnen spreken." =>
          "We are different from animals in that we can speak."
    ],
    [
        "Rome is de hoofdstad van de wereld." =>
          "Rome is the capital of the world."
    ],
    [
        "Ik ben begonnen Esperanto te leren." =>
          "I’ve started learning Esperanto."
    ],
    [
        "Dit is het huis waarin ik leefde toen ik klein was." =>
          "This is the house I lived in when I was young."
    ],
    [ "Ik zal het niemand vertellen." => "I won't tell anyone." ],
    [
        "Meneer Brown is onze leraar Engels." =>
          "Mr Brown is our English teacher."
    ],
    [
        "Meneer Brown is onze leraar Engels." =>
          "Mr. Brown is our English teacher."
    ],
    [ "Ik probeerde niet na te kijken." => "I was trying not to look." ],
    [ "Dat is mijn broek."              => "Those are my trousers." ],
    [ "Dat is mijn broek."              => "Those are my pants." ],
    [
        "Ik heb honger omdat ik geen ontbijt heb gehad." =>
          "I am hungry because I did not have breakfast."
    ],
    [
        "Ik ga, zelfs als het morgen regent." =>
          "I'll go, even if it rains tomorrow."
    ],
    [
        "Ik raad u aan te stoppen met drinken." =>
          "I advise you to give up drinking."
    ],
    [ "Bedankt, dat is alles."         => "Thanks, that's all." ],
    [ "Laten we naar het strand gaan." => "Let's go to the beach." ],
    [ "Hij is golf aan het spelen."    => "He is playing golf." ],
    [
        "Ik heb nog nooit een echte koe gezien." =>
          "I've never seen a real cow."
    ],
    [
        "Je kan alleen naar China komen als je een visum hebt." =>
          "You can only come to China if you’ve got a visa."
    ],
    [ "Is mijn antwoord juist?"           => "Is my answer correct?" ],
    [ "Hij komt zonder twijfel."          => "Without a doubt he'll come." ],
    [ "Ik was mijn handen voor de lunch." => "I wash my hands before lunch." ],
    [
        "Ik vind vreemde talen erg interessant." =>
          "I find foreign languages very interesting."
    ],
    [ "Wiens brief is dit?"         => "Whose letter is this?" ],
    [ "Wie is deze vent?"           => "Who is this guy?" ],
    [ "Ik wil graag met je dansen." => "I'd like to dance with you." ],
    [
        "Hij deed alsof hij niet luisterde." =>
          "He pretended not to be listening."
    ],
    [
        "Het is heel makkelijk om lid te worden van deze bibliotheek." =>
          "It's very easy to become a member in this library."
    ],
    [ "Deze schoenen passen niet." => "These shoes don't fit my feet." ],
    [ "De auto rijdt snel."        => "The car is running fast." ],
    [
        "Niemand in zijn klas is sneller dan hij." =>
          "No one in his class is faster than he is."
    ],
    [
        "Hij had het geluk een baan te vinden." =>
          "He had the fortune to find a job."
    ],
    [ "Ik ben een slot zonder een sleutel." => "I'm a lock without a key." ],
    [
        "Het is mogelijk dat ik mijn sleutels vergeten ben." =>
          "It is possible that I forgot my keys."
    ],
    [ "Kun je verder gaan?" => "Can you continue?" ],
    [
        "Hij kwam naar Berlijn als een leraar." =>
          "He came to Berlin as a teacher."
    ],
    [ "Waarom hou je mijn handen vast?" => "Why are you holding my hands?" ],
    [ "Ze negeerde hem de hele dag."    => "She ignored him all day." ],
    [
        "Zijn oudere zuster is ouder dan mijn oudste broer." =>
          "His elder sister is older than my eldest brother."
    ],
    [
        "Zijn oudere zuster is ouder dan mijn oudste broer." =>
          "His older sister is older than my oldest brother."
    ],
    [ "Ik kon tussen de regels lezen." => "I could read between the lines." ],
    [
        "Kijk naar het grote gebouw daar." =>
          "Look at the large building over there."
    ],
    [
        "Hij was erg vriendelijk tegen iedereen." =>
          "He was very friendly to everybody."
    ],
    [
        "Na een korte pauze ging hij weer verder met zijn werk." =>
          "He continued his work after a short break."
    ],
    [ "Ge doet mij dromen." => "You make me dream." ],
    [
        "Ik had zin om te gaan wandelen." => "I felt like going out for a walk."
    ],
    [
        "Hij is net vanuit het buitenland terug." =>
          "He just returned from abroad."
    ],
    [
        "Ik hoop dat we niet al te lang hoeven wachten." =>
          "I hope we don't have to wait for too long."
    ],
    [ "Maar we kunnen hem niet verstaan." => "But we can't understand him." ],
    [ "We liepen achter de kat aan."      => "We ran after the cat." ],
    [
        "We kunnen niet weten wat er in de toekomst gebeuren zal." =>
          "There is no knowing what will happen in the future."
    ],
    [ "Hij stond achter de stoel." => "He stood behind the chair." ],
    [ "Ze sneed de appel in twee." => "She cut the apple in two." ],
    [
        "Ik heb haar gedwongen piano te spelen." =>
          "I made her play the piano against her will."
    ],
    [ "Hij ging door zingen."            => "He kept on singing." ],
    [ "Mijn hoofd doet echt pijn."       => "My head really aches." ],
    [ "Mijn vader is gestopt met roken." => "My father stopped smoking." ],
    [ "Mijn vader is gestopt met roken." => "My father gave up smoking." ],
    [
        "De sneeuw heeft de hele stad bedekt gedurende de nacht." =>
          "The snow covered the whole city overnight."
    ],
    [ "Hoe oud zie ik eruit?" => "How old do I look?" ],
    [
        "Ik heb alle respect voor jou verloren." =>
          "I have lost all respect for you."
    ],
    [ "Ik zie niet wat er veranderd is."  => "I don't see what's changed." ],
    [ "Enkele mensen hebben twee auto's." => "A few people have two cars." ],
    [
        "Hij is het waarschijnlijk al vergeten." =>
          "He probably forgot about it."
    ],
    [
        "Hoe laat gaat ge gewoonlijk gaan slapen?" =>
          "What time do you usually go to bed?"
    ],
    [
        "Hoe laat gaat ge gewoonlijk gaan slapen?" =>
          "What time are you used to going to bed?"
    ],
    [
        "De vrouw praat alsof ze een lerares is." =>
          "The woman speaks as if she were a teacher."
    ],
    [ "Ze stopt de kinderen in bed." => "She's putting the children to bed." ],
    [ "Ik dank u."                   => "I thank you." ],
    [
        "Er moet gisteren iets gebeurd zijn met Bob." =>
          "Something must have happened to Bob yesterday."
    ],
    [
        "U heeft uw vrienden toch ook uitgenodigd?" =>
          "You've invited your friends too, haven't you?"
    ],
    [ "Ik wacht op mijn moeder." => "I'm waiting for my mother." ],
    [
        "Ik vraag me af welke taal men spreekt in Brazilië." =>
          "I wonder what language they speak in Brazil."
    ],
    [
        "Ik kijk ernaar uit de film met haar te kijken." =>
          "I'm looking forward to watching the movie with her."
    ],
    [
        "Laat ons vertrekken van zodra hij terug is." =>
          "Let's leave as soon as he gets back."
    ],
    [ "Mijn moeder is altijd onderweg." => "My mother is always on the go." ],
    [ "Hij woont in een appartement."   => "He lives in a flat." ],
    [
        "Ik werd bijna overreden door een auto." =>
          "I was nearly run over by a car."
    ],
    [
        "Ik werd bijna door een auto overreden." =>
          "I narrowly escaped being run over by a car."
    ],
    [ "Dit is mijn pop." => "This is my doll." ],
    [
        "Niemand kon zeker weten wat er dan zou gebeuren." =>
          "No one could be sure what would happen then."
    ],
    [ "Er hangt een klok aan de muur." => "There is a clock on the wall." ],
    [
        "Vind je niet dat al onze politici te oud zijn?" =>
          "Don't you think that all our politicians are too old?"
    ],
    [ "Ik was onderweg naar school." => "I was on my way to school." ],
    [
        "Hij ontdekte dat hij een fout had gemaakt." =>
          "He discovered that he had made a mistake."
    ],
    [ "De kunst is lang, het leven is kort." => "Art is long, life is short." ],
    [ "Ik wil leren zwemmen."   => "I want to learn how to swim." ],
    [ "Beide ouders leven nog." => "Both the parents are still living." ],
    [
        "Ik kan me geen nieuwe fiets veroorloven." =>
          "I can't afford to buy the new bicycle."
    ],
    [ "We missen je heel erg."       => "We miss you very much." ],
    [ "Hij is in Frankrijk geweest." => "He has been to France." ],
    [ "We missen je heel erg."       => "We miss you a lot." ],
    [ "Het was acht meter lang."     => "It was eight metres long." ],
    [ "Er zijn geen wolken vandaag." => "There aren't any clouds today." ],
    [ "We vertrekken zonder hem."    => "We'll leave without him." ],
    [ "Ik ontbijt om zeven uur."     => "I have breakfast at seven." ],
    [
        "Ik zal je volgen tot het einde van de wereld." =>
          "I'll follow you to the ends of the earth."
    ],
    [
        "Mijn vrienden geven morgen een feestje voor me." =>
          "My friends will give me a party tomorrow."
    ],
    [
        "Je hebt de neiging om te snel te praten." =>
          "You have a tendency to talk too fast."
    ],
    [ "Ik vertrouw zijn verhaal niet."      => "I don't trust his story." ],
    [ "Ik denk dat ik te lang gewacht heb." => "I guess I waited too long." ],
    [ "Ik denk dat ik te lang heb gewacht." => "I guess I waited too long." ],
    [ "Waar is mijn bril?"                  => "Where are my glasses?" ],
    [ "Meneer Smith is een goede leraar."   => "Mr Smith is a good teacher." ],
    [ "Hebben wij elkaar niet al eerder ontmoet?" => "Haven't we met before?" ],
    [ "Gek zijn is gezond." => "Being crazy is healthy." ],
    [
        "Mijn taal staat niet op de lijst!" => "My language is not on the list!"
    ],
    [ "Mijn rok is te lang."      => "My skirt is too long." ],
    [ "De kat sliep op de tafel." => "The cat slept on the table." ],
    [ "Ik kom uit China."         => "I come from China." ],
    [
        "Ze maakte een rok van haar oude jurk." =>
          "She turned her old dress into a skirt."
    ],
    [
        "Niets is zo waardevol als de liefde." =>
          "Nothing is as precious as love."
    ],
    [
        "Ze was heel blij dat haar zoon veilig terug was gekomen." =>
          "Great was her joy when her son returned back safely."
    ],
    [ "Wilt u een kopje koffie?" => "Do you want a cup of coffee?" ],
    [
        "Ik raadde hem wat boeken aan." =>
          "I advised him on what books to read."
    ],
    [ "Ieder van u kan het doen."       => "Any of you can do it." ],
    [ "Vertel me alsjeblieft je naam."  => "Please tell me your name." ],
    [ "Ik studeer in het buitenland."   => "I study abroad." ],
    [ "Het is een geheim."              => "It's a secret." ],
    [ "Niets zo waardevol als de tijd." => "Nothing is so precious as time." ],
    [ "Ze trok de deur open."           => "She opened the door." ],
    [ "Hij speelt geen honkbal."        => "He does not play baseball." ],
    [ "Ze houdt van katten."            => "She loves cats." ],
    [
        "Ik leerde mijn vrouw kennen op een feestje." =>
          "I got acquainted with my wife at a party."
    ],
    [ "Na de winter komt de lente." => "After winter, spring comes." ],
    [
        "Feit is, dat ik het boek nog niet gelezen heb." =>
          "The fact is that I haven't read the book yet."
    ],
    [ "Jammer dat ze ziek is."    => "It's too bad she's ill." ],
    [ "Ik hoop dat zij me helpt." => "I hope that she will help me." ],
    [
        "Een hond volgde me naar mijn huis." => "A dog followed me to my house."
    ],
    [ "De wedstrijd vond niet plaats." => "The match didn't take place." ],
    [ "Ik vertrouw op je."             => "I have confidence in you." ],
    [ "Het valt op zondag."            => "It falls on Sunday." ],
    [
        "Ik vind geen woorden om uit te drukken wat ik voel." =>
          "I can't find the word to express what I feel."
    ],
    [
        "In geval dat het regent, zal ik niet vertrekken." =>
          "In case it rains, I won't go."
    ],
    [
        "Ze vind het echt leuk om gedichten te schrijven." =>
          "She really likes writing poems."
    ],
    [
        "Ze vind het echt leuk om gedichten te schrijven." =>
          "She really likes to write poems."
    ],
    [
        "Boven alles hebben kinderen liefde nodig." =>
          "Above all, children need love."
    ],
    [
        "Ze kwam niet opdagen bij het feest gisteren." =>
          "She didn't show up at the party yesterday."
    ],
    [ "Praat niet zo snel, alstublieft." => "Please don't speak so fast." ],
    [ "Hij ging daar zelden heen."       => "He seldom went there." ],
    [
        "Ze zocht haar kinderen, maar kon ze nergens vinden." =>
          "She looked for her children, but couldn't find them anywhere."
    ],
    [
        "Zijt ge niet beschaamd, zo te spreken?" =>
          "Aren't you ashamed to talk like that?"
    ],
    [
        "Het is noodzakelijk dat iedereen zich aan deze regels houdt." =>
          "It is necessary that everybody observe these rules."
    ],
    [ "Ik drink geen water."          => "I don't drink water." ],
    [ "Ik zal het aan hem uitleggen." => "I will explain it to him." ],
    [
        "In Canada spreekt men Engels en Frans." =>
          "They speak English and French in Canada."
    ],
    [
        "Ik ben gewend aan een koud klimaat." =>
          "I am accustomed to cold weather."
    ],
    [
        "Ik heb maar een mond, maar wel twee oren." =>
          "I only have one mouth, but I have two ears."
    ],
    [
        "Ik weet zeker dat we veel gemeen hebben." =>
          "I am sure we have a lot in common."
    ],
    [ "Je hebt zo weinig geduld met me." => "You're so impatient with me." ],
    [ "Hoe kom ik bij het strand?"       => "Which way is the beach?" ],
    [
        "Ze was op de verkeerde plek op het verkeerde moment." =>
          "She was at the wrong place at the wrong time."
    ],
    [ "We zijn leerlingen."   => "We are students." ],
    [ "Ik koop een nieuwe."   => "I'll buy a new one." ],
    [ "Hij verliet de kamer." => "He left the room." ],
    [
        "Ik wou dat ik die gitaar kon kopen." =>
          "I wish I could buy that guitar."
    ],
    [
        "Het lijkt erop dat je hond dorst heeft." =>
          "It looks like your dog is thirsty."
    ],
    [
        "Zeg mij wat ge op dat ogenblik gezien hebt." =>
          "Please tell me what you saw then."
    ],
    [
        "Het is ongeveer even groot als een ei." =>
          "It's about the size of an egg."
    ],
    [
        "Het is ongeveer even groot als een ei." =>
          "It is about the size of an egg."
    ],
    [
        "Kijk alsjeblieft naar de foto die ik gekozen heb." =>
          "Please take a look at the picture that I chose."
    ],
    [ "Al de studenten studeren Engels." => "All the students study English." ],
    [ "De kat slaapt op tafel."   => "The cat is sleeping on the table." ],
    [ "Pak een boek en lees het!" => "Take a book and read it." ],
    [
        "Lopen is goed voor je gezondheid." =>
          "Running is good for your health."
    ],
    [ "We zijn ook naar de tempel geweest." => "We also went to the temple." ],
    [
        "Het water is warm genoeg om erin te zwemmen." =>
          "The water's warm enough for a swim."
    ],
    [
        "Zelfs een kind kan zoiets doen." => "Even a child can do such a thing."
    ],
    [ "Waar heb je dat vandaan?"   => "Where did you get that?" ],
    [ "Die club is veel te groot." => "That club is way too big." ],
    [
        "Ik kan niet wachten tot het weekend begint." =>
          "I can't wait for the weekend to begin."
    ],
    [ "Wat leer je op school?"   => "What do you learn at school?" ],
    [ "Wat leer je op school?"   => "What are you learning at school?" ],
    [ "Alles staat op zijn kop." => "Everything is upside down." ],
    [ "Hij gaat dikwijls te voet naar school." => "He often walks to school." ],
    [
        "Ik heb leren fietsen toen ik zes was." =>
          "I learned how to ride a bike when I was six years old."
    ],
    [ "Je hebt het juiste gedaan." => "You did the right thing." ],
    [
        "Ik heb de boeken aan deze student gegeven." =>
          "I gave the books to this student."
    ],
];

sub pick_a_translation {
    my ( $translations, $from_english ) = @_;

    $from_english //= int( rand(2) );
    $from_english = ( $from_english > 0 ) ? 1 : 0;
    my $from_idx = $from_english;
    my $to_idx   = ( $from_idx == 0 ) ? 1 : 0;

    my $from_to = {};
    my $from;
    my $to;

    for my $translation (@$translations) {
        $from = $translation->[$from_idx];
        $to   = $translation->[$to_idx];

        $from_to->{$from} //= [];
        push @{ $from_to->{$from} }, $to;
    }

    my $idx         = int( rand( scalar @$translations ) );
    my $translation = $translations->[$idx];
    $from = $translation->[$from_idx];

    print "Translate: \"$from\"\n";
    my $input = readline(*STDIN);
    chomp $input;

    my $got_it  = 0;
    my $options = $from_to->{$from};
    for my $option (@$options) {
        if ( $input eq $option ) {
            $got_it = 1;
            last;
        }
    }

    $to = $options->[0];
    print "$to\n";

    my $error = $got_it ? 0 : 1;
    exit $error;
}

my $from_english = undef;    # parameterize?
pick_a_translation( $nl_to_en, $from_english );

# ----------
# notes
# ----------
#
# Roland points out:
# 'beneden' Depends, could be either down, below, beneath, downstairs depending on specific sentence.
#
# as a verb, typen is to type. But typen could also be the plural of type as in kind, so "types" in English.
#
# I'm never sure about "sick", that could mean you have to throw up right? I'd probably translate with "ill", but maybe that is too grave.
#
# I think there is literal translation for clothing, which would be "kledij" which is a rather archaic word.
#
# gek could be many things "odd","funny" (not haha), "cool" (as in, hip)
#
# bedenken is when you invent something in your mind, to make up
#
# careful :) depending on context, "stuk" could mean a goodlooking woman ("Kijk dat stuk eens!"), or a euphemism for penis. ("Mijn stuk staat op scherp")
#
# typically groceries. But literally, boodschappen are messages. Some room for confusion: "Ik heb een belangrijke boodschap" -> "I have an important message". "Ik moet even een boodschap doen" -> "I need to do some shopping". "Ik moet een grote boodschap doen" -> "I need to do a number two."
