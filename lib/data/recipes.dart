import '../model/recipe.dart';

final List<Recipe> kRecipes = [
  // DOCES
  Recipe(
    id: 'd1',
    title: 'Brigadeiro Clássico',
    category: 'Doces',
    description: 'O docinho mais amado do Brasil, cremoso e fácil.',
    ingredients: [
      '1 lata de leite condensado',
      '2 colheres (sopa) de cacau em pó',
      '1 colher (sopa) de manteiga',
      'Granulado a gosto'
    ],
    steps: [
      'Leve ao fogo baixo leite condensado, cacau e manteiga.',
      'Mexa até desgrudar do fundo.',
      'Esfrie, enrole e passe no granulado.'
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
      '1/2 xícara de óleo',
      '2 xícaras de farinha',
      '1 xícara de açúcar',
      '1 col. (sopa) fermento'
    ],
    steps: [
      'Bata cenoura, ovos e óleo.',
      'Misture secos e incorpore.',
      'Asse a 180°C por ~40 min. Cubra com calda de chocolate.'
    ],
  ),
  Recipe(
    id: 'd3',
    title: 'Pudim de Leite',
    category: 'Doces',
    description: 'Clássico lisinho sem furinhos se assar em banho-maria.',
    ingredients: [
      '1 lata de leite condensado',
      '2 latas de leite',
      '3 ovos',
      '1 xícara de açúcar (caramelo)'
    ],
    steps: [
      'Caramelize a forma.',
      'Bata os demais ingredientes e despeje.',
      'Asse em banho-maria a 180°C por 1h.'
    ],
  ),

  // SALGADAS
  Recipe(
    id: 's1',
    title: 'Lasanha à Bolonhesa',
    category: 'Salgadas',
    description: 'Conforto em camadas: massa, molho e queijo.',
    ingredients: [
      'Massa de lasanha',
      '500 g carne moída',
      'Molho de tomate',
      'Mussarela e presunto',
      'Parmesão',
      'Sal e pimenta'
    ],
    steps: [
      'Refogue a carne e junte o molho.',
      'Monte em camadas com queijos.',
      'Asse até gratinar.'
    ],
  ),
  Recipe(
    id: 's2',
    title: 'Frango ao Curry',
    category: 'Salgadas',
    description: 'Aromático, cremoso e pronto em meia hora.',
    ingredients: [
      '500 g peito de frango em cubos',
      '1 cebola',
      '2 col. (sopa) curry',
      '200 ml creme de leite',
      'Arroz para acompanhar'
    ],
    steps: [
      'Doure cebola e frango.',
      'Some curry e creme.',
      'Cozinhe até encorpar.'
    ],
  ),
  Recipe(
    id: 's3',
    title: 'Quiche de Alho-Poró',
    category: 'Salgadas',
    description: 'Massa amanteigada e recheio cremoso.',
    ingredients: [
      'Massa podre pronta',
      '2 talos de alho-poró',
      '3 ovos',
      '200 ml creme de leite',
      'Queijo a gosto'
    ],
    steps: [
      'Pré-asse a massa.',
      'Refogue o alho-poró.',
      'Misture ovos, creme e queijo, recheie e asse.'
    ],
  ),

  // BEBIDAS
  Recipe(
    id: 'b1',
    title: 'Limonada Suiça',
    category: 'Bebidas',
    description: 'Refrescante com leve amargor da casca.',
    ingredients: [
      '2 limões tahiti',
      '500 ml água gelada',
      'Açúcar ou adoçante',
      'Gelo'
    ],
    steps: [
      'Bata limões com água rapidamente com casca.',
      'Coe, adoçe e sirva com gelo.'
    ],
  ),
  Recipe(
    id: 'b2',
    title: 'Chocolate Quente Cremoso',
    category: 'Bebidas',
    description: 'Textura aveludada para dias frios.',
    ingredients: [
      '500 ml leite',
      '2 col. (sopa) cacau',
      '100 g chocolate meio amargo',
      '1 col. (sopa) amido',
      'Açúcar a gosto'
    ],
    steps: [
      'Dissolva amido no leite.',
      'Aqueça com cacau e açúcar.',
      'Junte o chocolate até engrossar.'
    ],
  ),
  Recipe(
    id: 'b3',
    title: 'Vitamina de Morango',
    category: 'Bebidas',
    description: 'Rápida, doce e nutritiva.',
    ingredients: [
      '200 g morangos',
      '250 ml leite',
      '1 banana',
      'Mel opcional'
    ],
    steps: [
      'Bata tudo no liquidificador.',
      'Sirva gelado.'
    ],
  ),
];
