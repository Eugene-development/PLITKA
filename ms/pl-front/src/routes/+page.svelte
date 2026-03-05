<script>
	const categories = [
		{
			title: 'Настенная плитка',
			description: 'Элегантные решения для стен',
			image: '/images/tile-marble.png',
			count: '340+ вариантов',
			href: '/catalog/wall'
		},
		{
			title: 'Напольная плитка',
			description: 'Прочность и стиль для вашего пола',
			image: '/images/tile-hexagonal.png',
			count: '280+ вариантов',
			href: '/catalog/floor'
		},
		{
			title: 'Керамогранит',
			description: 'Премиальная отделка нового поколения',
			image: '/images/tile-geometric.png',
			count: '420+ вариантов',
			href: '/catalog/porcelain'
		},
		{
			title: 'Мозаика',
			description: 'Уникальные узоры для акцентных зон',
			image: '/images/tile-terrazzo.png',
			count: '190+ вариантов',
			href: '/catalog/mosaic'
		}
	];

	const collections = [
		{
			name: 'Nero Marquina',
			brand: 'Kerama Marazzi',
			price: 'от 2 890 ₽/м²',
			image: '/images/hero-bathroom.png',
			tag: 'Хит продаж'
		},
		{
			name: 'Calacatta Oro',
			brand: 'Atlas Concorde',
			price: 'от 4 150 ₽/м²',
			image: '/images/tile-marble.png',
			tag: 'Премиум'
		},
		{
			name: 'Urban Craft',
			brand: 'Italon',
			price: 'от 1 990 ₽/м²',
			image: '/images/tile-terrazzo.png',
			tag: 'Новинка'
		},
		{
			name: 'Royal Deco',
			brand: 'Laparet',
			price: 'от 3 490 ₽/м²',
			image: '/images/tile-geometric.png',
			tag: 'Эксклюзив'
		},
		{
			name: 'Emerald Kitchen',
			brand: 'Cersanit',
			price: 'от 1 690 ₽/м²',
			image: '/images/tile-kitchen.png',
			tag: 'Популярное'
		},
		{
			name: 'Hex Terracotta',
			brand: 'Estima',
			price: 'от 2 340 ₽/м²',
			image: '/images/tile-hexagonal.png',
			tag: 'Тренд'
		}
	];

	const advantages = [
		{
			icon: '🚚',
			title: 'Быстрая доставка',
			desc: 'Доставим по Москве за 24 часа, по России — от 2 дней'
		},
		{
			icon: '🛡️',
			title: 'Гарантия качества',
			desc: 'Только сертифицированная продукция с гарантией до 25 лет'
		},
		{
			icon: '📐',
			title: '3D-визуализация',
			desc: 'Бесплатная раскладка и визуализация вашего проекта'
		},
		{
			icon: '💰',
			title: 'Лучшие цены',
			desc: 'Прямые поставки от производителей без наценок посредников'
		}
	];

	const stats = [
		{ value: '50 +', label: 'Брендов' },
		{ value: '98%', label: 'Лояльность' },
		{ value: '15 +', label: 'Лет опыта' },
		{ value: '20 +', label: 'Городов' },
		{ value: '12к +', label: 'Артикулов' }
	];
</script>

