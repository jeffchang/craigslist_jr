require 'faker'
require 'securerandom'

@main_categories = {
	"nano" => ["drug", "target", "manip", "cosmetic", "aging", "prevent"],
	"autom" => ["prod", "human", "nlp", "markets"],
	"robots" => ["cars", "consumer", "supply", "dext"],
	"research" => ["store", "battery", "graphene", "hbp", "neural", "biopoly", "alloys", "gene", "bayes", "parallel", "bigdata", "bioinf", "fuel", "lhc", "data", "eco", "broadband", "mobile"],
	"embed" => ["sensors", "iot", "secure"],
	"bionics" => ["aug", "disable", "bci"],
	"energy" => ["renew", "grid", "evs", "fourth", "thorium", "fusion"],
	"space" => ["priv", "asteroid", "elev", "colonize", "terraform"],
	"strongai" => ["quantum", "dna", "singul", "skynet"],
	"talk" => ["news", "projects", "careers", "change", "plans", "links"]
}

@long_form = {
	"nano" => "Nanobots and Adv. Genetics",
	"autom" => "Knowledge Work Automation",
	"robots" => "Advanced Robotics",
	"embed" => "Embedded Electronics",
	"bionics" => "Bionics and Interfaces",
	"energy" => "The Energy Revolution",
	"space" => "Off-World / Space Travel",
	"strongai" => "Strong AI / The Singularity",
	"research" => "Component Tech Research",
	"talk" => "Misc FutureTalk",
	"drug" => "Drug Delivery Systems",
	"target" => "Targeted Therapies",
	"manip" => "Genetic Manipulation",
	"cosmetic" => "Cosmetic Procedures",
	"aging" => "Reversing Disability and Aging",
	"prevent" => "Preventative Health",
	"prod" => "Enhancing Productivity",
	"human" => "Replacing Humans",
	"nlp" => "Natural Language Processing",
	"markets" => "Automated Markets",
	"cars" => "Driverless Cars",
	"consumer" => "Consumer Robotics",
	"supply" => "Supply Chain Automation",
	"dext" => "High-Dexterity Robotics",
	"store" => "Energy Storage",
	"battery" => "Rapid Batteries",
	"graphene" => "Graphene",
	"hbp" => "Human Brain Project",
	"neural" => "Deep Learning / Neural Networks",
	"biopoly" => "Biopolymers",
	"alloys" => "Advanced Alloys",
	"gene" => "Genetics Research",
	"bayes" => "Bayesian Machine Learning",
	"parallel" => "Software Parallelization",
	"bigdata" => "Massive Data Analysis",
	"bioinf" => "Bioinformatics",
	"fuel" => "Fuel Research",
	"lhc" => "LHC / Accelerator Research",
	"data" => "Global Data Collection",
	"eco" => "Ecological Research",
	"broadband" => "Global Broadband",
	"mobile" => "Mobile Expansion",
	"sensors" => "Sensors",
	"iot" => "Internet of Things (RFID)",
	"secure" => "Security",
	"aug" => "Human Augmentation",
	"disable" => "Countering Disability",
	"bci" => "Brain-Computer Interfaces",
	"renew" => "Renewables",
	"grid" => "Smart / High-Throughput Grids",
	"evs" => "Electric Vehicles",
	"fourth" => "Fourth Gen Nuclear Reactors",
	"thorium" => "Thorium Reactors",
	"fusion" => "Nuclear Fusion",
	"priv" => "Private Travel",
	"asteroid" => "Asteroid Mining",
	"elev" => "Space Elevators",
	"colonize" => "Moon / Mars Colonization",
	"terraform" => "Small-Scale Terraforming",
	"quantum" => "Quantum Computing",
	"dna" => "DNA Computing",
	"singul" => "Breaching Human Intelligence",
	"skynet" => "Skynet",
	"news" => "Random News",
	"projects" => "New Projects",
	"careers" => "Awesome Careers",
	"change" => "Changing the World",
	"plans" => "My Plans",
	"links" => "Useful Links"
}

@main_categories.each do |main_cat, sub_cat|
	main = Maincategory.create({name: main_cat, full_title: @long_form[main_cat]})
	sub_cat.each { |category| Subcategory.create({name: category, maincategory: main, full_title: @long_form[category]}) }
end

Subcategory.all.each do |category|
	10.times do
		Post.create({title: Faker::Lorem.words(num = 5), description: Faker::Lorem.paragraph(sentence_count = 3), price: rand(1000..5000), email: Faker::Internet.email, subcategory: category, post_key: SecureRandom.hex(12)})
	end
end