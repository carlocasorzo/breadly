
# Customer creation

customer_names = [ 'Carlo Casorzo',
                   'Diego Arias',
                   'Gonzalo Sanchez',
                   'Juan Cristobal Paz',
                   'Macarena Standen',
                   'Felipe Finsterbusc',
                   'Alexander Holmes',
                   'Nicolas Schurmann',
                   'Daniela Gattoni',
                   'Pablo Jacobi',
                   'Rafael Sacaan',
                   'Rudyard Fuster',
                   'Nicolas Melgarejo',
                   'Sebastian Jimenez',
                   'Christian Helbig',
                   'Alexis Galdames',
                   'Camila Sanchez',
                   'Adolfo Mellado',
                   'Francisco Cortes',
                   'Cesar Rivas' ]

Customer.delete_all                   
customer_names.each { |name| Customer.create name: name }