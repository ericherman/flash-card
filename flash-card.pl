#!/usr/bin/env perl
use strict;
use warnings;

my $sentences = [
    [ 'Ik ben een student.'          => 'I am a student.' ],
    [ 'Jij bent een student.'        => 'You are a student.' ],
    [ 'Ben jij een student?'         => 'Are you a student?' ],
    [ 'Hij is een baby.'             => 'He is a baby.' ],
    [ 'Zij is een kind.'             => 'She is a child.' ],
    [ 'Wij zijn studenten.'          => 'We are students.' ],
    [ 'Jullie zijn studenten.'       => 'You are students.' ],
    [ 'Zij zijn studenten.'          => 'They are students.' ],
    [ 'Het nummer is nul.'           => 'The number is zero.' ],
    [ 'Wat betekenen de woorden?'    => 'What do the words mean?' ],
    [ 'Maak de opdrachten.'          => 'Do the assignments.' ],
    [ 'Trek een lijn.'               => 'Draw a line.' ],
    [ 'Kies het goede antwoord.'     => 'Choose the correct answer.' ],
    [ 'Het is ochtend.'              => 'It is morning.' ],
    [ 'Het is middag'                => 'It is afternoon.' ],
    [ 'Het is avond.'                => 'It is evening.' ],
    [ 'De trein is ver.'             => 'The train is far.' ],
    [ 'De man luistert.'             => 'The man listens.' ],
    [ 'De vrouw praat.'              => 'The woman talks.' ],
    [ 'De vrouw helpt de man.'       => 'The woman helps the man.' ],
    [ 'Hij geeft informatie.'        => 'He gives information.' ],
    [ 'Het water is diep.'           => 'The water is deep.' ],
    [ 'De pen is in de pot'          => 'The pen is in the pot.' ],
    [ 'De pot is achter de stoel.'   => 'The pot is behind the chair.' ],
    [ 'De pot is op de stoel.'       => 'The pot is on the chair.' ],
    [ 'De jas hangt over de stoel.'  => 'The coat hangs over the chair.' ],
    [ 'De pot is voor de stoel.'     => 'The pot is in front of the chair.' ],
    [ 'De pot is onder de stoel.'    => 'The pot is under the chair.' ],
    [ 'De pot is naast de stoel.'    => 'The pot is next to the chair.' ],
    [ 'De pot is tussen de stoelen.' => 'The pot is between the chairs.' ],
    [ 'Zij woont in dit huis.'       => 'She lives in this house.' ],
    [ 'De vrouw verkoopt brood.'     => 'The woman sells bread.' ],
    [ 'De auto is duur'              => 'The car is expensive.' ],
    [ 'De jas kost zestig euro.'     => 'The coat costs sixty euro.' ],
    [ 'Met je oren kun je horen.'    => 'With your ears you can hear.' ],
    [ 'Met je ogen kun je zien.'     => 'With your eyes you can see.' ],
    [ 'Ik werk in dit bedrijf.'      => 'I work in this company.' ],
    [ 'Ik werk in dit gebouw.'       => 'I work in this building.' ],
    [ 'Ik ben bij dit bedrijf.'      => "I'm in this company." ],
    [ 'Ik werk voor dit bedrijf.'    => 'I work for this company.' ],
    [ 'De deur is open.'             => 'The door is open.' ],
    [ 'De deur is dicht.'            => 'The door is closed.' ],
    [ 'Ik heet Eric'                 => 'I am called Eric.' ],
    [ 'Wat is jouw baan?'            => 'What is your job?' ],
    [ 'Ik werk in een ziekenhuis.'   => 'I work in a hospital.' ],
    [ 'De auto is snel.'             => 'The car is fast.' ],
    [ 'De man is langzaam.'          => 'The man is slow.' ],
    [ 'De vrouw geeft een boek.'     => 'The woman gives a book.' ],
    [ 'De man krijgt een boek.'      => 'The man gets a book.' ],
    [ 'De man is ziek.'              => 'The man is sick.' ],
    [ 'De man is beter.'             => 'The man is better.' ],
    [ 'De vrouw kijkt naar de man.'  => 'The woman looks at the man.' ],
    [ 'Deze auto is oud.'            => 'This car is old.' ],
    [ 'Deze auto is nieuw.'          => 'This car is new.' ],
    [ 'De vrouw is binnen.'          => 'The woman is inside.' ],
    [ 'De vrouw is buiten.'          => 'The woman is outside.' ],
    [ 'Deze plaats heet Eemnes.'     => 'This place is called Eemnes.' ],
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
	 [ 'De baas maakt geen fouten.' => 'The boss makes no mistakes.' ],
	 [ 'Het antwoord is fout.' => 'The answer is wrong.' ],
	 
	 [ 'Het meer is diep.' => 'The lake is deep.' ],
	 [ 'Hij heeft veel boeken, maar ik heb er meer.' => 'He has many books but I have more.' ],
	 [ 'Zij hebben meer kinderen.' => 'They have more kids.' ],
	 [ 'Meer dood dan levend.' => 'More dead than alive.' ],
	 [ 'Wie waren er nog meer?' => 'Who else was there?' ],
	 [ 'Je moet wat meer lachen.' => 'You have to laugh more often.'],
	 [ 'Hij kon niet meer werken' => "He could't work anymore." ],
	 [ 'Het schip is gemeerd.' => 'The ship has moored.'],
	 
	 [ 'De doos is vol.' => 'The box is full.' ],
	 [ 'Hij zit vol' => 'He is sated.' ],
	 [ 'Het zit vol met mieren' => 'It is full of ants.' ],
	 [ 'Het glas is half vol' => 'The glass is half full.' ],

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
];