<!-- ===== HERO SECTION ===== -->
<section class="relative flex min-h-screen items-center overflow-hidden">
	<!-- Background image with overlay -->
	<div class="absolute inset-0">
		<img
			src="/images/hero-bathroom.png"
			alt="Премиальный интерьер с керамической плиткой"
			class="size-full object-cover"
		/>
		<div
			class="absolute inset-0 bg-gradient-to-r from-surface-900 via-surface-900/85 to-surface-900/40"
		></div>
		<div
			class="absolute inset-0 bg-gradient-to-t from-surface-900 via-transparent to-surface-900/30"
		></div>
	</div>

	<!-- Grid pattern overlay -->
	<div
		class="pointer-events-none absolute inset-0 opacity-[0.03]"
		style="background-image: linear-gradient(rgba(201,169,110,0.5) 1px, transparent 1px), linear-gradient(90deg, rgba(201,169,110,0.5) 1px, transparent 1px); background-size: 60px 60px;"
	></div>

	<div class="relative z-10 px-10 pt-40 pb-24 lg:px-24 lg:pt-48 lg:pb-32 xl:px-32">
		<div>
			<!-- Tag -->
			<div
				class="mb-8 inline-flex items-center gap-2 rounded-full border border-accent-500/20 bg-accent-500/5 px-4 py-1.5"
			>
				<span class="size-2 rounded-full bg-accent-500"></span>
				<span class="text-xs font-semibold tracking-wider text-accent-500 uppercase">
					Коллекция 2026
				</span>
			</div>

			<!-- Heading -->
			<h1
				class="font-display text-5xl leading-tight font-bold tracking-tight text-white sm:text-6xl lg:text-7xl"
			>
				Искусство

				<span class="bg-gradient-to-r from-accent-500 to-accent-300 bg-clip-text text-transparent">
					керамики
				</span>
				<br />
				в каждой детали
			</h1>

			<!-- Subtitle -->
			<p class="mt-6 max-w-2xl text-lg leading-relaxed text-surface-300">
				Премиальная керамическая плитка от ведущих мировых производителей. Воплотите свои
				дизайнерские идеи в реальность.
			</p>

			<!-- CTA buttons -->
			<div class="mt-10 flex flex-wrap items-center gap-4">
				<a
					href="/catalog"
					class="group inline-flex items-center gap-3 rounded-xl bg-accent-500 px-8 py-4 text-sm font-bold tracking-wide text-surface-900 uppercase transition-all duration-300 hover:bg-accent-400 hover:shadow-2xl hover:shadow-accent-500/30"
				>
					Смотреть каталог
					<svg
						viewBox="0 0 20 20"
						class="size-4 fill-current transition-transform duration-300 group-hover:translate-x-1"
					>
						<path
							fill-rule="evenodd"
							d="M3 10a.75.75 0 01.75-.75h10.638L10.23 5.29a.75.75 0 111.04-1.08l5.5 5.25a.75.75 0 010 1.08l-5.5 5.25a.75.75 0 11-1.04-1.08l4.158-3.96H3.75A.75.75 0 013 10z"
							clip-rule="evenodd"
						/>
					</svg>
				</a>
				<a
					href="/designers"
					class="inline-flex items-center gap-2 rounded-xl border border-surface-500 px-8 py-4 text-sm font-semibold tracking-wide text-surface-200 transition-all duration-300 hover:border-surface-300 hover:text-white"
				>
					Курьер с образцом
				</a>
			</div>

			<!-- Mini stats row -->
			<div class="mt-16 flex flex-wrap gap-12 border-t border-surface-700/50 pt-8">
				{#each stats as stat (stat.label)}
					<div>
						<div class="font-display text-2xl font-bold text-accent-500">{stat.value}</div>
						<div class="mt-1 text-xs tracking-wide text-surface-400">{stat.label}</div>
					</div>
				{/each}
			</div>
		</div>
	</div>

	<!-- Scroll indicator -->
	<div class="absolute bottom-8 left-1/2 z-10 -translate-x-1/2">
		<div class="flex flex-col items-center gap-2">
			<span class="text-[10px] tracking-[0.2em] text-surface-300 uppercase">Скролл</span>
			<div
				class="flex h-10 w-6 items-start justify-center rounded-full border border-surface-300/50 p-1.5"
			>
				<div class="size-1.5 animate-bounce rounded-full bg-accent-500"></div>
			</div>
		</div>
	</div>
</section>

<!-- ===== CATEGORIES SECTION ===== -->
<section class="relative py-24 lg:py-32">
	<div class="px-10 lg:px-24 xl:px-32">
		<!-- Section header -->
		<div class="mb-16 flex flex-col items-start justify-between gap-6 md:flex-row md:items-end">
			<div>
				<span class="text-xs font-semibold tracking-[0.3em] text-accent-500 uppercase">
					Категории
				</span>
				<h2 class="mt-3 font-display text-4xl font-bold tracking-wide text-white lg:text-5xl">
					Подберите идеальную

					<span class="text-surface-300">плитку</span>
				</h2>
			</div>
			<a
				href="/catalog"
				class="group flex items-center gap-2 text-sm font-medium text-accent-500 transition-colors hover:text-accent-400"
			>
				Весь каталог
				<svg
					viewBox="0 0 20 20"
					class="size-4 fill-current transition-transform duration-300 group-hover:translate-x-1"
				>
					<path
						fill-rule="evenodd"
						d="M3 10a.75.75 0 01.75-.75h10.638L10.23 5.29a.75.75 0 111.04-1.08l5.5 5.25a.75.75 0 010 1.08l-5.5 5.25a.75.75 0 11-1.04-1.08l4.158-3.96H3.75A.75.75 0 013 10z"
						clip-rule="evenodd"
					/>
				</svg>
			</a>
		</div>

		<!-- Category cards grid -->
		<div class="grid grid-cols-1 gap-4 sm:grid-cols-2 lg:grid-cols-4">
			{#each categories as cat (cat.href)}
				<a
					href={cat.href}
					class="group relative overflow-hidden rounded-2xl border border-surface-700/50 bg-surface-800/50 transition-all duration-500 hover:border-accent-500/30 hover:shadow-2xl hover:shadow-accent-500/5"
				>
					<div class="aspect-[4/3] overflow-hidden">
						<img
							src={cat.image}
							alt={cat.title}
							class="size-full object-cover transition-transform duration-700 group-hover:scale-110"
						/>
						<div
							class="absolute inset-0 bg-gradient-to-t from-surface-900 via-surface-900/30 to-transparent"
						></div>
					</div>
					<div class="absolute right-0 bottom-0 left-0 p-6">
						<span
							class="mb-2 inline-block rounded-full bg-accent-500/20 px-3 py-1 text-[10px] font-bold tracking-wider text-accent-600 uppercase"
						>
							{cat.count}
						</span>
						<h3 class="text-lg font-bold text-white">{cat.title}</h3>
						<p class="mt-1 text-sm leading-relaxed text-surface-200">
							{cat.description}
						</p>
					</div>
				</a>
			{/each}
		</div>
	</div>
</section>

<!-- ===== FEATURED BANNER ===== -->
<section class="relative overflow-hidden py-24 lg:py-32">
	<!-- Background accent -->
	<div class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2">
		<div class="size-[600px] rounded-full bg-accent-500/5 blur-3xl"></div>
	</div>

	<div class="relative px-10 lg:px-24 xl:px-32">
		<div class="grid items-center gap-12 lg:grid-cols-2 lg:gap-16">
			<!-- Left: image composition -->
			<div class="relative">
				<div class="relative aspect-[4/3] overflow-hidden rounded-2xl">
					<img
						src="/images/tile-kitchen.png"
						alt="Современный интерьер кухни с керамической плиткой"
						class="size-full object-cover"
					/>
					<div class="absolute inset-0 rounded-2xl ring-1 ring-white/10 ring-inset"></div>
				</div>
				<!-- Floating card -->
				<div
					class="absolute -right-4 -bottom-6 rounded-xl border border-surface-600 bg-surface-800/90 p-5 shadow-2xl backdrop-blur-xl lg:-right-8"
				>
					<div class="flex items-center gap-3">
						<div class="flex size-12 items-center justify-center rounded-lg bg-accent-500/10">
							<span class="text-2xl">✨</span>
						</div>
						<div>
							<div class="text-sm font-bold text-white">3D-визуализация</div>
							<div class="text-xs text-surface-400">Бесплатно для заказов</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Right: content -->
			<div>
				<span class="text-xs font-semibold tracking-[0.3em] text-accent-500 uppercase">
					Для дизайнеров
				</span>
				<h2
					class="mt-4 font-display text-4xl leading-tight font-bold tracking-wide text-white lg:text-5xl"
				>
					Визуализируйте пространство
					<span class="text-surface-400">до покупки</span>
				</h2>
				<p class="mt-6 text-lg leading-relaxed text-surface-300">
					Наши специалисты создадут 3D-раскладку плитки в вашем интерьере. Увидьте результат до
					начала ремонта и будьте уверены в выборе.
				</p>
				<ul class="mt-8 flex flex-col gap-4">
					{#each ['Профессиональная 3D-раскладка', 'Расчёт количества материалов', 'Подбор затирки и аксессуаров', 'Консультация дизайнера'] as feature (feature)}
						<li class="flex items-center gap-3">
							<div class="flex size-6 items-center justify-center rounded-full bg-accent-500/10">
								<svg viewBox="0 0 12 12" class="size-3 fill-accent-500">
									<path
										d="M10.28 2.28L3.989 8.575 1.695 6.28A.751.751 0 00.633 7.345l2.83 2.83a.75.75 0 001.06 0l6.88-6.83a.751.751 0 00-1.123-1.065z"
									/>
								</svg>
							</div>
							<span class="text-sm text-surface-200">{feature}</span>
						</li>
					{/each}
				</ul>
				<a
					href="/designers"
					class="mt-10 inline-flex items-center gap-3 rounded-xl bg-accent-500 px-8 py-4 text-sm font-bold tracking-wide text-surface-900 uppercase transition-all duration-300 hover:bg-accent-400 hover:shadow-2xl hover:shadow-accent-500/30"
				>
					Заказать визуализацию
				</a>
			</div>
		</div>
	</div>
</section>

<!-- ===== COLLECTIONS GRID ===== -->
<section class="relative bg-surface-800/30 py-24 lg:py-32">
	<div class="px-10 lg:px-24 xl:px-32">
		<!-- Section header -->
		<div class="mb-16 text-center">
			<span class="text-xs font-semibold tracking-[0.3em] text-accent-500 uppercase">
				Популярное
			</span>
			<h2 class="mt-3 font-display text-4xl font-bold tracking-wide text-white lg:text-5xl">
				Бестселлеры коллекций
			</h2>
			<p class="mx-auto mt-4 max-w-2xl text-surface-400">
				Самые востребованные коллекции керамической плитки, выбранные нашими клиентами и
				профессиональными дизайнерами
			</p>
		</div>

		<!-- Product grid -->
		<div class="grid grid-cols-1 gap-4 sm:grid-cols-2 lg:grid-cols-3">
			{#each collections as item (item.name)}
				<div
					class="group relative overflow-hidden rounded-2xl border border-surface-700/50 bg-surface-800/80 transition-all duration-500 hover:border-accent-500/20 hover:shadow-2xl hover:shadow-accent-500/5"
				>
					<!-- Image -->
					<div class="relative aspect-[4/3] overflow-hidden">
						<img
							src={item.image}
							alt={item.name}
							class="size-full object-cover transition-transform duration-700 group-hover:scale-105"
						/>
						<div
							class="absolute inset-0 bg-gradient-to-t from-surface-900/80 to-transparent opacity-0 transition-opacity duration-500 group-hover:opacity-100"
						></div>
						<!-- Tag badge -->
						<div class="absolute top-4 left-4">
							<span
								class="rounded-lg bg-highlight px-3 py-1.5 text-[10px] font-bold tracking-wider text-white uppercase shadow-lg"
							>
								{item.tag}
							</span>
						</div>
					</div>

					<!-- Content -->
					<div class="p-5">
						<div class="text-[11px] font-medium tracking-wider text-surface-400 uppercase">
							{item.brand}
						</div>
						<h3
							class="mt-1 text-lg font-bold text-white transition-colors group-hover:text-accent-500"
						>
							{item.name}
						</h3>
						<div class="mt-3 flex items-center justify-between">
							<span class="font-display text-lg font-bold text-accent-500">
								{item.price}
							</span>
							<button
								class="flex items-center gap-2 rounded-lg border border-surface-600 bg-surface-700/50 px-4 py-2 text-xs font-medium text-surface-300 transition-all duration-300 hover:border-accent-500/40 hover:text-accent-500"
							>
								Подробнее
								<svg viewBox="0 0 20 20" class="size-3.5 fill-current">
									<path
										fill-rule="evenodd"
										d="M3 10a.75.75 0 01.75-.75h10.638L10.23 5.29a.75.75 0 111.04-1.08l5.5 5.25a.75.75 0 010 1.08l-5.5 5.25a.75.75 0 11-1.04-1.08l4.158-3.96H3.75A.75.75 0 013 10z"
										clip-rule="evenodd"
									/>
								</svg>
							</button>
						</div>
					</div>
				</div>
			{/each}
		</div>
	</div>
</section>

<!-- ===== ADVANTAGES SECTION ===== -->
<section class="relative py-24 lg:py-32">
	<div class="px-10 lg:px-24 xl:px-32">
		<div class="mb-16 text-center">
			<span class="text-xs font-semibold tracking-[0.3em] text-accent-500 uppercase">
				Почему мы
			</span>
			<h2 class="mt-3 font-display text-4xl font-bold tracking-wide text-white lg:text-5xl">
				Преимущества работы с нами
			</h2>
		</div>

		<div class="grid grid-cols-1 gap-6 sm:grid-cols-2 lg:grid-cols-4">
			{#each advantages as adv (adv.title)}
				<div
					class="group rounded-2xl border border-surface-700/50 bg-surface-800/30 p-8 transition-all duration-500 hover:border-accent-500/20 hover:bg-surface-800/60"
				>
					<div class="mb-5 text-4xl">{adv.icon}</div>
					<h3 class="text-lg font-bold text-white">{adv.title}</h3>
					<p class="mt-2 text-sm leading-relaxed text-surface-400">
						{adv.desc}
					</p>
				</div>
			{/each}
		</div>
	</div>
</section>

<!-- ===== CTA SECTION ===== -->
<section class="relative overflow-hidden py-24 lg:py-32">
	<!-- Background -->
	<div
		class="absolute inset-0 bg-gradient-to-br from-accent-600/20 via-surface-900 to-surface-900"
	></div>
	<div
		class="pointer-events-none absolute inset-0 opacity-[0.04]"
		style="background-image: linear-gradient(rgba(201,169,110,0.5) 1px, transparent 1px), linear-gradient(90deg, rgba(201,169,110,0.5) 1px, transparent 1px); background-size: 40px 40px;"
	></div>

	<div class="relative px-8 text-center lg:px-16 xl:px-20">
		<h2 class="font-display text-4xl font-bold tracking-wide text-white lg:text-5xl">
			Готовы начать проект?
		</h2>
		<p class="mx-auto mt-6 max-w-xl text-lg text-surface-300">
			Свяжитесь с нами для бесплатной консультации. Наши специалисты помогут подобрать идеальную
			плитку для вашего интерьера.
		</p>
		<div class="mt-10 flex flex-wrap items-center justify-center gap-4">
			<a
				href="tel:+78001234567"
				class="inline-flex items-center gap-3 rounded-xl bg-accent-500 px-8 py-4 text-sm font-bold tracking-wide text-surface-900 uppercase transition-all duration-300 hover:bg-accent-400 hover:shadow-2xl hover:shadow-accent-500/30"
			>
				Позвонить нам
			</a>
			<a
				href="/contacts"
				class="inline-flex items-center gap-2 rounded-xl border border-surface-500 px-8 py-4 text-sm font-semibold tracking-wide text-surface-200 transition-all duration-300 hover:border-surface-300 hover:text-white"
			>
				Оставить заявку
			</a>
		</div>
	</div>
</section>
