/*
Legion Design notes:
"Standard issue", AVOID identical kits and guns. Legion got spotty logistics and the hodgepodge aesthetic suits them, don't ruin it.
Sunglasses	For vets mainly, most lower ranks should have sandstorm goggles.
Money		Cent & Treasurer - "small" money bag (the biggest)
			Decanus - Officer money bag
			Rest - Enlisted money bag
Sidearm		None.
Melee		Officers only - Spatha
			Vets/Officers - Gladius
			Rest - Lawnmower machete the most common
Weapons		Lever shotgun, Grease gun, Repeater carbines, Revolvers, simple guns all good, very restrictive on long barrel automatics, generally limited ammo, always good melee option.
			Avoid Police shotguns, 5,56 semis, Desert Eagle, Survival knives etc, be creative and work within the limitations to avoid powercreep and things getting bland and same.
*/

/datum/job/CaesarsLegion
	department_flag = LEGION
	selection_color = "#ffeeee"
	faction = FACTION_LEGION

	forbids = "The Legion forbids: Using drugs such as stimpacks and alcohol. Ghouls joining. Women fighting (self defense and suicide allowed). Slaves carrying weapons. Using robots and advanced machines. Killing Legion members in secret, only if according to law and in public is it acceptable."
	enforces = "The Legion demands: Obeying orders of superiors. A roman style name. Wearing the uniform, unless acting as a NON-COMBAT infiltrator. Expect death as punishment for failing to obey."
	objectivesList = list("Focus on the tribals, win them over or intimidate them.", "Focus on Oasis, display dominance.", "Send out patrols and establish checkpoints to curb use of digusting drugs and degenerate behaviour.", "Flagstaff requests more worker: acquire slaves, train them if possible, send them east for breaking if not.", "Make sure no other faction gains dominance over Oasis, if they remain neutral it can be used to the Legions advantage.")
	exp_type = EXP_TYPE_LEGION

	access = list(ACCESS_LEGION)
	minimal_access = list(ACCESS_LEGION)

/datum/outfit/job/CaesarsLegion
	ears = null
	box = null

/datum/outfit/job/CaesarsLegion/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/legiongate)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/berserker_powder)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/hydra)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/rip/crossexecution)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/legionsalvaged)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/legionsalvaged_ncr)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/legionsalvagedhelmet_ncr)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/legionsalvagedhelmet)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/legioncombathelmet)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/legioncombathelmetmk2)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/legioncombat)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/legioncombatmk2)


/datum/outfit/job/CaesarsLegion/Legionnaire
	belt = /obj/item/storage/belt/military/assault/legion
	ears = /obj/item/radio/headset/headset_legion
	backpack = /obj/item/storage/backpack/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	uniform = /obj/item/clothing/under/f13/legskirt
	shoes = /obj/item/clothing/shoes/f13/military/legion
	gloves = /obj/item/clothing/gloves/legion
	box = /obj/item/storage/survivalkit_tribal

/datum/outfit/job/CaesarsLegion/Legionnaire/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	if(H.gender == FEMALE)
		H.gender = MALE
		H.real_name = random_unique_name(MALE)
		H.name = H.real_name
		if(H.wear_id)
			var/obj/item/card/id/dogtag/L = H.wear_id
			L.registered_name = H.name
			L.update_label()

/datum/outfit/job/CaesarsLegion/Legionnaire/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_TRIBAL, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	ADD_TRAIT(H, TRAIT_FEARLESS, src) //no phobias for legion!
	ADD_TRAIT(H, TRAIT_BERSERKER, src)

/obj/item/storage/box/legate
	name = "legate belongings"
	icon_state = "secbox"
	illustration = "flashbang"

/obj/item/storage/box/legate/PopulateContents()
	. = ..()
	new /obj/item/reagent_containers/pill/patch/healpoultice(src)
	new /obj/item/reagent_containers/pill/patch/healpoultice(src)
	new /obj/item/ammo_box/magazine/m14mm(src)
	new /obj/item/ammo_box/magazine/m14mm(src)
	new /obj/item/ammo_box/magazine/m14mm(src)


///////////////////
/// Admin Roles ///
///////////////////

// LEGATE

