<script>
	let searchQuery = $state('');
	let selectedBrands = $state(new Set());

	const brands = [
		{
			name: 'Kerama Marazzi',
			country: 'Россия',
			countryCode: 'ru',
			flag: '🇷🇺',
			description: 'Крупнейший производитель керамической плитки в России с итальянскими корнями.',
			tags: ['Настенная', 'Напольная', 'Мозаика'],
			href: '/brands/kerama-marazzi',
			founded: '1994'
		},
		{
			name: 'Atlas Concorde',
			country: 'Италия',
			countryCode: 'it',
			flag: '🇮🇹',
			description: 'Итальянский концерн, законодатель мод в мире фарфора и керамогранита.',
			tags: ['Керамогранит', 'Коллекции', 'Дизайн'],
			href: '/brands/atlas-concorde',
			founded: '1969'
		},
		{
			name: 'Italon',
			country: 'Россия / Италия',
			countryCode: 'ru',
			flag: '🇷🇺',
			description: 'Производит керамогранит по итальянским технологиям на заводах в России.',
			tags: ['Керамогранит', 'Интерьер', 'Архитектура'],
			href: '/brands/italon',
			founded: '1996'
		},
		{
			name: 'Laparet',
			country: 'Россия',
			countryCode: 'ru',
			flag: '🇷🇺',
			description: 'Российский бренд с широким ассортиментом плитки для любых интерьерных решений.',
			tags: ['Настенная', 'Напольная', 'Декоры'],
			href: '/brands/laparet',
			founded: '2003'
		},
		{
			name: 'Cersanit',
			country: 'Польша',
			countryCode: 'pl',
			flag: '🇵🇱',
			description: 'Один из крупнейших производителей керамики в Центральной и Восточной Европе.',
			tags: ['Ванная', 'Кухня', 'Напольная'],
			href: '/brands/cersanit',
			founded: '1990'
		},
		{
			name: 'Estima',
			country: 'Россия',
			countryCode: 'ru',
			flag: '🇷🇺',
			description: 'Современный российский производитель керамогранита и настенной плитки.',
			tags: ['Керамогранит', 'Фасад', 'Интерьер'],
			href: '/brands/estima',
			founded: '2000'
		},
		{
			name: 'Gracia',
			country: 'Россия',
			countryCode: 'ru',
			flag: '🇷🇺',
			description: 'Специализируется на элегантных коллекциях для жилых и коммерческих интерьеров.',
			tags: ['Настенная', 'Элегантность', 'Доступность'],
			href: '/brands/gracia',
			founded: '2007'
		},
		{
			name: 'Cerrad',
			country: 'Польша',
			countryCode: 'pl',
			flag: '🇵🇱',
			description: 'Польский производитель высококачественного керамогранита для пола и фасадов.',
			tags: ['Керамогранит', 'Фасад', 'Терраса'],
			href: '/brands/cerrad',
			founded: '1993'
		},
		{
			name: 'Porcelanosa',
			country: 'Испания',
			countryCode: 'es',
			flag: '🇪🇸',
			description: 'Испанская группа, эталон роскоши и инноваций в мировой керамической индустрии.',
			tags: ['Люкс', 'Роскошь', 'Дизайн'],
			href: '/brands/porcelanosa',
			founded: '1973'
		},
		{
			name: 'Rex',
			country: 'Италия',
			countryCode: 'it',
			flag: '🇮🇹',
			description: 'Итальянский бренд с фокусом на архитектурной керамике и больших форматах.',
			tags: ['Большой формат', 'Архитектура', 'Минимализм'],
			href: '/brands/rex',
			founded: '1960'
		},
		{
			name: 'Marazzi',
			country: 'Италия',
			countryCode: 'it',
			flag: '🇮🇹',
			description: 'Легендарный итальянский производитель, определяющий тренды в мировой керамике.',
			tags: ['Классика', 'Люкс', 'Коллекции'],
			href: '/brands/marazzi',
			founded: '1935'
		},
		{
			name: 'Rako',
			country: 'Чехия',
			countryCode: 'cz',
			flag: '🇨🇿',
			description: 'Чешский производитель с вековой историей, известный долговечностью продукции.',
			tags: ['Напольная', 'Фасад', 'Надёжность'],
			href: '/brands/rako',
			founded: '1883'
		}
	];

	const brandNames = brands.map((b) => b.name);

	function toggleBrand(name) {
		const next = new Set(selectedBrands);
		if (next.has(name)) {
			next.delete(name);
		} else {
			next.add(name);
		}
		selectedBrands = next;
	}

	const filteredBrands = $derived(
		brands.filter((b) => {
			const q = searchQuery.toLowerCase();
			const matchesSearch =
				q === '' ||
				b.name.toLowerCase().includes(q) ||
				b.country.toLowerCase().includes(q) ||
				b.tags.some((t) => t.toLowerCase().includes(q));
			const matchesBrand = selectedBrands.size === 0 || selectedBrands.has(b.name);
			return matchesSearch && matchesBrand;
		})
	);
