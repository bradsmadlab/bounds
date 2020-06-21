CLS
RANDOMIZE TIMER
'setup card deck
DIM card$(14)
card$(0) = "joker" 'dummy card
card$(1) = "two"
card$(2) = "three"
card$(3) = "four"
card$(4) = "five"
card$(5) = "six"
card$(6) = "seven"
card$(7) = "eight"
card$(8) = "nine"
card$(9) = "ten"
card$(10) = "jack"
card$(11) = "queen"
card$(12) = "king"
card$(13) = "ace"

player = 5000
dealer = 5000
bet = 100
pot = 0

PRINT "Bounds-A Card Game"
PRINT
PRINT "Objective: To get a card that lands between two cards."
PRINT
PRINT "Rules: This is a single player game that goes against the dealer."
PRINT "It begins by both sides putting $100 each in the pot."
PRINT "The dealer will turn up two cards and then deal one card for the player."
PRINT "If the player's card lands outside or on the dealer's cards, then you "
PRINT "lose the pot. Otherwise, you win."
PRINT "For example: Dealer has shows a four and an Jack. Your card would need "
PRINT "to be between a five through ten to win. Dealer wins on card from 2 to "
PRINT "4 and ten to Ace."
PRINT "Each time you play $100 must be bet. After the initial bet, you can "
PRINT "play 48 more times."
PRINT
PRINT "Would you like to play? (enter y to continue/any other key to quit): "; 'begin play or exit game

INPUT (k$)
k$ = LCASE$(k$) 'takes care of upper case y
IF k$ = "y" THEN 'place bets
    PRINT "Player bets 100 and dealer bets 100"
    player = player - bet
    dealer = dealer - bet
    pot = bet * 2
    'PRINT "Player has "; player
    'PRINT "Dealer has "; dealer
    PRINT "Pot is "; pot
    PRINT
ELSE END
END IF

DIM firstcard$, secondcard$ 'deal first two cards
num1 = INT(RND(1) * 13) + 1 'pick random number betweem 1 to 13
firstcard$ = card$(num1) 'get card from array
PRINT "Dealer first card: "; firstcard$,
num2 = INT(RND(1) * 13) + 1 'pick random number betweem 1 to 13
secondcard$ = card$(num2) 'get card from array
PRINT "Dealer second card: "; secondcard$,
DIM nextcard$
num3 = INT(RND(1) * 13) + 1 'pick random number betweem 1 to 13
nextcard$ = card$(num3) 'get card from array
PRINT "Your card: "; nextcard$
IF num1 > num2 THEN 'put lower card first
    swap$ = firstcard$
    firstcard$ = secondcard$
    secondcard$ = swap$
    swapNum = num1
    num1 = num2
    num2 = swapNum
END IF

'debug PRINT num1, num2, num3 'check if player card is lower than first card
IF num3 < num1 OR num3 > num2 THEN 'or higher than second
    PRINT "You lose"
    dealer = dealer + pot
    pot = 0
    PRINT "Dealer is "; dealer, "Player is "; player, "Pot is "; pot 'get money and print results
    PRINT
ELSEIF num1 = num3 OR num2 = num3 THEN 'or equal to either
    PRINT "You lose"
    dealer = dealer + pot
    pot = 0
    PRINT "Dealer is "; dealer, "Player is "; player, "Pot is "; pot
    PRINT
ELSE PRINT "You win"
    player = player + pot
    pot = 0
    PRINT "Dealer is "; dealer, "Player is "; player, "Pot is "; pot
    PRINT
END IF

PRINT "Do you want another card? (enter y to continue/any other key to quit): ";
INPUT (k$)
k$ = LCASE$(k$) 'takes care of upper case y
DO WHILE k$ = "y"
    PRINT "Player bets 100 and dealer bets 100"
    player = player - bet
    dealer = dealer - bet
    pot = bet * 2
    'PRINT "Player has "; player
    'PRINT "Dealer has "; dealer
    PRINT "Pot is "; pot
    PRINT
    IF k$ = "y" THEN 'continue play until n
        num1 = INT(RND(1) * 13) + 1 'pick random number betweem 1 to 13
        firstcard$ = card$(num1) 'get card from array
        num2 = INT(RND(1) * 13) + 1 'pick random number betweem 1 to 13
        secondcard$ = card$(num2) 'get card from array

        num3 = INT(RND(1) * 13) + 1 'pick random number betweem 1 to 13
        nextcard$ = card$(num3) 'get card from array

        IF num1 > num2 THEN 'put lower card first
            swap$ = firstcard$
            firstcard$ = secondcard$
            secondcard$ = swap$
            swapNum = num1
            num1 = num2
            num2 = swapNum
        END IF
        PRINT "Dealer first card: "; firstcard$, "Dealer second card: "; secondcard$, "Your card: "; nextcard$
        'debug PRINT num1, num2, num3 'check if player card is lower than first card
        IF num3 < num1 OR num3 > num2 THEN 'or higher than second
            PRINT "You lose"
            dealer = dealer + pot
            pot = 0
            PRINT "Dealer is "; dealer, "Player is "; player, "Pot is "; pot 'get money and print results
            PRINT
        ELSEIF num1 = num3 OR num2 = num3 THEN 'or equal to either
            PRINT "You lose"
            dealer = dealer + pot
            pot = 0
            PRINT "Dealer is "; dealer, "Player is "; player, "Pot is "; pot
            PRINT
        ELSE PRINT "You win"
            player = player + pot
            pot = 0
            PRINT "Dealer is "; dealer, "Player is "; player, "Pot is "; pot 'get money and print results
            PRINT
        END IF
        PRINT "Do you want another card? (enter y to continue/any other key to stop): ";
        INPUT (k$)
        PRINT
    END IF
LOOP
PRINT
IF player > dealer THEN
    PRINT "You beat the house!"
ELSEIF player < dealer THEN
    PRINT "The house won. Better luck next time!"
ELSE PRINT "You broke even! At least you kept your money! Come back soon!"
END IF