/datum/job/CaesarsLegion/Legionnaire/f13legate
	title = "Legion Legate"
	flag = F13LEGATE
	head_announce = list("Security")
	supervisors = "Caesar"
	selection_color = "#ffdddd"
	req_admin_notify = 1
	total_positions = 0
	spawn_positions = 0
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13legate
	access = list(ACCESS_PUBLIC, ACCESS_LEGION, ACCESS_LEGION3, ACCESS_LEGION_COMMAND, ACCESS_LEGION2, ACCESS_CHANGE_IDS, ACCESS_LEGION1, ACCESS_LEGION4)
	minimal_access = list(ACCESS_PUBLIC, ACCESS_LEGION, ACCESS_LEGION3, ACCESS_LEGION_COMMAND, ACCESS_LEGION2, ACCESS_CHANGE_IDS, ACCESS_LEGION1, ACCESS_LEGION4)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13legate/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)
	ADD_TRAIT(H, TRAIT_IRONFIST, src)
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	if(H.mind)
		var/obj/effect/proc_holder/spell/terrifying_presence/S = new /obj/effect/proc_holder/spell/terrifying_presence
		H.mind.AddSpell(S)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13legate	// 14mm Pistol, Goliath
	name = "Legate"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13legate
	shoes =	/obj/item/clothing/shoes/f13/military/legate
	suit = /obj/item/clothing/suit/armor/f13/legion/legate
	head = /obj/item/clothing/head/helmet/f13/legion/legate
	gloves = /obj/item/clothing/gloves/legion/legate
	glasses = /obj/item/clothing/glasses/sunglasses/big
	suit_store = /obj/item/gun/ballistic/automatic/pistol/pistol14
	r_pocket = /obj/item/storage/bag/money/small/legion
	l_pocket = /obj/item/flashlight/lantern
	r_hand = /obj/item/melee/unarmed/powerfist/goliath
	l_hand = /obj/item/tank/internals/oxygen
	ears = /obj/item/radio/headset/headset_legion/cent
	backpack_contents = list(
		/obj/item/binoculars = 1,
		/obj/item/book/granter/martial/cqc = 1,
		/obj/item/storage/box/legate = 1,
		/obj/item/reagent_containers/pill/patch/bitterdrink = 4
		)

//......................//////////////////////////////////................................................
						//								//
						// 		LEGION OFFICERS			//
						//								//
						//////////////////////////////////

// ----------------- CENTURION ---------------------

/datum/job/CaesarsLegion/Legionnaire/f13centurion
	title = "Legion Centurion"
	flag = F13CENTURION
	display_order = JOB_DISPLAY_ORDER_CENTURION
	exp_type = EXP_TYPE_LEGIONCOMMAND
	selection_color = "#ffdddd"
	head_announce = list("Security")
	req_admin_notify = 1
	total_positions = 1
	spawn_positions = 1
	description = "You are the camp commander and strongest soldier. Use your officers, the Decanii, to delegate tasks, make sure you lead and give orders. Take no disrespect, you are the dominus. If you prove a fool or weak, expect to be dispatched by a stronger subordinate."
	supervisors = "the Legate"
	exp_requirements = 1500

	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13centurion

	access = list(ACCESS_PUBLIC, ACCESS_LEGION, ACCESS_LEGION3, ACCESS_LEGION_COMMAND, ACCESS_LEGION2, ACCESS_CHANGE_IDS, ACCESS_LEGION1, ACCESS_LEGION4)
	minimal_access = list(ACCESS_PUBLIC, ACCESS_LEGION, ACCESS_LEGION3, ACCESS_LEGION_COMMAND, ACCESS_LEGION2, ACCESS_CHANGE_IDS, ACCESS_LEGION1, ACCESS_LEGION4)

	loadout_options = list(		// 10mm SMG, Goliath, CQC
		/datum/outfit/loadout/palacent,
		/datum/outfit/loadout/rangerhunter,
		/datum/outfit/loadout/centurion
		)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13centurion/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)
	ADD_TRAIT(H, TRAIT_IRONFIST, src)
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	if(H.mind)
		var/obj/effect/proc_holder/spell/terrifying_presence/S = new /obj/effect/proc_holder/spell/terrifying_presence
		H.mind.AddSpell(S)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13centurion
	name = "Legion Centurion"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13centurion
	id = /obj/item/card/id/dogtag/legcenturion
	mask = /obj/item/clothing/mask/bandana/legion/legcenturion
	ears = /obj/item/radio/headset/headset_legion/cent
	neck = /obj/item/clothing/neck/mantle/legion
	gloves = /obj/item/melee/unarmed/powerfist/goliath
	glasses = /obj/item/clothing/glasses/night/polarizing
	shoes = /obj/item/clothing/shoes/f13/military/plated
	r_pocket = /obj/item/restraints/handcuffs
	l_pocket = /obj/item/flashlight/lantern
	box = /obj/item/storage/survivalkit_tribal/chief
	backpack_contents = list(
		/obj/item/restraints/legcuffs/bola = 1,
		/obj/item/storage/bag/money/small/legion = 1,
		/obj/item/warpaint_bowl = 1,
		/obj/item/ammo_box/a357 = 1,
		/obj/item/gun/ballistic/revolver/colt357 = 1,
		/obj/item/binoculars = 1
		)

