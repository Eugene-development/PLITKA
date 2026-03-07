<script>
	const categories = [
		{
			id: 'ceramic',
			name: 'Керамическая плитка',
			icon: '🟫',
			description:
				'Классическая керамическая плитка для стен и полов. Широкий выбор форматов, цветов и фактур для любого интерьера.',
			tags: ['Ванная', 'Кухня', 'Прихожая'],
			sizes: ['20×30', '25×50', '30×60'],
			features: ['Влагостойкость', 'Лёгкая укладка', 'Доступная цена']
		},
		{
			id: 'porcelain',
			name: 'Керамогранит',
			icon: '⬛',
			description:
				'Прочный и долговечный материал с низким водопоглощением. Подходит для высоконагруженных зон и уличного применения.',
			tags: ['Пол', 'Фасад', 'Терраса'],
			sizes: ['60×60', '80×80', '120×60'],
			features: ['Высокая прочность', 'Морозостойкость', 'Большие форматы']
		},
		{
			id: 'mosaic',
			name: 'Мозаика',
			icon: '🔷',
			description:
				'Декоративная мозаика из стекла, камня или керамики. Создаёт уникальные акценты в интерьере и художественные панно.',
			tags: ['Декор', 'Акцентная стена', 'Бассейн'],
			sizes: ['2,5×2,5', '5×5', '10×10'],
			features: ['Декоративность', 'Гибкость применения', 'Уникальность']
		},
		{
			id: 'natural-stone',
			name: 'Натуральный камень',
			icon: '🪨',
			description:
				'Мрамор, гранит, травертин и сланец. Эксклюзивный природный материал с уникальным рисунком каждой плиты.',
			tags: ['Люкс', 'Интерьер', 'Спа'],
			sizes: ['Индивидуальный раскрой'],
			features: ['Натуральность', 'Эксклюзивность', 'Долговечность']
		},
		{
			id: 'decor',
			name: 'Декоративные элементы',
			icon: '✨',
			description:
				'Бордюры, вставки, декоры и панно. Создайте изысканный акцент и завершённость любой плиточной композиции.',
			tags: ['Бордюр', 'Вставка', 'Панно'],
			sizes: ['Различные'],
			features: ['Дизайн', 'Акцент', 'Завершённость']
		},
		{
			id: 'outdoor',
			name: 'Уличные покрытия',
			icon: '🏡',
			description:
				'Клинкер, брусчатка и противоскользящий керамогранит для террас, садовых дорожек и открытых площадок.',
			tags: ['Терраса', 'Сад', 'Бассейн'],
			sizes: ['30×30', '40×40', '60×60'],
			features: ['Морозостойкость', 'Нескользящая поверхность', 'Уличное применение']
		}
	];

	const materialStats = [
		{ value: '10 000+', label: 'позиций в наличии' },
		{ value: '50+', label: 'брендов-производителей' },
		{ value: '6', label: 'категорий материалов' },
		{ value: '15 лет', label: 'опыта в продажах' }
	];
</script>

<svelte:head>
	<title>Материалы — PLITKA</title>
	<meta
		name="description"
		content="Каталог отделочных материалов PLITKA: керамическая плитка, керамогранит, мозаика, натуральный камень, декоры и уличные покрытия."
	/>
</svelte:head>

