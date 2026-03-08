<script>
	import { browser } from '$app/environment';

	// Demo products for the page (simulating a real catalog)
	const allProducts = [
		{
			id: 'nero-marquina',
			name: 'Nero Marquina',
			brand: 'Kerama Marazzi',
			price: 'от 2 890 ₽/м²',
			image: '/images/hero-bathroom.png',
			tag: 'Хит продаж',
			category: 'Настенная плитка',
			size: '30×60 см'
		},
		{
			id: 'calacatta-oro',
			name: 'Calacatta Oro',
			brand: 'Atlas Concorde',
			price: 'от 4 150 ₽/м²',
			image: '/images/tile-marble.png',
			tag: 'Люкс',
			category: 'Керамогранит',
			size: '60×120 см'
		},
		{
			id: 'urban-craft',
			name: 'Urban Craft',
			brand: 'Italon',
			price: 'от 1 990 ₽/м²',
			image: '/images/tile-terrazzo.png',
			tag: 'Новинка',
			category: 'Напольная плитка',
			size: '45×45 см'
		},
		{
			id: 'royal-deco',
			name: 'Royal Deco',
			brand: 'Laparet',
			price: 'от 3 490 ₽/м²',
			image: '/images/tile-geometric.png',
			tag: 'Эксклюзив',
			category: 'Декоры',
			size: '25×75 см'
		},
		{
			id: 'emerald-kitchen',
			name: 'Emerald Kitchen',
			brand: 'Cersanit',
			price: 'от 1 690 ₽/м²',
			image: '/images/tile-kitchen.png',
			tag: 'Популярное',
			category: 'Настенная плитка',
			size: '20×60 см'
		},
		{
			id: 'hex-terracotta',
			name: 'Hex Terracotta',
			brand: 'Estima',
			price: 'от 2 340 ₽/м²',
			image: '/images/tile-hexagonal.png',
			tag: 'Тренд',
			category: 'Мозаика',
			size: '9×10 см'
		}
	];

	// Read saved IDs once on init (SSR-safe)
	function readSaved() {
		if (!browser) return [];
		const raw = localStorage.getItem('plitka_favorites');
		if (raw) return JSON.parse(raw);
		// Populate with demo items on first visit so the page isn't empty
		const defaults = ['nero-marquina', 'calacatta-oro', 'hex-terracotta'];
		localStorage.setItem('plitka_favorites', JSON.stringify(defaults));
		return defaults;
	}

	let favoriteIds = $state(readSaved());

	// Derived list of favorited products
	let favorites = $derived(allProducts.filter((p) => favoriteIds.includes(p.id)));

	function removeFromFavorites(id) {
		favoriteIds = favoriteIds.filter((fid) => fid !== id);
		if (browser) {
			localStorage.setItem('plitka_favorites', JSON.stringify(favoriteIds));
		}
	}

	function clearAll() {
		favoriteIds = [];
		if (browser) {
			localStorage.setItem('plitka_favorites', JSON.stringify([]));
		}
	}

	function addAll() {
		favoriteIds = allProducts.map((p) => p.id);
		if (browser) {
			localStorage.setItem('plitka_favorites', JSON.stringify(favoriteIds));
		}
	}

	// Tag color mapping
	function tagColor(tag) {
		const map = {
			'Хит продаж': 'bg-rose-500/80',
			Люкс: 'bg-accent-500/80',
			Новинка: 'bg-emerald-500/80',
			Эксклюзив: 'bg-purple-500/80',
			Популярное: 'bg-sky-500/80',
			Тренд: 'bg-orange-500/80'
		};
		return map[tag] ?? 'bg-surface-600';
	}
</script>

<svelte:head>
	<title>PLITKA — Избранное</title>
	<meta
		name="description"
		content="Ваши избранные коллекции плитки PLITKA. Сохраняйте понравившиеся модели и возвращайтесь к ним в любое время."
	/>
</svelte:head>