/datum/outfit/loadout/palacent
	name = "Paladin-Slayer Centurion"
	suit = /obj/item/clothing/suit/armor/f13/legion/palacent
	head = /obj/item/clothing/head/helmet/f13/legion/palacent
	suit_store = /obj/item/gun/ballistic/automatic/smg/smg10mm
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m10mm_adv/ext = 2
		)

/datum/outfit/loadout/rangerhunter
	name = "Ranger-Hunter Centurion"
	suit = /obj/item/clothing/suit/armor/f13/legion/rangercent
	head = /obj/item/clothing/head/helmet/f13/legion/rangercent
	suit_store = /obj/item/gun/ballistic/automatic/smg/smg10mm
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m10mm_adv/ext = 2
		)

/datum/outfit/loadout/centurion
	name = "Warlord Centurion"
	suit = /obj/item/clothing/suit/armor/f13/legion/centurion
	head = /obj/item/clothing/head/helmet/f13/legion/centurion
	suit_store = /obj/item/gun/ballistic/automatic/smg/smg10mm
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m10mm_adv/ext = 2
		)
/*
/datum/outfit/loadout/tribalcenturion
	name = "Chosen Tribal Centurion"
	suit = /obj/item/clothing/suit/armor/f13/legion/centurion
	head = /obj/item/clothing/head/helmet/f13/legion/palacent
	suit_store = /obj/item/melee/unarmed/sappers
	backpack_contents = list(
		/obj/item/shield/riot/legion = 1,
		/obj/item/book/granter/martial/berserker = 1,
		/obj/item/throwing_star/spear = 4,
		/obj/item/melee/onehanded/knife/throwing = 5,
		/obj/item/restraints/legcuffs/bola/tactical = 2,
		/obj/item/reagent_containers/pill/patch/healingpowder/berserker = 3,
		/obj/item/reagent_containers/pill/patch/bitterdrink = 2,
		)
*/ //TO DO funny cent melee maybe later


// ----------------- VETERAN DECANUS ---------------------

/datum/job/CaesarsLegion/Legionnaire/f13decanvet
	title = "Legion Veteran Decanus"
	flag = F13DECANVET
	display_order = JOB_DISPLAY_ORDER_DECANVET
	exp_type = EXP_TYPE_LEGIONCOMMAND
	total_positions = 1
	spawn_positions = 1
	description = "You answer directly to the Centurion, his second in command. Lead the camp, ensure its defended, keep track of the Explorers and use your veterans to their full potential."
	supervisors = "the Centurion"
	exp_requirements = 900

	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13decanvet

	access = list(ACCESS_PUBLIC, ACCESS_LEGION, ACCESS_LEGION3, ACCESS_LEGION_COMMAND, ACCESS_LEGION2, ACCESS_CHANGE_IDS, ACCESS_LEGION1, ACCESS_LEGION4)
	minimal_access = list(ACCESS_PUBLIC, ACCESS_LEGION, ACCESS_LEGION3, ACCESS_LEGION_COMMAND, ACCESS_LEGION2, ACCESS_CHANGE_IDS, ACCESS_LEGION1, ACCESS_LEGION4)

	loadout_options = list(
		/datum/outfit/loadout/decvetbull,
		/datum/outfit/loadout/decvetwolf,
		)


/datum/outfit/job/CaesarsLegion/Legionnaire/f13decanvet/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	ADD_TRAIT(H, TRAIT_IRONFIST, src)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13decanvet
	name = "Legion Veteran Decanus"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13decanvet
	id = /obj/item/card/id/dogtag/legveteran
	suit = /obj/item/clothing/suit/armor/f13/legion/heavy
	suit_store = /obj/item/twohanded/legionaxe
	mask = /obj/item/clothing/mask/bandana/legion/legdecan
	neck = /obj/item/storage/belt/holster
	gloves = /obj/item/clothing/gloves/legion/plated
	ears = /obj/item/radio/headset/headset_legion/cent
	glasses = /obj/item/clothing/glasses/sunglasses/big
	shoes = /obj/item/clothing/shoes/f13/military/plated
	r_pocket = /obj/item/flashlight/lantern
	box = /obj/item/storage/survivalkit_tribal/chief
	backpack_contents = list(
		/obj/item/ammo_box/a357 = 1,
		/obj/item/gun/ballistic/revolver/thatgun = 1,
		/obj/item/restraints/handcuffs = 1,
		/obj/item/storage/bag/money/small/legofficers = 1,
		/obj/item/binoculars = 1
		)

/datum/outfit/loadout/decvetbull
	name = "Mark of The Bull"
	head = /obj/item/clothing/head/helmet/f13/legion/heavy
	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/bitterdrink = 2
		)

/datum/outfit/loadout/decvetwolf
	name = "Mark of the Wolf"
	head = /obj/item/clothing/head/helmet/f13/legion/vet/decan
	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/bitterdrink = 2
		)

