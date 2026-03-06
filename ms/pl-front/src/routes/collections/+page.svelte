<script>
	let searchQuery = $state('');
	let selectedBrands = $state(new Set());

	const collections = [
		{
			name: 'Nero Marquina',
			brand: 'Kerama Marazzi',
			country: 'Россия',
			countryFlag: '🇷🇺',
			image: '/images/hero-bathroom.png',
			tag: 'Хит продаж',
			tagColor: 'bg-amber-500',
			href: '/collections/nero-marquina'
		},
		{
			name: 'Calacatta Oro',
			brand: 'Atlas Concorde',
			country: 'Италия',
			countryFlag: '🇮🇹',
			image: '/images/tile-marble.png',
			tag: 'Люкс',
			tagColor: 'bg-violet-600',
			href: '/collections/calacatta-oro'
		},
		{
			name: 'Urban Craft',
			brand: 'Italon',
			country: 'Россия / Италия',
			countryFlag: '🇷🇺',
			image: '/images/tile-terrazzo.png',
			tag: 'Новинка',
			tagColor: 'bg-emerald-600',
			href: '/collections/urban-craft'
		},
		{
			name: 'Royal Deco',
			brand: 'Laparet',
			country: 'Россия',
			countryFlag: '🇷🇺',
			image: '/images/tile-geometric.png',
			tag: 'Эксклюзив',
			tagColor: 'bg-rose-600',
			href: '/collections/royal-deco'
		},
		{
			name: 'Emerald Kitchen',
			brand: 'Cersanit',
			country: 'Польша',
			countryFlag: '🇵🇱',
			image: '/images/tile-kitchen.png',
			tag: 'Популярное',
			tagColor: 'bg-sky-600',
			href: '/collections/emerald-kitchen'
		},
		{
			name: 'Hex Terracotta',
			brand: 'Estima',
			country: 'Россия',
			countryFlag: '🇷🇺',
			image: '/images/tile-hexagonal.png',
			tag: 'Тренд',
			tagColor: 'bg-orange-500',
			href: '/collections/hex-terracotta'
		},
		{
			name: 'Marble Sky',
			brand: 'Porcelanosa',
			country: 'Испания',
			countryFlag: '🇪🇸',
			image: '/images/tile-marble.png',
			tag: 'Люкс',
			tagColor: 'bg-violet-600',
			href: '/collections/marble-sky'
		},
		{
			name: 'Stone Loft',
			brand: 'Marazzi',
			country: 'Италия',
			countryFlag: '🇮🇹',
			image: '/images/tile-geometric.png',
			tag: 'Новинка',
			tagColor: 'bg-emerald-600',
			href: '/collections/stone-loft'
		},
		{
			name: 'Nordic Hex',
			brand: 'Rako',
			country: 'Чехия',
			countryFlag: '🇨🇿',
			image: '/images/tile-hexagonal.png',
			tag: 'Хит продаж',
			tagColor: 'bg-amber-500',
			href: '/collections/nordic-hex'
		},
		{
			name: 'Terra Bianca',
			brand: 'Gracia',
			country: 'Россия',
			countryFlag: '🇷🇺',
			image: '/images/tile-kitchen.png',
			tag: 'Популярное',
			tagColor: 'bg-sky-600',
			href: '/collections/terra-bianca'
		},
		{
			name: 'Granit Palace',
			brand: 'Cerrad',
			country: 'Польша',
			countryFlag: '🇵🇱',
			image: '/images/tile-terrazzo.png',
			tag: 'Тренд',
			tagColor: 'bg-orange-500',
			href: '/collections/granit-palace'
		},
		{
			name: 'Eterno Bianco',
			brand: 'Rex',
			country: 'Италия',
			countryFlag: '🇮🇹',
			image: '/images/hero-bathroom.png',
			tag: 'Эксклюзив',
			tagColor: 'bg-rose-600',
			href: '/collections/eterno-bianco'
		}
	];

	const brands = [...new Set(collections.map((c) => c.brand))];

	function toggleBrand(brand) {
		const next = new Set(selectedBrands);
		if (next.has(brand)) {
			next.delete(brand);
		} else {
			next.add(brand);
		}
		selectedBrands = next;
	}

	const filteredCollections = $derived(
		collections.filter((c) => {
			const q = searchQuery.toLowerCase();
			const matchesSearch = q === '' || c.name.toLowerCase().includes(q);
			const matchesBrand = selectedBrands.size === 0 || selectedBrands.has(c.brand);
			return matchesSearch && matchesBrand;
		})
	);
</script>

<svelte:head>
	<title>Коллекции — PLITKA</title>
	<meta
		name="description"
		content="Каталог коллекций керамической плитки PLITKA: Nero Marquina, Calacatta Oro, Urban Craft и многие другие. Фильтрация по бренду и стране."
	/>
</svelte:head>

