
# Customer creation
customer_names = [ 'Carlo Casorzo',
                   'Diego Arias',
                   'Gonzalo Sánchez',
                   'Juan Cristóbal Pazos',
                   'Macarena Standen',
                   'Felipe Finsterbusc',
                   'Alexander Holmes',
                   'Nicolás Schurmann',
                   'Daniela Gattoni',
                   'Pablo Jacobi',
                   'Rafael Sacaan',
                   'Rudyard Fuster',
                   'Nicolás Melgarejo',
                   'Sebastián Jimenez',
                   'Christian Helbig',
                   'Alexis Galdames',
                   'Camila Sánchez',
                   'Adolfo Mellado',
                   'Francisco Cortes',
                   'César Rivas' ]

Customer.delete_all                   
customer_names.each { |name| Customer.create name: name }

# Product creation
Product.delete_all

Product.create name:        'Jamón queso',
               description: 'Pan con jamón de pavo y queso',
               price:       650,
               image:       'http://lorempixel.com/300/300/food/1/'
               
Product.create name:        'Jamón palta',
               description: 'Pan con jamón de pavo y palta',
               price:       800,
               image:       'http://lorempixel.com/300/300/food/2/'

Product.create name:        'Tomate palta',
               description: 'Pan con tomate y palta',
               price:       650,
               image:       'http://lorempixel.com/300/300/food/3/'
               
Product.create name:        'Tomate queso fresco',
               description: 'Pan con tomate y queso fresco',
               price:       750,
               image:       'http://lorempixel.com/300/300/food/4/'