// ----------------- PRIME DECANUS ---------------------

/datum/job/CaesarsLegion/Legionnaire/f13decan
	title = "Legion Prime Decanus"
	flag = F13DECAN
	display_order = JOB_DISPLAY_ORDER_DECAN
	total_positions = 1
	spawn_positions = 1
	description = "A experienced officer, often commanding the camp. Give orders, lead patrols."
	supervisors = "the Veteran Decanus and the Centurion"
	exp_requirements = 720
	
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13decan
	
	access = list(ACCESS_PUBLIC, ACCESS_LEGION, ACCESS_LEGION3, ACCESS_LEGION_COMMAND, ACCESS_LEGION2, ACCESS_CHANGE_IDS, ACCESS_LEGION1)
	minimal_access = list(ACCESS_PUBLIC, ACCESS_LEGION, ACCESS_LEGION3, ACCESS_LEGION_COMMAND, ACCESS_LEGION2, ACCESS_CHANGE_IDS, ACCESS_LEGION1)

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/CaesarsLegion,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/CaesarsLegion,
		),
		)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13decan/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	ADD_TRAIT(H, TRAIT_IRONFIST, src)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13decan
	name = "Prime Decanus"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13decan
	id = /obj/item/card/id/dogtag/legveteran
	suit = /obj/item/clothing/suit/armor/f13/legion/prime/decan
	suit_store = /obj/item/gun/ballistic/shotgun/automatic/combat/shotgunlever
	head = /obj/item/clothing/head/helmet/f13/legion/prime/decan
	mask = /obj/item/clothing/mask/bandana/legion/legdecan
	neck = /obj/item/storage/belt/holster
	glasses = /obj/item/clothing/glasses/legiongoggles
	shoes = /obj/item/clothing/shoes/f13/military/plated
	r_pocket = /obj/item/flashlight/lantern
	l_pocket = /obj/item/restraints/handcuffs
	box = /obj/item/storage/survivalkit_tribal/chief
	backpack_contents = list(
		/obj/item/melee/onehanded/machete/gladius = 1,
		/obj/item/storage/bag/money/small/legofficers = 1,
		/obj/item/ammo_box/shotgun/buck = 2,
		/obj/item/grenade/smokebomb = 1,
		/obj/item/binoculars = 1,
		/obj/item/reagent_containers/pill/patch/bitterdrink = 1
		)

// ----------------- RECRUIT DECANUS ---------------------

/datum/job/CaesarsLegion/Legionnaire/f13decanrec
	title = "Legion Recruit Decanus"
	flag = F13DECANREC
	display_order = JOB_DISPLAY_ORDER_DECANREC
	total_positions = 1
	spawn_positions = 1
	description = "The junior officer, you must train the recruits and test them, and if a suicide charge is needed, lead them to a glorious death."
	supervisors = "the Prime/Veteran Decanus and the Centurion"
	exp_requirements = 600
	
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13decanrec
	
	access = list(ACCESS_PUBLIC, ACCESS_LEGION, ACCESS_LEGION3, ACCESS_LEGION_COMMAND, ACCESS_LEGION2, ACCESS_CHANGE_IDS, ACCESS_LEGION1)
	minimal_access = list(ACCESS_PUBLIC, ACCESS_LEGION, ACCESS_LEGION3, ACCESS_LEGION_COMMAND, ACCESS_LEGION2, ACCESS_CHANGE_IDS, ACCESS_LEGION1)

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/CaesarsLegion,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/CaesarsLegion,
		),
		)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13decanrec/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13decanrec
	name = "Legion Recruit Decanus"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13decanrec
	id = /obj/item/card/id/dogtag/legveteran
	suit = /obj/item/clothing/suit/armor/f13/legion/recruit/decan
	suit_store = /obj/item/twohanded/fireaxe/bmprsword
	head = /obj/item/clothing/head/helmet/f13/legion/recruit/decan
	mask = /obj/item/clothing/mask/bandana/legion/legdecan
	neck = /obj/item/storage/belt/holster
	glasses = /obj/item/clothing/glasses/legiongoggles
	r_pocket = /obj/item/flashlight/lantern
	l_pocket = /obj/item/storage/survivalkit_tribal
	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/healpoultice = 1,
		/obj/item/restraints/handcuffs = 1,
		/obj/item/storage/bag/money/small/legofficers = 1,
		/obj/item/gun/ballistic/revolver/m29 = 1,
		/obj/item/ammo_box/m44 = 3,
		/obj/item/warpaint_bowl = 1
		)

//......................//////////////////////////////////................................................
						//								//
						// 			SPECIALISTS			//
						//								//
						//////////////////////////////////

// ----------------- VEXILLARIUS ---------------------