<!-- ===== HERO ===== -->
<section class="relative flex min-h-[48vh] items-center overflow-hidden">
	<!-- Background -->
	<div
		class="absolute inset-0 bg-gradient-to-br from-surface-900 via-surface-900 to-surface-800"
	></div>

	<!-- Grid pattern -->
	<div
		class="pointer-events-none absolute inset-0 opacity-[0.03]"
		style="background-image: linear-gradient(rgba(201,169,110,0.5) 1px, transparent 1px), linear-gradient(90deg, rgba(201,169,110,0.5) 1px, transparent 1px); background-size: 60px 60px;"
	></div>

	<!-- Glow orb -->
	<div class="absolute top-1/2 right-1/4 -translate-y-1/2">
		<div class="size-[500px] rounded-full bg-accent-500/6 blur-3xl"></div>
	</div>

	<div class="relative z-10 w-full px-10 pt-40 pb-20 lg:px-24 xl:px-32">
		<!-- Tag pill -->
		<div
			class="mb-8 inline-flex items-center gap-2 rounded-full border border-accent-500/20 bg-accent-500/5 px-4 py-1.5"
		>
			<span class="size-2 rounded-full bg-accent-500"></span>
			<span class="text-xs font-semibold tracking-wider text-accent-500 uppercase"
				>Каталог 2026</span
			>
		</div>

		<h1
			class="font-display text-5xl leading-tight font-bold tracking-tight text-white sm:text-6xl lg:text-7xl"
		>
			Коллекции
			<span class="bg-gradient-to-r from-accent-500 to-accent-300 bg-clip-text text-transparent"
				>плитки</span
			>
		</h1>

		<p class="mt-6 max-w-2xl text-lg leading-relaxed text-surface-300">
			Откройте для себя <span class="font-semibold text-accent-500">{collections.length}+</span> уникальных
			коллекций от ведущих мировых производителей керамической плитки.
		</p>

		<!-- Quick stats -->
		<div class="mt-12 flex flex-wrap gap-10 border-t border-surface-700/40 pt-8">
			<div>
				<div class="font-display text-2xl font-bold text-accent-500">{collections.length}</div>
				<div class="mt-0.5 text-xs tracking-wide text-surface-400">Коллекций</div>
			</div>
			<div>
				<div class="font-display text-2xl font-bold text-accent-500">12+</div>
				<div class="mt-0.5 text-xs tracking-wide text-surface-400">Брендов</div>
			</div>
			<div>
				<div class="font-display text-2xl font-bold text-accent-500">5</div>
				<div class="mt-0.5 text-xs tracking-wide text-surface-400">Стран</div>
			</div>
		</div>
	</div>
</section>