# TODO: make sentences with these
# NOTE(chris): these are in alphabetical order
my $other_vocab = [

	[ 'anders' => 'different' ],
	[ 'bedenken' => 'make up' ],
	[ 'begrijpen' => 'understand' ],
	[ 'bekijken' => 'view' ],
	[ 'bellen' => 'call' ],
	[ 'beneden' => 'below' ],
	[ 'betalen' => 'pay' ],
	[ 'boven' => 'above' ],
	[ 'daar' => 'daar' ],
	[ 'dood' => 'dead' ],
	[ 'dubbel' => 'double' ],
	[ 'een beetje' => 'a bit' ],
	[ 'gek' => 'crazy' ],
	[ 'gisteren' => 'yesterday' ],
	[ 'hangen' => 'hang' ],
	[ 'hetzelfde' => 'same' ],
	[ 'hier' => 'here' ],
	[ 'hoog' => 'high' ],
	[ 'iemand' => 'somebody' ],
	[ 'kiezen' => 'choose' ],
	[ 'kijken' => 'look' ],
	[ 'koeken' => 'cookies' ],
	[ 'koken' => 'cook' ],
	[ 'kopen' => 'buy' ],
	[ 'kort' => 'short' ],
	[ 'koud' => 'cold' ],
	[ 'laag' => 'low' ],
	[ 'lachen' => 'laugh' ],
	[ 'lang' => 'long' ],
	[ 'leggen' => 'lay' ],
	[ 'leren' => 'learn' ],
	[ 'leven' => 'living' ],
	[ 'lezen' => 'read' ],
	[ 'licht' => 'light' ],
	[ 'liegen' => 'lie' ],
	[ 'liggen' => 'lay' ],
	[ 'lopen' => 'walk' ],
	[ 'makkelijk' => 'easy' ],
	[ 'mijmeren' => 'contemplate' ],
	[ 'min' => 'minus' ],
	[ 'moe' => 'tired' ],
	[ 'moelijk' => 'difficult' ],
	[ 'morgen' => 'tomorrow' ],
	[ 'nat' => 'wet' ],
	[ 'niemand' => 'nobody' ],
	[ 'normaal' => 'normal' ],
	[ 'nu' => 'now' ],
	[ 'printen' => 'print' ],
	[ 'rijden' => 'drive' ],
	[ 'roepen' => 'holler' ],
	[ 'roken' => 'smoke' ],
	[ 'schoon' => 'clean' ],
	[ 'schrijven' => 'write' ],
	[ 'slapen' => 'sleep' ],
	[ 'slepen' => 'drag' ],
	[ 'spelen' => 'play' ],
	[ 'spellen' => 'spell' ],
	[ 'spreken' => 'speak' ],
	[ 'staan' => 'stand' ],
	[ 'stil' => 'silent' ],
	[ 'tekenen' => 'draw' ],
	[ 'trekken' => 'pull' ],
	[ 'typen' => 'type' ],
	[ 'vallen' => 'fall' ],
	[ 'vandaag' => 'today' ],
	[ 'veel' => 'many' ],
	[ 'vies' => 'dirty' ],
	[ 'voetballen' => 'play soccer' ],
	[ 'vol' => 'full' ],
	[ 'voorstellen' => 'propose' ],
	[ 'voorstellen aan' => 'introduce' ],
	[ 'vroeger' => 'former' ],
	[ 'wassen' => 'wash' ],
	[ 'weinig' => 'few' ],
	[ 'werken' => 'work' ],
	[ 'zien' => 'see' ],
	[ 'zingen' => 'sing' ],
	[ 'zitten' => 'sit' ],
	[ 'zoeken' => 'search' ],
	[ 'zwaar' => 'heavy' ]

];

my $het_de = [
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
    [ 'het land'  => 'the country' ]
    ,    # could also be "the land" (as an area, not a particular country)
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
];

my $too_easy = [
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
    [ 'lekker'  => 'nice' ]
    ,    # good, tasty, whatever (well, ACTUALLY. . . . . . digression)
    [ 'werk'      => 'work' ],
    [ 'hallo'     => 'hello' ],
    [ 'tot ziens' => 'see you' ],
    [ 'hoi'       => 'hi' ],
    [ 'jong'      => 'young' ],
    [ 'oud'       => 'old' ],
    [ 'vrij'      => 'free' ],
    [ 'half'      => 'half' ],
    [ 'bier'      => 'beer' ],
];

sub pick_a_card {
    my ( $cards, $idx ) = @_;

    $idx //= int( rand(2) );

    my $card_num = int( rand( scalar @$cards ) );
    my $card     = $cards->[$card_num];
    my $from     = $card->[ !!$idx ];               # force to idx 0 or 1
    my $to       = $card->[ !$idx ];                # force to idx 0 or 1

    print "Translate: \"$from\"\n";
    my $line = readline(*STDIN);
    chomp $line;
    print "$to\n";
    my $error = ( $line eq $to ) ? 0 : 1;
    exit $error;
}

my $deck;
my $from_english = undef;

my $rnd = int( rand(100) );
if ( $rnd < 50 ) {
    $deck = $sentences;
}
elsif ( $rnd < 80 ) {
    $deck = $other_vocab;
}
elsif ( $rnd < 95 ) {
    $from_english = 1;
    $deck         = $het_de;
}
else {
    $deck = $too_easy;
}

pick_a_card( $deck, $from_english );


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