/datum/job/CaesarsLegion/Legionnaire/f13vexillarius
	title = "Legion Vexillarius"
	flag = F13VEXILLARIUS
	display_order = JOB_DISPLAY_ORDER_VEXILLARIUS
	total_positions = 2
	spawn_positions = 2
	description = "You are a Veteran of proven bravery. When not fighting, relay orders from the commander and act as a bodyguard."
	supervisors = "the Veteran Decanus and Centurion"
	exp_requirements = 720
	
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13vexillarius
	
	access = list(ACCESS_PUBLIC, ACCESS_LEGION, ACCESS_LEGION2, ACCESS_LEGION_COMMAND)
	minimal_access = list(ACCESS_PUBLIC, ACCESS_LEGION, ACCESS_LEGION2, ACCESS_LEGION_COMMAND)

	loadout_options = list(
		/datum/outfit/loadout/vexbear,
		/datum/outfit/loadout/vexfox,
		/datum/outfit/loadout/vexnight
		)

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/CaesarsLegion,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/CaesarsLegion,
		),
		)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13vexillarius/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	ADD_TRAIT(H, TRAIT_FAST_PUMP, src)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13vexillarius
	name = "Vexillarius"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13vexillarius
	id = /obj/item/card/id/dogtag/legveteran
	suit = /obj/item/clothing/suit/armor/f13/legion/vet/vexil
	suit_store = /obj/item/gun/ballistic/rifle/repeater/cowboy
	mask = /obj/item/clothing/mask/bandana/legion/legvet
	neck = /obj/item/storage/belt/holster
	glasses = /obj/item/clothing/glasses/sunglasses
	gloves = /obj/item/clothing/gloves/legion/plated
	r_pocket = /obj/item/flashlight/lantern
	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/healpoultice = 1,
		/obj/item/restraints/handcuffs = 1,
		/obj/item/megaphone/cornu = 1,
		/obj/item/storage/bag/money/small/legenlisted = 1,
		/obj/item/warpaint_bowl = 1,
		/obj/item/ammo_box/tube/a357 = 3
		)

/datum/outfit/loadout/vexbear
	name = "Mountain Bear"
	head = /obj/item/clothing/head/helmet/f13/legion/vet/combvexil
	backpack_contents = list(
		/obj/item/melee/onehanded/machete/spatha = 1,
		/obj/item/grenade/plastic/c4 = 1
		)

/datum/outfit/loadout/vexfox
	name = "Desert Fox"
	head = /obj/item/clothing/head/helmet/f13/legion/vet/vexil
	backpack_contents = list(
		/obj/item/melee/onehanded/machete/spatha = 1,
		/obj/item/grenade/plastic/c4 = 1
		)

/datum/outfit/loadout/vexnight
	name = "Night Stalker"
	head = /obj/item/clothing/head/helmet/f13/legion/vet/nightvexil
	backpack_contents = list(
		/obj/item/melee/onehanded/machete/spatha = 1,
		/obj/item/grenade/plastic/c4 = 1
		)

// ----------------- EXPLORER ---------------------

/datum/job/CaesarsLegion/Legionnaire/f13explorer
	title = "Legion Explorer"
	flag = F13EXPLORER
	display_order = JOB_DISPLAY_ORDER_EXPLORER
	total_positions = 3
	spawn_positions = 3
	description = "Scout the area, secure key points, but do not ignore orders or wordlessly die some place. A good explorer helps his unit by taking initiative and helping the commander without needing micro-managment."
	supervisors = "the Veteran Decanus and Centurion must be obeyed, and as always, respect must be given to other Decanus. You are not a officer, but you are a specialist"
	display_order = JOB_DISPLAY_ORDER_EXPLORER
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13explorer
	exp_requirements = 300

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/CaesarsLegion,
			),
		/datum/matchmaking_pref/rival = list(
			/datum/job/CaesarsLegion,
			),
		)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13explorer/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	ADD_TRAIT(H, TRAIT_SILENT_STEP, src)


/datum/outfit/job/CaesarsLegion/Legionnaire/f13explorer
	name = "Legion Explorer"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13explorer
	id = /obj/item/card/id/dogtag/legprime
	suit = /obj/item/clothing/suit/armor/f13/legion/vet/explorer
	suit_store = /obj/item/gun/ballistic/rifle/hunting/remington
	head = /obj/item/clothing/head/helmet/f13/legion/vet/explorer
	neck = /obj/item/storage/belt/holster
	r_pocket = /obj/item/flashlight
	l_pocket = /obj/item/binoculars
	backpack_contents = list(
		/obj/item/gun/ballistic/revolver/revolver45 = 1,
		/obj/item/ammo_box/c45rev = 1,
		/obj/item/reagent_containers/pill/patch/healingpowder = 1,
		/obj/item/storage/bag/money/small/legenlisted = 1,
		/obj/item/melee/onehanded/machete = 1,
		/obj/item/restraints/handcuffs = 1,
		/obj/item/attachments/scope = 1,
		/obj/item/ammo_box/a762 = 3,
		/obj/item/restraints/legcuffs/bola/tactical = 1
		)