<!-- ===== COLLECTIONS SECTION ===== -->
<section class="relative py-24 lg:py-32">
	<div class="px-10 lg:px-24 xl:px-32">
		<!-- Filter bar -->
		<div class="mb-10 flex flex-col gap-5 lg:flex-row lg:items-center lg:justify-between">
			<!-- Search -->
			<div class="relative w-full max-w-sm">
				<svg
					viewBox="0 0 20 20"
					class="pointer-events-none absolute top-1/2 left-4 size-4 -translate-y-1/2 fill-surface-500"
				>
					<path
						fill-rule="evenodd"
						d="M9 3.5a5.5 5.5 0 100 11 5.5 5.5 0 000-11zM2 9a7 7 0 1112.452 4.391l3.328 3.329a.75.75 0 11-1.06 1.06l-3.329-3.328A7 7 0 012 9z"
						clip-rule="evenodd"
					/>
				</svg>
				<input
					id="collections-search"
					type="text"
					bind:value={searchQuery}
					placeholder="Поиск по названию коллекции..."
					class="w-full rounded-xl border border-surface-600 bg-surface-800/50 py-3.5 pr-5 pl-11 text-sm text-white placeholder-surface-400 transition-all duration-300 outline-none focus:border-accent-500/60 focus:bg-surface-800 focus:ring-2 focus:ring-accent-500/15"
				/>
			</div>

			<!-- Brand filter pills -->
			<div class="flex flex-wrap gap-2">
				<!-- Reset button -->
				<button
					onclick={() => (selectedBrands = new Set())}
					class="rounded-full border px-4 py-2 text-xs font-semibold tracking-wide transition-all duration-200 {selectedBrands.size ===
					0
						? 'border-accent-500 bg-accent-500/10 text-accent-500'
						: 'border-surface-600 bg-surface-800/40 text-surface-300 hover:border-surface-500 hover:text-surface-200'}"
				>
					Все
				</button>
				{#each brands as brand (brand)}
					<button
						onclick={() => toggleBrand(brand)}
						class="rounded-full border px-4 py-2 text-xs font-semibold tracking-wide transition-all duration-200 {selectedBrands.has(
							brand
						)
							? 'border-accent-500 bg-accent-500/10 text-accent-500'
							: 'border-surface-600 bg-surface-800/40 text-surface-300 hover:border-surface-500 hover:text-surface-200'}"
					>
						{brand}
					</button>
				{/each}
			</div>
		</div>

		<!-- Results count -->
		<p class="mb-8 text-sm text-surface-400">
			{#if filteredCollections.length === collections.length}
				Все {collections.length} коллекций
			{:else}
				Найдено: <span class="text-accent-500">{filteredCollections.length}</span> из {collections.length}
			{/if}
		</p>

		<!-- Collections grid -->
		{#if filteredCollections.length > 0}
			<div class="grid grid-cols-1 gap-6 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4">
				{#each filteredCollections as item (item.name)}
					<a
						href={item.href}
						class="group relative flex flex-col overflow-hidden rounded-2xl border border-surface-700/50 bg-surface-800/40 transition-all duration-500 hover:border-accent-500/30 hover:shadow-2xl hover:shadow-accent-500/5"
					>
						<!-- Image -->
						<div class="relative aspect-[4/3] overflow-hidden">
							<img
								src={item.image}
								alt={item.name}
								class="size-full object-cover transition-transform duration-700 group-hover:scale-110"
							/>
							<!-- Gradient overlay -->
							<div
								class="absolute inset-0 bg-gradient-to-t from-surface-900/70 via-transparent to-transparent opacity-60 transition-opacity duration-500 group-hover:opacity-80"
							></div>

							<!-- Tag badge -->
							<div class="absolute top-3 left-3">
								<span
									class="rounded-lg {item.tagColor} px-2.5 py-1 text-[10px] font-bold tracking-wider text-white uppercase shadow-lg"
								>
									{item.tag}
								</span>
							</div>

							<!-- Country flag (bottom right of image) -->
							<div class="absolute right-3 bottom-3">
								<div
									class="flex items-center gap-1.5 rounded-lg border border-white/10 bg-surface-900/70 px-2.5 py-1.5 backdrop-blur-sm"
								>
									<span class="text-base leading-none">{item.countryFlag}</span>
									<span class="text-[11px] font-medium text-surface-200">{item.country}</span>
								</div>
							</div>
						</div>

						<!-- Content -->
						<div class="flex flex-1 flex-col p-5">
							<!-- Brand -->
							<div class="text-[10px] font-semibold tracking-[0.25em] text-accent-500/80 uppercase">
								{item.brand}
							</div>

							<!-- Collection name -->
							<h2
								class="mt-1.5 text-base font-bold text-white transition-colors duration-300 group-hover:text-accent-400"
							>
								{item.name}
							</h2>

							<!-- Footer row -->
							<div
								class="mt-4 mt-auto flex items-center justify-between border-t border-surface-700/40 pt-4"
							>
								<span class="text-xs text-surface-400">Смотреть коллекцию</span>
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
					</a>
				{/each}
			</div>
		{:else}
			<!-- Empty state -->
			<div class="flex flex-col items-center py-24 text-center">
				<div class="mb-5 text-5xl">🔍</div>
				<h3 class="text-xl font-bold text-white">Ничего не найдено</h3>
				<p class="mt-2 text-surface-400">Попробуйте изменить запрос или сбросить фильтры</p>
				<button
					onclick={() => {
						searchQuery = '';
						selectedBrands = new Set();
					}}
					class="mt-6 rounded-xl border border-surface-600 px-6 py-3 text-sm font-medium text-surface-300 transition-all hover:border-surface-400 hover:text-white"
				>
					Сбросить фильтры
				</button>
			</div>
		{/if}
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

	<div class="relative px-8 text-center lg:px-16 xl:px-20">
		<h2 class="font-display text-4xl font-bold tracking-wide text-white lg:text-5xl">
			Не нашли нужную коллекцию?
		</h2>
		<p class="mx-auto mt-6 max-w-xl text-lg text-surface-300">
			Свяжитесь с нами — мы поможем подобрать идеальную плитку под ваш проект и бюджет.
		</p>
		<div class="mt-10 flex flex-wrap items-center justify-center gap-4">
			<a
				href="/contacts"
				class="inline-flex items-center gap-3 rounded-xl bg-accent-500 px-8 py-4 text-sm font-bold tracking-wide text-surface-900 uppercase transition-all duration-300 hover:bg-accent-400 hover:shadow-2xl hover:shadow-accent-500/30"
			>
				Связаться с нами
				<svg viewBox="0 0 20 20" class="size-4 fill-current">
					<path
						fill-rule="evenodd"
						d="M3 10a.75.75 0 01.75-.75h10.638L10.23 5.29a.75.75 0 111.04-1.08l5.5 5.25a.75.75 0 010 1.08l-5.5 5.25a.75.75 0 11-1.04-1.08l4.158-3.96H3.75A.75.75 0 013 10z"
						clip-rule="evenodd"
					/>
				</svg>
			</a>
			<a
				href="/brands"
				class="inline-flex items-center gap-2 rounded-xl border border-surface-500 px-8 py-4 text-sm font-semibold tracking-wide text-surface-200 transition-all duration-300 hover:border-surface-300 hover:text-white"
			>
				Все бренды
			</a>
		</div>
	</div>
</section>