<!-- ===== HERO ===== -->
<section class="relative flex min-h-[50vh] items-center overflow-hidden">
	<!-- Background -->
	<div
		class="absolute inset-0 bg-gradient-to-br from-surface-900 via-surface-900 to-surface-800"
	></div>
	<div
		class="pointer-events-none absolute inset-0 opacity-[0.03]"
		style="background-image: linear-gradient(rgba(201,169,110,0.5) 1px, transparent 1px), linear-gradient(90deg, rgba(201,169,110,0.5) 1px, transparent 1px); background-size: 60px 60px;"
	></div>
	<!-- Glow -->
	<div class="absolute top-1/2 right-1/4 translate-x-1/2 -translate-y-1/2">
		<div class="size-[500px] rounded-full bg-rose-500/5 blur-3xl"></div>
	</div>

	<div class="relative z-10 w-full px-10 pt-40 pb-20 lg:px-24 xl:px-32">
		<div
			class="mb-8 inline-flex items-center gap-2 rounded-full border border-rose-500/20 bg-rose-500/5 px-4 py-1.5"
		>
			<span class="size-2 rounded-full bg-rose-500"></span>
			<span class="text-xs font-semibold tracking-wider text-rose-400 uppercase">Ваши находки</span>
		</div>
		<h1
			class="font-display text-5xl leading-tight font-bold tracking-tight text-white sm:text-6xl lg:text-7xl"
		>
			Избранное
		</h1>
		<p class="mt-6 max-w-2xl text-lg leading-relaxed text-surface-300">
			Сохранённые коллекции плитки. Возвращайтесь к ним в любое время или поделитесь с дизайнером.
		</p>
	</div>
</section>