// ----------------- FRUMENTARIUS ---------------------

/datum/job/CaesarsLegion/Legionnaire/f13frumentarius
	title = "Legion Frumentarius"
	flag = F13FRUMENTARIUS
	display_order = JOB_DISPLAY_ORDER_FRUMENTARIUS
	description = "The Eyes and Ears of Caesar. Frumentarii cover a wide range of specializations, from Ambassadors to local Tribes, Infiltrators of enemy societies, Couriers, Intelligence Gatherers and the Secret Police of Legion Camps. Unlike the lesser Legionaries, a Frumentarius is given much unsupervised freedom to do as one pleases, so long as the Legion's goals are accomplished. You are one of these Frumentarius. Spread Caesar's Will, for Mars is watching."
	supervisors = "the Centurion"
	selection_color = "#ffdddd"
	total_positions = 1
	spawn_positions = 1
	exp_requirements = 1500
	
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13frumentarius
	
	access = list(ACCESS_PUBLIC, ACCESS_LEGION, ACCESS_LEGION3, ACCESS_LEGION_COMMAND, ACCESS_LEGION2, ACCESS_CHANGE_IDS, ACCESS_LEGION1, ACCESS_LEGION4)
	minimal_access = list(ACCESS_PUBLIC, ACCESS_LEGION, ACCESS_LEGION3, ACCESS_LEGION_COMMAND, ACCESS_LEGION2, ACCESS_CHANGE_IDS, ACCESS_LEGION1, ACCESS_LEGION4)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13frumentarius	// .357 Revolver, Spatha
	name = "Legion Frumentarius"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13frumentarius
	neck = /obj/item/storage/belt/holster
	shoes = /obj/item/clothing/shoes/f13/military/plated
	suit = /obj/item/clothing/suit/armor/f13/legion/frumentarius
	head = /obj/item/clothing/head/helmet/f13/legion/frumentarius
	id = /obj/item/card/id/dogtag/legfrumentarius
	gloves = null
	backpack = /obj/item/storage/backpack/legionr
	shoes = /obj/item/clothing/shoes/roman
	suit_store = /obj/item/gun/ballistic/revolver/colt357
	r_pocket = /obj/item/storage/bag/money/small/legofficers
	l_pocket = /obj/item/flashlight/lantern
	l_hand = /obj/item/melee/onehanded/machete/spatha
	backpack_contents = list(
		/obj/item/binoculars = 1,
		/obj/item/ammo_box/a357 = 2,
		/obj/item/reagent_containers/pill/patch/bitterdrink = 2
		)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13frumentarius/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)


//......................//////////////////////////////////................................................
						//								//
						// 		LEGION WARRIORS			//
						//								//
						//////////////////////////////////

// ----------------- VETERAN --------------------- //

/datum/job/CaesarsLegion/Legionnaire/vetlegionnaire
	title = "Veteran Legionnaire"
	flag = F13VETLEGIONARY
	display_order = JOB_DISPLAY_ORDER_VETLEGIONARY
	total_positions = 3
	spawn_positions = 3
	description = "A hardened warrior, obeying the orders from the Decanus and Centurion is second nature, as is fighting the profligates. If no officers are present, make sure the younger warriors act like proper Legionaires."
	supervisors = "the Decani and Centurion"
	exp_requirements = 600

	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/vetlegionnaire

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/CaesarsLegion,
			),
		/datum/matchmaking_pref/rival = list(
			/datum/job/CaesarsLegion,
			),
		)

/datum/outfit/job/CaesarsLegion/Legionnaire/vetlegionnaire/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_IRONFIST, src)

/datum/outfit/job/CaesarsLegion/Legionnaire/vetlegionnaire
	name = "Veteran Legionnaire"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/vetlegionnaire
	id = /obj/item/card/id/dogtag/legveteran
	mask = /obj/item/clothing/mask/bandana/legion/legvet
	head = /obj/item/clothing/head/helmet/f13/legion/vet
	neck = /obj/item/storage/belt/holster
	suit = /obj/item/clothing/suit/armor/f13/legion/vet
	suit_store = /obj/item/gun/ballistic/shotgun/trench
	glasses = /obj/item/clothing/glasses/sunglasses
	shoes = /obj/item/clothing/shoes/f13/military/plated
	r_pocket = /obj/item/flashlight/lantern
	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/healpoultice = 1,
		/obj/item/storage/bag/money/small/legenlisted = 1,
		/obj/item/restraints/handcuffs = 1,
		/obj/item/melee/onehanded/machete/gladius = 1,
		/obj/item/reagent_containers/pill/patch/bitterdrink = 1,
		/obj/item/stack/crafting/armor_plate = 4,
		/obj/item/melee/onehanded/knife/bayonet = 1,
		/obj/item/ammo_box/shotgun/slug = 1,
		/obj/item/ammo_box/shotgun/buck = 2
		)