</script>

<svelte:head>
	<title>Бренды — PLITKA</title>
	<meta
		name="description"
		content="Каталог брендов керамической плитки в PLITKA: Kerama Marazzi, Atlas Concorde, Italon, Porcelanosa и другие ведущие производители."
	/>
</svelte:head>

<!-- ===== HERO ===== -->
<section class="relative flex min-h-[48vh] items-center overflow-hidden">
	<div
		class="absolute inset-0 bg-gradient-to-br from-surface-900 via-surface-900 to-surface-800"
	></div>
	<div
		class="pointer-events-none absolute inset-0 opacity-[0.03]"
		style="background-image: linear-gradient(rgba(201,169,110,0.5) 1px, transparent 1px), linear-gradient(90deg, rgba(201,169,110,0.5) 1px, transparent 1px); background-size: 60px 60px;"
	></div>
	<div class="absolute top-1/2 left-1/3 -translate-x-1/2 -translate-y-1/2">
		<div class="size-[500px] rounded-full bg-accent-500/6 blur-3xl"></div>
	</div>

	<div class="relative z-10 w-full px-10 pt-40 pb-20 lg:px-24 xl:px-32">
		<div
			class="mb-8 inline-flex items-center gap-2 rounded-full border border-accent-500/20 bg-accent-500/5 px-4 py-1.5"
		>
			<span class="size-2 rounded-full bg-accent-500"></span>
			<span class="text-xs font-semibold tracking-wider text-accent-500 uppercase"
				>Наши партнёры</span
			>
		</div>
		<h1
			class="font-display text-5xl leading-tight font-bold tracking-tight text-white sm:text-6xl lg:text-7xl"
		>
			Бренды
		</h1>
		<p class="mt-6 max-w-2xl text-lg leading-relaxed text-surface-300">
			Прямые поставки от <span class="font-semibold text-accent-500">{brands.length}+</span> ведущих производителей
			керамической плитки из России, Италии, Испании и всей Европы.
		</p>
	</div>
</section>