<!-- ===== FAVORITES SECTION ===== -->
<section class="relative py-24 lg:py-32">
	<div class="px-10 lg:px-24 xl:px-32">
		<!-- Header row -->
		<div class="mb-12 flex flex-col items-start justify-between gap-6 sm:flex-row sm:items-center">
			<div>
				<span class="text-xs font-semibold tracking-[0.3em] text-accent-500 uppercase">
					Коллекций сохранено
				</span>
				<h2 class="mt-2 font-display text-3xl font-bold tracking-wide text-white lg:text-4xl">
					{favorites.length}
					{#if favorites.length === 1}
						позиция
					{:else if favorites.length >= 2 && favorites.length <= 4}
						позиции
					{:else}
						позиций
					{/if}
				</h2>
			</div>

			<!-- Actions -->
			<div class="flex items-center gap-3">
				{#if favorites.length > 0}
					<button
						onclick={clearAll}
						class="flex items-center gap-2 rounded-xl border border-surface-600 bg-surface-800/50 px-5 py-2.5 text-sm font-medium text-surface-300 transition-all duration-300 hover:border-rose-500/40 hover:text-rose-400"
					>
						<svg viewBox="0 0 16 16" class="size-3.5 fill-current">
							<path
								fill-rule="evenodd"
								d="M5 3.25V4H2.75a.75.75 0 000 1.5h.3l.815 8.15A1.5 1.5 0 005.357 15h5.285a1.5 1.5 0 001.493-1.35l.815-8.15h.3a.75.75 0 000-1.5H11v-.75A2.25 2.25 0 008.75 1h-1.5A2.25 2.25 0 005 3.25zm2.25-.75a.75.75 0 00-.75.75V4h3v-.75a.75.75 0 00-.75-.75h-1.5zM6.05 6a.75.75 0 01.787.713l.275 5.5a.75.75 0 01-1.498.075l-.275-5.5A.75.75 0 016.05 6zm3.9 0a.75.75 0 01.712.787l-.275 5.5a.75.75 0 01-1.498-.075l.275-5.5A.75.75 0 019.95 6z"
								clip-rule="evenodd"
							/>
						</svg>
						Очистить всё
					</button>
				{/if}
				<a
					href="/collections"
					class="flex items-center gap-2 rounded-xl bg-accent-500 px-6 py-2.5 text-sm font-bold tracking-wide text-surface-900 uppercase transition-all duration-300 hover:bg-accent-400 hover:shadow-xl hover:shadow-accent-500/25"
				>
					Все коллекции
					<svg viewBox="0 0 20 20" class="size-4 fill-current">
						<path
							fill-rule="evenodd"
							d="M3 10a.75.75 0 01.75-.75h10.638L10.23 5.29a.75.75 0 111.04-1.08l5.5 5.25a.75.75 0 010 1.08l-5.5 5.25a.75.75 0 11-1.04-1.08l4.158-3.96H3.75A.75.75 0 013 10z"
							clip-rule="evenodd"
						/>
					</svg>
				</a>
			</div>
		</div>

		<!-- Empty state -->
		{#if favorites.length === 0}
			<div
				class="flex flex-col items-center justify-center rounded-3xl border border-dashed border-surface-600 py-32 text-center"
			>
				<!-- Heart icon -->
				<div
					class="mb-8 flex size-24 items-center justify-center rounded-full border border-surface-600 bg-surface-800/50"
				>
					<svg
						viewBox="0 0 24 24"
						class="size-12 fill-none stroke-surface-500 stroke-1"
						stroke-linecap="round"
						stroke-linejoin="round"
					>
						<path
							d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"
						/>
					</svg>
				</div>
				<h3 class="font-display text-2xl font-bold text-white">Пока ничего нет</h3>
				<p class="mx-auto mt-4 max-w-sm text-surface-300">
					Добавляйте понравившиеся коллекции в избранное, нажимая на иконку сердца на странице
					коллекции.
				</p>
				<div class="mt-8 flex flex-wrap items-center justify-center gap-4">
					<a
						href="/collections"
						class="inline-flex items-center gap-3 rounded-xl bg-accent-500 px-8 py-4 text-sm font-bold tracking-wide text-surface-900 uppercase transition-all duration-300 hover:bg-accent-400 hover:shadow-2xl hover:shadow-accent-500/30"
					>
						Смотреть коллекции
					</a>
					<!-- Demo: add all button for demonstration -->
					<button
						onclick={addAll}
						class="inline-flex items-center gap-2 rounded-xl border border-surface-500 px-8 py-4 text-sm font-semibold tracking-wide text-surface-200 transition-all duration-300 hover:border-surface-300 hover:text-white"
					>
						Показать пример
					</button>
				</div>
			</div>
		{:else}
			<!-- Products grid -->
			<div class="grid grid-cols-1 gap-5 sm:grid-cols-2 lg:grid-cols-3">
				{#each favorites as item (item.id)}
					<div
						class="group relative overflow-hidden rounded-2xl border border-surface-700/50 bg-surface-800/80 transition-all duration-500 hover:border-accent-500/20 hover:shadow-2xl hover:shadow-accent-500/5"
					>
						<!-- Remove button -->
						<button
							onclick={() => removeFromFavorites(item.id)}
							aria-label="Убрать из избранного"
							class="absolute top-4 right-4 z-10 flex size-9 items-center justify-center rounded-full border border-rose-500/30 bg-rose-500/10 text-rose-400 opacity-0 backdrop-blur-sm transition-all duration-300 group-hover:opacity-100 hover:border-rose-500 hover:bg-rose-500/20"
						>
							<svg
								viewBox="0 0 24 24"
								class="size-4 fill-rose-400 stroke-none"
								stroke-linecap="round"
								stroke-linejoin="round"
							>
								<path
									d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"
								/>
							</svg>
						</button>

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
									class="rounded-lg px-3 py-1.5 text-[10px] font-bold tracking-wider text-white uppercase shadow-lg {tagColor(
										item.tag
									)}"
								>
									{item.tag}
								</span>
							</div>
							<!-- Category badge -->
							<div
								class="absolute bottom-4 left-4 opacity-0 transition-opacity duration-300 group-hover:opacity-100"
							>
								<span
									class="rounded-full border border-white/20 bg-surface-900/80 px-3 py-1 text-[10px] font-medium tracking-wider text-surface-200 backdrop-blur-sm"
								>
									{item.category}
								</span>
							</div>
						</div>

						<!-- Content -->
						<div class="p-6">
							<div class="flex items-start justify-between gap-3">
								<div class="flex-1">
									<div class="text-[11px] font-medium tracking-wider text-surface-300 uppercase">
										{item.brand}
									</div>
									<h3
										class="mt-1 text-lg font-bold text-white transition-colors group-hover:text-accent-500"
									>
										{item.name}
									</h3>
								</div>
								<!-- Size tag -->
								<span
									class="mt-1 shrink-0 rounded-lg border border-surface-600 bg-surface-700/50 px-2.5 py-1 text-[11px] font-medium text-surface-300"
								>
									{item.size}
								</span>
							</div>

							<div
								class="mt-5 flex items-center justify-between border-t border-surface-700/50 pt-4"
							>
								<span class="font-display text-xl font-bold text-accent-500">
									{item.price}
								</span>
								<a
									href="/collections"
									class="flex items-center gap-2 rounded-lg border border-surface-600 bg-surface-700/40 px-4 py-2 text-xs font-medium text-surface-300 transition-all duration-300 hover:border-accent-500/40 hover:text-accent-500"
								>
									Подробнее
									<svg viewBox="0 0 20 20" class="size-3.5 fill-current">
										<path
											fill-rule="evenodd"
											d="M3 10a.75.75 0 01.75-.75h10.638L10.23 5.29a.75.75 0 111.04-1.08l5.5 5.25a.75.75 0 010 1.08l-5.5 5.25a.75.75 0 11-1.04-1.08l4.158-3.96H3.75A.75.75 0 013 10z"
											clip-rule="evenodd"
										/>
									</svg>
								</a>
							</div>
						</div>
					</div>
				{/each}
			</div>

			<!-- CTA strip -->
			<div
				class="relative mt-16 overflow-hidden rounded-3xl border border-surface-700/50 bg-surface-800/40 p-10 lg:p-14"
			>
				<div class="absolute top-1/2 right-0 translate-x-1/3 -translate-y-1/2">
					<div class="size-[300px] rounded-full bg-accent-500/5 blur-3xl"></div>
				</div>
				<div
					class="relative flex flex-col items-start gap-6 md:flex-row md:items-center md:justify-between"
				>
					<div>
						<span class="text-xs font-semibold tracking-[0.3em] text-accent-500 uppercase">
							Следующий шаг
						</span>
						<h3 class="mt-2 font-display text-2xl font-bold tracking-wide text-white lg:text-3xl">
							Закажите образцы домой
						</h3>
						<p class="mt-2 max-w-lg text-surface-300">
							Наш курьер бесплатно привезёт образцы из вашего списка избранного, чтобы вы могли
							оценить цвет и фактуру в реальных условиях.
						</p>
					</div>
					<a
						href="/contacts"
						class="inline-flex shrink-0 items-center gap-3 rounded-xl bg-accent-500 px-8 py-4 text-sm font-bold tracking-wide text-surface-900 uppercase transition-all duration-300 hover:bg-accent-400 hover:shadow-2xl hover:shadow-accent-500/30"
					>
						Заказать образцы
						<svg viewBox="0 0 20 20" class="size-4 fill-current">
							<path
								fill-rule="evenodd"
								d="M3 10a.75.75 0 01.75-.75h10.638L10.23 5.29a.75.75 0 111.04-1.08l5.5 5.25a.75.75 0 010 1.08l-5.5 5.25a.75.75 0 11-1.04-1.08l4.158-3.96H3.75A.75.75 0 013 10z"
								clip-rule="evenodd"
							/>
						</svg>
					</a>
				</div>
			</div>
		{/if}
	</div>
</section>