<!-- ===== HERO ===== -->
<section class="relative flex min-h-[52vh] items-center overflow-hidden">
	<div
		class="absolute inset-0 bg-gradient-to-br from-surface-900 via-surface-900 to-surface-800"
	></div>
	<!-- Grid pattern -->
	<div
		class="pointer-events-none absolute inset-0 opacity-[0.03]"
		style="background-image: linear-gradient(rgba(201,169,110,0.5) 1px, transparent 1px), linear-gradient(90deg, rgba(201,169,110,0.5) 1px, transparent 1px); background-size: 60px 60px;"
	></div>
	<!-- Glow -->
	<div class="absolute top-1/2 left-1/4 -translate-x-1/2 -translate-y-1/2">
		<div class="size-[600px] rounded-full bg-accent-500/5 blur-3xl"></div>
	</div>
	<div class="absolute right-0 bottom-0 translate-x-1/4 translate-y-1/4">
		<div class="size-[400px] rounded-full bg-accent-600/4 blur-3xl"></div>
	</div>

	<div class="relative z-10 w-full px-10 pt-40 pb-20 lg:px-24 xl:px-32">
		<div
			class="mb-8 inline-flex items-center gap-2 rounded-full border border-accent-500/20 bg-accent-500/5 px-4 py-1.5"
		>
			<span class="size-2 rounded-full bg-accent-500"></span>
			<span class="text-xs font-semibold tracking-wider text-accent-500 uppercase">Ассортимент</span
			>
		</div>
		<h1
			class="font-display text-5xl leading-tight font-bold tracking-tight text-white sm:text-6xl lg:text-7xl"
		>
			Материалы
		</h1>
		<p class="mt-6 max-w-2xl text-lg leading-relaxed text-surface-300">
			Полный ассортимент отделочных материалов для вашего проекта: от классической керамики до
			<span class="font-semibold text-accent-500">эксклюзивного натурального камня</span>.
		</p>

		<!-- Stats row -->
		<div class="mt-12 flex flex-wrap gap-10">
			{#each materialStats as stat (stat.label)}
				<div>
					<div class="font-display text-3xl font-bold text-accent-500">{stat.value}</div>
					<div class="mt-1 text-sm text-surface-400">{stat.label}</div>
				</div>
			{/each}
		</div>
	</div>
</section>

<!-- ===== CATEGORIES ===== -->
<section class="relative py-24 lg:py-32">
	<div class="px-10 lg:px-24 xl:px-32">
		<!-- Section header -->
		<div class="mb-16">
			<h2 class="font-display text-3xl font-bold text-white lg:text-4xl">Категории материалов</h2>
			<p class="mt-4 max-w-xl text-surface-400">
				Все виды плитки и облицовочных материалов в одном месте. Подберём оптимальное решение для
				любой задачи.
			</p>
		</div>

		<!-- Categories grid -->
		<div class="grid grid-cols-1 gap-6 sm:grid-cols-2 lg:grid-cols-3">
			{#each categories as cat (cat.id)}
				<div
					class="group relative flex flex-col rounded-2xl border border-surface-700/50 bg-surface-800/40 p-8 transition-all duration-500 hover:border-accent-500/30 hover:bg-surface-800/70 hover:shadow-2xl hover:shadow-accent-500/5"
				>
					<!-- Icon & name -->
					<div class="mb-5 flex items-start gap-4">
						<span class="text-3xl">{cat.icon}</span>
						<h3
							class="font-display text-xl font-bold text-white transition-colors duration-300 group-hover:text-accent-500"
						>
							{cat.name}
						</h3>
					</div>

					<!-- Description -->
					<p class="flex-1 text-sm leading-relaxed text-surface-300">
						{cat.description}
					</p>

					<!-- Tags -->
					<div class="mt-5 flex flex-wrap gap-1.5">
						{#each cat.tags as tag (tag)}
							<span
								class="rounded-full bg-accent-500/8 px-2.5 py-1 text-[10px] font-semibold tracking-wide text-accent-500/80 uppercase"
							>
								{tag}
							</span>
						{/each}
					</div>

					<!-- Divider -->
					<div class="my-5 border-t border-surface-700/50"></div>

					<!-- Features & Sizes -->
					<div class="grid grid-cols-2 gap-4">
						<div>
							<p class="mb-2 text-[10px] font-semibold tracking-wider text-surface-500 uppercase">
								Особенности
							</p>
							<ul class="space-y-1">
								{#each cat.features as f (f)}
									<li class="flex items-center gap-1.5 text-xs text-surface-300">
										<span class="size-1 shrink-0 rounded-full bg-accent-500/60"></span>
										{f}
									</li>
								{/each}
							</ul>
						</div>
						<div>
							<p class="mb-2 text-[10px] font-semibold tracking-wider text-surface-500 uppercase">
								Форматы, см
							</p>
							<ul class="space-y-1">
								{#each cat.sizes as s (s)}
									<li class="text-xs font-medium text-surface-200">{s}</li>
								{/each}
							</ul>
						</div>
					</div>

					<!-- CTA arrow -->
					<div class="mt-6 flex items-center justify-between border-t border-surface-700/50 pt-5">
						<span
							class="text-xs font-medium text-surface-400 transition-colors group-hover:text-surface-300"
						>
							Смотреть ассортимент
						</span>
						<div
							class="flex size-7 items-center justify-center rounded-full border border-surface-600 bg-surface-700/50 transition-all duration-300 group-hover:border-accent-500/50 group-hover:bg-accent-500/10"
						>
							<svg
								viewBox="0 0 12 12"
								class="size-3 fill-surface-400 transition-colors group-hover:fill-accent-500"
							>
								<path
									fill-rule="evenodd"
									d="M2 6a.5.5 0 01.5-.5h6.293L6.646 3.354a.5.5 0 01.708-.708l3 3a.5.5 0 010 .708l-3 3a.5.5 0 01-.708-.708L8.793 6.5H2.5A.5.5 0 012 6z"
									clip-rule="evenodd"
								/>
							</svg>
						</div>
					</div>
				</div>
			{/each}
		</div>
	</div>
</section>

<!-- ===== HOW WE WORK ===== -->
<section class="relative bg-surface-800/30 py-24 lg:py-32">
	<div
		class="pointer-events-none absolute inset-0 opacity-[0.02]"
		style="background-image: linear-gradient(rgba(201,169,110,0.5) 1px, transparent 1px), linear-gradient(90deg, rgba(201,169,110,0.5) 1px, transparent 1px); background-size: 40px 40px;"
	></div>

	<div class="relative px-10 lg:px-24 xl:px-32">
		<div class="mb-14 text-center">
			<h2 class="font-display text-3xl font-bold text-white lg:text-4xl">Как мы работаем</h2>
			<p class="mt-4 text-surface-400">Простой процесс от выбора до укладки</p>
		</div>

		<div class="grid grid-cols-1 gap-8 md:grid-cols-2 lg:grid-cols-4">
			{#each [{ step: '01', title: 'Консультация', desc: 'Обсуждаем ваш проект, замеры и предпочтения по дизайну' }, { step: '02', title: 'Подбор материала', desc: 'Предлагаем оптимальные варианты с учётом бюджета и стиля' }, { step: '03', title: 'Расчёт количества', desc: 'Точно рассчитываем необходимое количество с учётом раскладки и обрезков' }, { step: '04', title: 'Доставка и укладка', desc: 'Организуем доставку и при желании — укладку с нашими мастерами' }] as item (item.step)}
				<div class="relative">
					<div
						class="mb-4 inline-flex size-12 items-center justify-center rounded-xl border border-accent-500/20 bg-accent-500/5 font-display text-lg font-bold text-accent-500"
					>
						{item.step}
					</div>
					<h3 class="font-display text-lg font-bold text-white">{item.title}</h3>
					<p class="mt-2 text-sm leading-relaxed text-surface-400">{item.desc}</p>
				</div>
			{/each}
		</div>
	</div>
</section>

<!-- ===== CTA ===== -->
<section class="relative overflow-hidden py-24 lg:py-32">
	<div
		class="absolute inset-0 bg-gradient-to-br from-accent-600/20 via-surface-900 to-surface-900"
	></div>
	<div
		class="pointer-events-none absolute inset-0 opacity-[0.04]"
		style="background-image: linear-gradient(rgba(201,169,110,0.5) 1px, transparent 1px), linear-gradient(90deg, rgba(201,169,110,0.5) 1px, transparent 1px); background-size: 40px 40px;"
	></div>

	<div class="relative px-10 text-center lg:px-24 xl:px-32">
		<h2 class="font-display text-4xl font-bold tracking-wide text-white lg:text-5xl">
			Нужна помощь с выбором?
		</h2>
		<p class="mx-auto mt-6 max-w-xl text-lg text-surface-300">
			Наши специалисты помогут подобрать материал, рассчитать количество и подготовить смету для
			вашего проекта.
		</p>
		<div class="mt-10 flex flex-wrap items-center justify-center gap-4">
			<a
				href="/contacts"
				class="inline-flex items-center gap-3 rounded-xl bg-accent-500 px-8 py-4 text-sm font-bold tracking-wide text-surface-900 uppercase transition-all duration-300 hover:bg-accent-400 hover:shadow-2xl hover:shadow-accent-500/30"
			>
				Получить консультацию
				<svg viewBox="0 0 20 20" class="size-4 fill-current">
					<path
						fill-rule="evenodd"
						d="M3 10a.75.75 0 01.75-.75h10.638L10.23 5.29a.75.75 0 111.04-1.08l5.5 5.25a.75.75 0 010 1.08l-5.5 5.25a.75.75 0 11-1.04-1.08l4.158-3.96H3.75A.75.75 0 013 10z"
						clip-rule="evenodd"
					/>
				</svg>
			</a>
			<a
				href="/collections"
				class="inline-flex items-center gap-2 rounded-xl border border-surface-500 px-8 py-4 text-sm font-semibold tracking-wide text-surface-200 transition-all duration-300 hover:border-surface-300 hover:text-white"
			>
				Смотреть коллекции
			</a>
		</div>
	</div>
</section>
