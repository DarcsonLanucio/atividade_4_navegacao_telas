import '../model/recipe.dart';

final List<Recipe> initialRecipe = [
  // DOCES
  Recipe(
    id: 'd1',
    title: 'Brigadeiro Clássico',
    category: 'Doces',
    description: 'Docinho cremoso e fácil.',
    ingredients: [
      '1 lata de leite condensado',
      '2 col. (sopa) cacau em pó',
      '1 col. (sopa) manteiga',
      'Granulado a gosto',
    ],
    steps: [
      'Cozinhe em fogo baixo até desgrudar do fundo.',
      'Esfrie, enrole e passe no granulado.',
    ],
  ),
  Recipe(
    id: 'd2',
    title: 'Bolo de Cenoura',
    category: 'Doces',
    description: 'Fofinho com cobertura de chocolate.',
    ingredients: [
      '3 cenouras médias',
      '3 ovos',
      '1/2 xíc. óleo',
      '2 xíc. farinha',
      '1 xíc. açúcar',
      '1 col. (sopa) fermento',
    ],
    steps: [
      'Bata cenoura, ovos e óleo.',
      'Misture com secos e asse a 180°C por ~40 min.',
    ],
  ),
  Recipe(
    id: 'd3',
    title: 'Pudim de Leite',
    category: 'Doces',
    description: 'Clássico lisinho em banho-maria.',
    ingredients: [
      '1 lata leite condensado',
      '2 latas leite',
      '3 ovos',
      '1 xíc. açúcar (caramelo)',
    ],
    steps: [
      'Caramelize a forma.',
      'Bata tudo e asse em banho-maria a 180°C por ~1h.',
    ],
  ),

  // SALGADAS
  Recipe(
    id: 's1',
    title: 'Lasanha à Bolonhesa',
    category: 'Salgadas',
    description: 'Massa, molho e queijo em camadas.',
    ingredients: [
      'Massa de lasanha',
      '500 g carne moída',
      'Molho de tomate',
      'Mussarela, presunto e parmesão',
      'Sal e pimenta',
    ],
    steps: [
      'Refogue a carne e junte o molho.',
      'Monte camadas e leve ao forno até gratinar.',
    ],
  ),
  Recipe(
    id: 's2',
    title: 'Frango ao Curry',
    category: 'Salgadas',
    description: 'Aromático, cremoso e rápido.',
    ingredients: [
      '500 g peito de frango em cubos',
      '1 cebola',
      '2 col. (sopa) curry',
      '200 ml creme de leite',
      'Sal',
    ],
    steps: [
      'Doure cebola e frango.',
      'Adicione curry e creme até encorpar.',
    ],
  ),
  Recipe(
    id: 's3',
    title: 'Quiche de Alho-Poró',
    category: 'Salgadas',
    description: 'Massa amanteigada e recheio cremoso.',
    ingredients: [
      'Massa pronta',
      '2 talos de alho-poró',
      '3 ovos',
      '200 ml creme de leite',
      'Queijo a gosto',
    ],
    steps: [
      'Pré-asse a massa.',
      'Refogue alho-poró, misture com ovos, creme e queijo e asse.',
    ],
  ),

  // BEBIDAS
  Recipe(
    id: 'b1',
    title: 'Limonada Suiça',
    category: 'Bebidas',
    description: 'Refrescante com leve amargor.',
    ingredients: [
      '2 limões tahiti',
      '500 ml água gelada',
      'Açúcar a gosto',
      'Gelo',
    ],
    steps: [
      'Bata rapidamente com casca, coe, adoce e sirva com gelo.',
    ],
  ),
  Recipe(
    id: 'b2',
    title: 'Chocolate Quente',
    category: 'Bebidas',
    description: 'Cremoso e aveludado.',
    ingredients: [
      '500 ml leite',
      '2 col. (sopa) cacau',
      '100 g chocolate meio amargo',
      '1 col. (sopa) amido',
      'Açúcar a gosto',
    ],
    steps: [
      'Dissolva amido no leite, aqueça com cacau e açúcar.',
      'Junte o chocolate até engrossar.',
    ],
  ),
  Recipe(
    id: 'b3',
    title: 'Vitamina de Morango',
    category: 'Bebidas',
    description: 'Doce e nutritiva.',
    ingredients: [
      '200 g morangos',
      '250 ml leite',
      '1 banana',
      'Mel (opcional)',
    ],
    steps: [
      'Bata tudo e sirva gelado.',
    ],
  ),
];