<!-- ===== BRANDS SECTION ===== -->
<section class="relative py-24 lg:py-32">
	<div class="px-10 lg:px-24 xl:px-32">
		<!-- Filters bar -->
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
					id="brands-search"
					type="text"
					bind:value={searchQuery}
					placeholder="Поиск по бренду или стране..."
					class="w-full rounded-xl border border-surface-600 bg-surface-800/50 py-3.5 pr-5 pl-11 text-sm text-white placeholder-surface-300 transition-all duration-300 outline-none focus:border-accent-500/60 focus:bg-surface-800 focus:ring-2 focus:ring-accent-500/15"
				/>
			</div>

			<!-- Brand filter pills -->
			<div class="flex flex-wrap gap-2">
				<!-- Reset -->
				<button
					onclick={() => (selectedBrands = new Set())}
					class="rounded-full border px-4 py-2 text-xs font-semibold tracking-wide transition-all duration-200 {selectedBrands.size ===
					0
						? 'border-accent-500 bg-accent-500/10 text-accent-500'
						: 'border-surface-600 bg-surface-800/40 text-surface-300 hover:border-surface-500 hover:text-surface-200'}"
				>
					Все
				</button>
				{#each brandNames as name (name)}
					<button
						onclick={() => toggleBrand(name)}
						class="rounded-full border px-4 py-2 text-xs font-semibold tracking-wide transition-all duration-200 {selectedBrands.has(
							name
						)
							? 'border-accent-500 bg-accent-500/10 text-accent-500'
							: 'border-surface-600 bg-surface-800/40 text-surface-300 hover:border-surface-500 hover:text-surface-200'}"
					>
						{name}
					</button>
				{/each}
			</div>
		</div>

		<!-- Results count -->
		<p class="mb-8 text-sm text-surface-300">
			{#if filteredBrands.length === brands.length}
				Все {brands.length} брендов
			{:else}
				Найдено: <span class="text-accent-500">{filteredBrands.length}</span> из {brands.length}
			{/if}
		</p>

		<!-- Brand cards grid -->
		{#if filteredBrands.length > 0}
			<div class="grid grid-cols-1 gap-6 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4">
				{#each filteredBrands as brand (brand.name)}
					<a
						href={brand.href}
						class="group relative flex flex-col rounded-2xl border border-surface-700/50 bg-surface-800/40 p-7 transition-all duration-500 hover:border-accent-500/30 hover:bg-surface-800/70 hover:shadow-2xl hover:shadow-accent-500/5"
					>
						<!-- Top row: flag + year badge -->
						<div class="mb-5 flex items-start justify-between">
							<span class="text-2xl">{brand.flag}</span>
							<span
								class="rounded-lg border border-surface-600/50 bg-surface-700/30 px-2.5 py-1 text-[10px] font-semibold tracking-wider text-surface-300 uppercase"
							>
								с {brand.founded}
							</span>
						</div>

						<!-- Brand name -->
						<h2
							class="font-display text-xl font-bold text-white transition-colors duration-300 group-hover:text-accent-500"
						>
							{brand.name}
						</h2>

						<!-- Country -->
						<div class="mt-1.5 flex items-center gap-1.5">
							<!-- <svg viewBox="0 0 16 16" class="size-3 shrink-0 fill-accent-500/60">
								<path
									fill-rule="evenodd"
									d="M8 1a3.5 3.5 0 100 7 3.5 3.5 0 000-7zM4.5 4.5a3.5 3.5 0 117 0 3.5 3.5 0 01-7 0zM2.984 12.794A6.5 6.5 0 018 11c1.87 0 3.564.786 4.757 2.046A.75.75 0 0014 14H2a.75.75 0 001.243-.706 6.533 6.533 0 01-.259-.5z"
									clip-rule="evenodd"
								/>
							</svg> -->
							<span class="text-xs text-surface-300">{brand.country}</span>
						</div>

						<!-- Description -->
						<p class="mt-4 flex-1 text-sm leading-relaxed text-surface-300">
							{brand.description}
						</p>

						<!-- Tags -->
						<!-- <div class="mt-5 flex flex-wrap gap-1.5">
							{#each brand.tags as tag (tag)}
								<span
									class="rounded-full bg-accent-500/8 px-2.5 py-1 text-[10px] font-semibold tracking-wide text-accent-500/80 uppercase"
								>
									{tag}
								</span>
							{/each}
						</div> -->

						<!-- Footer link row -->
						<div class="mt-6 flex items-center justify-between border-t border-surface-700/50 pt-5">
							<span
								class="text-xs font-medium text-surface-300 transition-colors group-hover:text-surface-300"
							>
								Смотреть коллекции
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
					</a>
				{/each}
			</div>
		{:else}
			<!-- Empty state -->
			<div class="flex flex-col items-center py-24 text-center">
				<div class="mb-5 text-5xl">🔍</div>
				<h3 class="text-xl font-bold text-white">Ничего не найдено</h3>
				<p class="mt-2 text-surface-300">Попробуйте изменить запрос или сбросить фильтры</p>
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
			Не нашли нужный бренд?
		</h2>
		<p class="mx-auto mt-6 max-w-xl text-lg text-surface-300">
			Свяжитесь с нами — мы работаем с широким кругом производителей и поможем найти нужную
			коллекцию под ваш проект.
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
				href="/catalog"
				class="inline-flex items-center gap-2 rounded-xl border border-surface-500 px-8 py-4 text-sm font-semibold tracking-wide text-surface-200 transition-all duration-300 hover:border-surface-300 hover:text-white"
			>
				Смотреть каталог
			</a>
		</div>
	</div>
</section>