// ----------------- PRIME --------------------- //

/datum/job/CaesarsLegion/Legionnaire/f13legionary
	title = "Prime Legionnaire"
	flag = F13LEGIONARY
	display_order = JOB_DISPLAY_ORDER_LEGIONARY
	total_positions = 4
	spawn_positions = 4
	description = "A front line soldier who has shown ability to obey and fought in some battles. The Legions muscle, the young men who will build the future with their own blood and sacrifice, for Caesar."
	supervisors = "the Decani and Centurion"
	exp_requirements = 120
	
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13legionary

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/CaesarsLegion,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/CaesarsLegion,
		),
		)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13legionary/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13legionary
	name = "Prime Legionnaire"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13legionary
	id = /obj/item/card/id/dogtag/legprime
	mask = /obj/item/clothing/mask/bandana/legion/legprime
	head = /obj/item/clothing/head/helmet/f13/legion/prime
	neck = /obj/item/storage/belt/holster
	suit = /obj/item/clothing/suit/armor/f13/legion/prime
	suit_store = /obj/item/twohanded/spear/lance
	glasses = /obj/item/clothing/glasses/legiongoggles
	r_pocket = /obj/item/flashlight/lantern
	l_pocket = /obj/item/restraints/handcuffs
	backpack_contents = list(
		/obj/item/storage/bag/money/small/legenlisted = 1,
		/obj/item/reagent_containers/pill/patch/healpoultice = 2,
		/obj/item/restraints/legcuffs/bola = 2,
		/obj/item/gun/ballistic/revolver/m29 = 1,
		/obj/item/ammo_box/m44 = 3
		)

// ----------------- RECRUIT --------------------- //

/datum/job/CaesarsLegion/Legionnaire/f13recleg
	title = "Recruit Legionnaire"
	flag = F13RECRUITLEG
	display_order = JOB_DISPLAY_ORDER_RECRUITLEG
	total_positions = 5
	spawn_positions = 5
	description = "You have recently come of age or been inducted into Caesar's Legion. You have absolutely no training, and are expected to follow every whim of the Decanii and your Centurion. Respect the soldiers of higher rank."
	supervisors = "the Decani and Centurion"

	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13recleg

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/CaesarsLegion,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/CaesarsLegion,
		),
		)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13recleg/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13recleg
	name = "Recruit Legionnaire"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13recleg
	id = /obj/item/card/id/dogtag/legrecruit
	shoes = /obj/item/clothing/shoes/f13/military/leather
	suit = /obj/item/clothing/suit/armor/f13/legion/recruit
	suit_store = /obj/item/gun/ballistic/revolver/colt357
	head = /obj/item/clothing/head/helmet/f13/legion/recruit
	mask = /obj/item/clothing/mask/bandana/legion/legrecruit
	glasses = /obj/item/clothing/glasses/legiongoggles
	r_pocket = /obj/item/flashlight/lantern
	backpack_contents = list(
		/obj/item/storage/bag/money/small/legenlisted = 1,
		/obj/item/reagent_containers/pill/patch/healingpowder = 1,
		/obj/item/melee/onehanded/machete = 1,
		/obj/item/ammo_box/a357 = 3,
		/obj/item/restraints/legcuffs/bola = 1
		)

//......................//////////////////////////////////................................................
						//								//
						// 			SUPPORT ROLES		//
						//								//
						//////////////////////////////////

// ----------------- CAMP FOLLOWER --------------------- //

/datum/job/CaesarsLegion/f13campfollower
	title = "Camp Follower"
	flag = F13CAMPFOLLOWER
	display_order = JOB_DISPLAY_ORDER_CAMPFOLLOWER
	total_positions = 4
	spawn_positions = 4
	description = "A Camp Follower ranges in purposes. A Camp Follower is a legionnaire who got assigned to keeping the camp in order. Duties may vary from medical specialities, weapon crafting or other skilled-labor tasks."
	supervisors = "Officers first, then warriors."

	outfit = /datum/outfit/job/CaesarsLegion/f13campfollower

/datum/outfit/job/CaesarsLegion/f13campfollower
	name = "Camp Follower"
	id = /obj/item/card/id/dogtag/legfollower
	mask = /obj/item/clothing/mask/bandana/legion/camp
	uniform = /obj/item/clothing/under/f13/legskirt
	glasses = /obj/item/clothing/glasses/sunglasses
	shoes = /obj/item/clothing/shoes/f13/military/leather
	l_pocket = /obj/item/flashlight/lantern
	suit_store = /obj/item/melee/onehanded/slavewhip
	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/healingpowder = 1,
		/obj/item/storage/bag/money/small/legenlisted = 1,
		/obj/item/reagent_containers/glass/bucket = 1,
		/obj/item/mop = 1
		)

/datum/outfit/job/CaesarsLegion/f13campfollower/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_TRIBAL, src)
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_MARS_TEACH, src)

// LEGION SLAVES - Servant cook, and assist with medical, low surgery. Worker farm and mine.

/datum/job/CaesarsLegion/slave
	title = "Legion Slave"
	flag = F13LEGIONSLAVE
	total_positions = 4
	spawn_positions = 4
	description = "A slave that survives the breaking camps is given a Legion appropriate name (latin-tribal inspired) and bull tattoo. Be obedient, respectful, stay inside the camp. Work the farm, mine, make food, clean and help injured men. Do NOT escape on your own, up to you how to handle it if forcibly freed by outside forces."
	supervisors = "Officers, then warriors"
	display_order = JOB_DISPLAY_ORDER_LEGIONSLAVE
	outfit = /datum/outfit/job/CaesarsLegion/slave

	loadout_options = list(
		/datum/outfit/loadout/slaveservant, //Servants cook, clean, help with medical tasks.
		/datum/outfit/loadout/slaveworker //Workers farm and mine.
		)

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/CaesarsLegion/slave,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/CaesarsLegion/slave,
		),
	)

/datum/outfit/job/CaesarsLegion/slave/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_MARS_TEACH, src)

/datum/outfit/job/CaesarsLegion/slave
	name = "Legion Slave"
	jobtype = /datum/outfit/job/CaesarsLegion/slave
	id = /obj/item/card/id/legionbrand
	uniform = /obj/item/clothing/under/f13/legslave
	neck = /obj/item/electropack/shockcollar
	shoes =	null
	l_pocket = /obj/item/radio

/datum/outfit/loadout/slaveservant
	name = "Servant"
	head = /obj/item/clothing/head/f13/servant
	uniform	= /obj/item/clothing/under/f13/campfollowermale
	gloves = /obj/item/clothing/gloves/f13/crudemedical
	shoes =	/obj/item/clothing/shoes/roman
	r_pocket = /obj/item/flashlight/lantern
	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/healingpowder = 2,
		/obj/item/reagent_containers/pill/patch/healpoultice = 2,
		/obj/item/smelling_salts = 1,
		/obj/item/book/granter/trait/lowsurgery = 1,
		/obj/item/reagent_containers/food/condiment/flour = 2,
		/obj/item/storage/box/bowls = 1,
		/obj/item/reagent_containers/glass/beaker/large = 1,
		/obj/item/soap/homemade = 1,
		/obj/item/lighter = 1
		)

/datum/outfit/loadout/slaveworker
	name = "Worker"
	suit = /obj/item/clothing/suit/armor/f13/slavelabor
	shoes =	/obj/item/clothing/shoes/f13/rag
	r_hand = /obj/item/flashlight/flare/torch
	backpack_contents = list(
		/obj/item/storage/bag/plants = 1,
		/obj/item/reagent_containers/food/snacks/grown/ambrosia/deus = 1,
		/obj/item/cultivator = 1,
		/obj/item/soap/homemade = 1,
		/obj/item/shovel/spade = 1
		)

/datum/outfit/loadout/slaveservant/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	if(H.gender == MALE)
		H.gender = FEMALE
		H.real_name = random_unique_name(FEMALE)
		H.name = H.real_name
		if(H.wear_id)
			var/obj/item/card/id/dogtag/L = H.wear_id
			L.registered_name = H.name
			L.update_label()

/*
Post Scriptum
Plans: Add recipes/traits to keep refining support roles, others will need some minor tweaking. Planned is making the medicus more of a improvised surgery master, using primitive tools to good effect, because its interesting and unique.
*/

// Legion Citizen
// Really only used for ID console
/datum/job/ncr/f13legioncitizen
	title = "Legion Citizen"
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13legioncitizen

/datum/outfit/job/CaesarsLegion/Legionnaire/f13legioncitizen
	name = "Legion Citizen (Role)"
	uniform = /obj/item/clothing/under/f13/doctor
	shoes = /obj/item/clothing/shoes/f13/fancy
	suit = /obj/item/clothing/suit/curator
	head = /obj/item/clothing/head/scarecrow_hat
	gloves = /obj/item/clothing/gloves/color/black
	glasses = /obj/item/clothing/glasses/welding
	id = /obj/item/card/id/dogtag/town/legion
	l_hand = /obj/item/shield/riot/buckler
	backpack_contents = list(
		/obj/item/melee/onehanded/machete/spatha = 1,
		)
