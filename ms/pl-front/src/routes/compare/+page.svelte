<script>
	import { browser } from '$app/environment';

	// Full product catalog with specs for comparison
	const allProducts = [
		{
			id: 'nero-marquina',
			name: 'Nero Marquina',
			brand: 'Kerama Marazzi',
			price: '2 890',
			priceUnit: '₽/м²',
			image: '/images/hero-bathroom.png',
			tag: 'Хит продаж',
			category: 'Настенная плитка',
			size: '30×60 см',
			thickness: '9 мм',
			finish: 'Глянцевая',
			material: 'Керамика',
			waterAbsorption: '≤ 0.5%',
			slipResistance: 'R9',
			frostResistant: false,
			indoorOutdoor: 'Интерьер',
			origin: 'Италия',
			warranty: '25 лет',
			certifications: 'ISO 13006, ГОСТ'
		},
		{
			id: 'calacatta-oro',
			name: 'Calacatta Oro',
			brand: 'Atlas Concorde',
			price: '4 150',
			priceUnit: '₽/м²',
			image: '/images/tile-marble.png',
			tag: 'Люкс',
			category: 'Керамогранит',
			size: '60×120 см',
			thickness: '10 мм',
			finish: 'Полированная',
			material: 'Керамогранит',
			waterAbsorption: '≤ 0.1%',
			slipResistance: 'R10',
			frostResistant: true,
			indoorOutdoor: 'Интерьер / Экстерьер',
			origin: 'Италия',
			warranty: '30 лет',
			certifications: 'ISO 13006, CE, ГОСТ'
		},
		{
			id: 'urban-craft',
			name: 'Urban Craft',
			brand: 'Italon',
			price: '1 990',
			priceUnit: '₽/м²',
			image: '/images/tile-terrazzo.png',
			tag: 'Новинка',
			category: 'Напольная плитка',
			size: '45×45 см',
			thickness: '8.5 мм',
			finish: 'Матовая',
			material: 'Клинкер',
			waterAbsorption: '≤ 3%',
			slipResistance: 'R11',
			frostResistant: false,
			indoorOutdoor: 'Интерьер',
			origin: 'Россия',
			warranty: '15 лет',
			certifications: 'ГОСТ'
		},
		{
			id: 'royal-deco',
			name: 'Royal Deco',
			brand: 'Laparet',
			price: '3 490',
			priceUnit: '₽/м²',
			image: '/images/tile-geometric.png',
			tag: 'Эксклюзив',
			category: 'Декоры',
			size: '25×75 см',
			thickness: '9 мм',
			finish: 'Структурная',
			material: 'Натуральный камень',
			waterAbsorption: '≤ 1%',
			slipResistance: 'R9',
			frostResistant: false,
			indoorOutdoor: 'Интерьер',
			origin: 'Испания',
			warranty: '20 лет',
			certifications: 'ISO 13006, CE'
		},
		{
			id: 'emerald-kitchen',
			name: 'Emerald Kitchen',
			brand: 'Cersanit',
			price: '1 690',
			priceUnit: '₽/м²',
			image: '/images/tile-kitchen.png',
			tag: 'Популярное',
			category: 'Настенная плитка',
			size: '20×60 см',
			thickness: '8 мм',
			finish: 'Глянцевая',
			material: 'Керамогранит',
			waterAbsorption: '≤ 1%',
			slipResistance: 'R9',
			frostResistant: false,
			indoorOutdoor: 'Интерьер',
			origin: 'Польша',
			warranty: '10 лет',
			certifications: 'CE, ГОСТ'
		},
		{
			id: 'hex-terracotta',
			name: 'Hex Terracotta',
			brand: 'Estima',
			price: '2 340',
			priceUnit: '₽/м²',
			image: '/images/tile-hexagonal.png',
			tag: 'Тренд',
			category: 'Мозаика',
			size: '9×10 см',
			thickness: '7 мм',
			finish: 'Матовая',
			material: 'Керамогранит',
			waterAbsorption: '≤ 0.3%',
			slipResistance: 'R11',
			frostResistant: true,
			indoorOutdoor: 'Интерьер / Экстерьер',
			origin: 'Россия',
			warranty: '20 лет',
			certifications: 'ISO 13006, ГОСТ'
		}
	];

	// Comparison rows definition
	const specRows = [
		{ key: 'category', label: 'Категория', icon: '🏷️' },
		{ key: 'size', label: 'Размер', icon: '📐' },
		{ key: 'thickness', label: 'Толщина', icon: '📏' },
		{ key: 'material', label: 'Материал', icon: '🪨' },
		{ key: 'finish', label: 'Поверхность', icon: '✨' },
		{ key: 'waterAbsorption', label: 'Водопоглощение', icon: '💧' },
		{ key: 'slipResistance', label: 'Скользкость', icon: '🦶' },
		{ key: 'frostResistant', label: 'Морозостойкость', icon: '❄️', type: 'boolean' },
		{ key: 'indoorOutdoor', label: 'Применение', icon: '🏠' },
		{ key: 'origin', label: 'Страна', icon: '🌍' },
		{ key: 'warranty', label: 'Гарантия', icon: '🛡️' },
		{ key: 'certifications', label: 'Сертификаты', icon: '📋' }
	];

	// ── State ──────────────────────────────────────────────────────────────────

	function readCompare() {
		if (!browser) return [];
		const raw = localStorage.getItem('plitka_compare');
		if (raw) return JSON.parse(raw);
		// Seed with 3 demo items on first visit
		const defaults = ['nero-marquina', 'calacatta-oro', 'urban-craft'];
		localStorage.setItem('plitka_compare', JSON.stringify(defaults));
		return defaults;
	}

	let compareIds = $state(readCompare());

	let compareItems = $derived(
		compareIds.map((id) => allProducts.find((p) => p.id === id)).filter(Boolean)
	);

	// Products NOT yet in compare (for the add-panel)
	let availableToAdd = $derived(allProducts.filter((p) => !compareIds.includes(p.id)));

	let showAddPanel = $state(false);

	// ── Helpers ────────────────────────────────────────────────────────────────

	function addToCompare(id) {
		if (compareIds.length >= 4) return; // max 4 columns
		compareIds = [...compareIds, id];
		if (browser) localStorage.setItem('plitka_compare', JSON.stringify(compareIds));
		showAddPanel = false;
	}

	function removeFromCompare(id) {
		compareIds = compareIds.filter((cid) => cid !== id);
		if (browser) localStorage.setItem('plitka_compare', JSON.stringify(compareIds));
	}

	function clearAll() {
		compareIds = [];
		if (browser) localStorage.setItem('plitka_compare', JSON.stringify([]));
	}

	function addDefaults() {
		compareIds = ['nero-marquina', 'calacatta-oro', 'urban-craft'];
		if (browser) localStorage.setItem('plitka_compare', JSON.stringify(compareIds));
	}

	// Returns true if all values in a row are identical
	function allSame(key) {
		if (compareItems.length < 2) return false;
		const first = compareItems[0][key];
		return compareItems.every((p) => p[key] === first);
	}

	// Tag color
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

	// Price highlight: lowest gets green, highest gets accent
	function priceClass(item) {
		if (compareItems.length < 2) return 'text-accent-500';
		const prices = compareItems.map((p) => parseInt(p.price.replace(/\s/g, '')));
		const mine = parseInt(item.price.replace(/\s/g, ''));
		const min = Math.min(...prices);
		const max = Math.max(...prices);
		if (mine === min) return 'text-emerald-400';
		if (mine === max) return 'text-rose-400';
		return 'text-accent-500';
	}
</script>

<svelte:head>
	<title>Сравнение коллекций — PLITKA</title>
	<meta
		name="description"
		content="Сравните характеристики плитки PLITKA: размер, материал, поверхность, водопоглощение, морозостойкость и гарантию — всё в одной таблице."
	/>
</svelte:head>

<!-- ===== HERO ===== -->
<section class="relative flex min-h-[46vh] items-center overflow-hidden">
	<div
		class="absolute inset-0 bg-gradient-to-br from-surface-900 via-surface-900 to-surface-800"
	></div>
	<div
		class="pointer-events-none absolute inset-0 opacity-[0.03]"
		style="background-image: linear-gradient(rgba(201,169,110,0.5) 1px, transparent 1px), linear-gradient(90deg, rgba(201,169,110,0.5) 1px, transparent 1px); background-size: 60px 60px;"
	></div>
	<!-- Glow -->
	<div class="absolute top-1/2 left-1/3 -translate-x-1/2 -translate-y-1/2">
		<div class="size-[460px] rounded-full bg-sky-500/6 blur-3xl"></div>
	</div>

	<div class="relative z-10 w-full px-10 pt-40 pb-20 lg:px-24 xl:px-32">
		<div
			class="mb-8 inline-flex items-center gap-2 rounded-full border border-sky-500/20 bg-sky-500/5 px-4 py-1.5"
		>
			<span class="size-2 rounded-full bg-sky-400"></span>
			<span class="text-xs font-semibold tracking-wider text-sky-400 uppercase"
				>Детальный анализ</span
			>
		</div>
		<h1
			class="font-display text-5xl leading-tight font-bold tracking-tight text-white sm:text-6xl lg:text-7xl"
		>
			Сравнение
		</h1>
		<p class="mt-6 max-w-2xl text-lg leading-relaxed text-surface-300">
			Сопоставьте характеристики коллекций и выберите идеальный вариант для вашего проекта. До
			<span class="font-semibold text-white">4 позиций</span> одновременно.
		</p>
	</div>
</section>

<!-- ===== COMPARE TABLE SECTION ===== -->
<section class="relative py-20 lg:py-28">
	<div class="px-10 lg:px-24 xl:px-32">
		<!-- ── Top bar ── -->
		<div class="mb-10 flex flex-col items-start justify-between gap-5 sm:flex-row sm:items-center">
			<div>
				<span class="text-xs font-semibold tracking-[0.3em] text-accent-500 uppercase">
					В сравнении
				</span>
				<h2 class="mt-1 font-display text-2xl font-bold text-white">
					{compareItems.length} из 4 коллекций
				</h2>
			</div>
			<div class="flex flex-wrap items-center gap-3">
				{#if compareItems.length > 0}
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
						Очистить
					</button>
				{/if}
				{#if compareItems.length < 4}
					<button
						onclick={() => (showAddPanel = !showAddPanel)}
						class="flex items-center gap-2 rounded-xl bg-accent-500 px-6 py-2.5 text-sm font-bold tracking-wide text-surface-900 uppercase transition-all duration-300 hover:bg-accent-400 hover:shadow-xl hover:shadow-accent-500/25"
					>
						<svg viewBox="0 0 20 20" class="size-4 fill-current">
							<path
								d="M10.75 4.75a.75.75 0 00-1.5 0v4.5h-4.5a.75.75 0 000 1.5h4.5v4.5a.75.75 0 001.5 0v-4.5h4.5a.75.75 0 000-1.5h-4.5v-4.5z"
							/>
						</svg>
						Добавить коллекцию
					</button>
				{/if}
			</div>
		</div>

		<!-- ── Add panel ── -->
		{#if showAddPanel && availableToAdd.length > 0}
			<div
				class="mb-8 rounded-2xl border border-accent-500/20 bg-surface-800/60 p-6 backdrop-blur-sm"
			>
				<p class="mb-5 text-sm font-semibold tracking-wider text-surface-300 uppercase">
					Выберите коллекцию для добавления
				</p>
				<div class="grid grid-cols-1 gap-3 sm:grid-cols-2 lg:grid-cols-3">
					{#each availableToAdd as p (p.id)}
						<button
							onclick={() => addToCompare(p.id)}
							class="group flex items-center gap-4 rounded-xl border border-surface-600 bg-surface-800/50 p-4 text-left transition-all duration-300 hover:border-accent-500/40 hover:bg-surface-700/60"
						>
							<img src={p.image} alt={p.name} class="size-14 shrink-0 rounded-lg object-cover" />
							<div class="min-w-0">
								<div
									class="truncate text-[11px] font-medium tracking-wider text-surface-300 uppercase"
								>
									{p.brand}
								</div>
								<div class="truncate text-sm font-bold text-white group-hover:text-accent-500">
									{p.name}
								</div>
								<div class="text-xs text-surface-300">{p.price} {p.priceUnit}</div>
							</div>
							<div class="ml-auto shrink-0 text-surface-500 group-hover:text-accent-500">
								<svg viewBox="0 0 20 20" class="size-4 fill-current">
									<path
										d="M10.75 4.75a.75.75 0 00-1.5 0v4.5h-4.5a.75.75 0 000 1.5h4.5v4.5a.75.75 0 001.5 0v-4.5h4.5a.75.75 0 000-1.5h-4.5v-4.5z"
									/>
								</svg>
							</div>
						</button>
					{/each}
				</div>
			</div>
		{/if}

		<!-- ── Empty state ── -->
		{#if compareItems.length === 0}
			<div
				class="flex flex-col items-center justify-center rounded-3xl border border-dashed border-surface-600 py-32 text-center"
			>
				<div
					class="mb-8 flex size-24 items-center justify-center rounded-full border border-surface-600 bg-surface-800/50"
				>
					<svg
						viewBox="0 0 24 24"
						class="size-11 fill-none stroke-surface-500 stroke-1"
						stroke-linecap="round"
						stroke-linejoin="round"
					>
						<rect x="3" y="3" width="7" height="18" rx="1" />
						<rect x="14" y="3" width="7" height="18" rx="1" />
						<path d="M8 7h8M8 12h8M8 17h8" />
					</svg>
				</div>
				<h3 class="font-display text-2xl font-bold text-white">Список пуст</h3>
				<p class="mx-auto mt-4 max-w-sm text-surface-300">
					Добавьте от 2 до 4 коллекций, чтобы сравнить их характеристики.
				</p>
				<div class="mt-8 flex flex-wrap items-center justify-center gap-4">
					<button
						onclick={addDefaults}
						class="inline-flex items-center gap-3 rounded-xl bg-accent-500 px-8 py-4 text-sm font-bold tracking-wide text-surface-900 uppercase transition-all duration-300 hover:bg-accent-400 hover:shadow-2xl hover:shadow-accent-500/30"
					>
						Показать пример
					</button>
					<a
						href="/collections"
						class="inline-flex items-center gap-2 rounded-xl border border-surface-500 px-8 py-4 text-sm font-semibold tracking-wide text-surface-200 transition-all duration-300 hover:border-surface-300 hover:text-white"
					>
						Все коллекции
					</a>
				</div>
			</div>
		{:else}
			<!-- ── Comparison table ── -->
			<div class="overflow-x-auto rounded-2xl border border-surface-700/50">
				<table class="w-full min-w-[640px] border-collapse">
					<!-- Product header row -->
					<thead>
						<tr class="border-b border-surface-700/50 bg-surface-800/80">
							<!-- Label column header -->
							<th class="w-48 py-5 pr-4 pl-6 text-left">
								<span class="text-xs font-semibold tracking-[0.3em] text-surface-400 uppercase"
									>Характеристика</span
								>
							</th>

							{#each compareItems as item (item.id)}
								<th class="min-w-[200px] px-4 py-5 text-left align-top">
									<div class="relative">
										<!-- Remove button -->
										<button
											onclick={() => removeFromCompare(item.id)}
											aria-label="Убрать из сравнения"
											class="absolute -top-1 -right-1 flex size-6 items-center justify-center rounded-full border border-surface-600 bg-surface-700 text-surface-400 transition-all duration-200 hover:border-rose-500/50 hover:bg-rose-500/10 hover:text-rose-400"
										>
											<svg
												viewBox="0 0 12 12"
												class="size-2.5 fill-none stroke-current stroke-2"
												stroke-linecap="round"
											>
												<path d="M2 2l8 8M10 2L2 10" />
											</svg>
										</button>

										<!-- Product image -->
										<div class="mb-4 aspect-[4/3] overflow-hidden rounded-xl">
											<img src={item.image} alt={item.name} class="size-full object-cover" />
										</div>

										<!-- Tag -->
										<span
											class="mb-2 inline-block rounded-md px-2.5 py-1 text-[9px] font-bold tracking-wider text-white uppercase {tagColor(
												item.tag
											)}"
										>
											{item.tag}
										</span>

										<!-- Name & brand -->
										<div class="text-[11px] font-medium tracking-wider text-surface-300 uppercase">
											{item.brand}
										</div>
										<div class="mt-0.5 font-display text-base leading-tight font-bold text-white">
											{item.name}
										</div>

										<!-- Price -->
										<div class="mt-3 font-display text-xl font-bold {priceClass(item)}">
											{item.price}
											<span class="text-sm font-normal text-surface-300">{item.priceUnit}</span>
										</div>

										{#if compareItems.length >= 2}
											{#if parseInt(item.price.replace(/\s/g, '')) === Math.min(...compareItems.map( (p) => parseInt(p.price.replace(/\s/g, '')) ))}
												<div class="mt-1 text-[10px] font-semibold text-emerald-400">
													▼ Лучшая цена
												</div>
											{/if}
										{/if}
									</div>
								</th>
							{/each}

							<!-- Add column placeholder (if < 4) -->
							{#if compareItems.length < 4}
								<th class="min-w-[160px] px-4 py-5 text-left align-middle">
									<button
										onclick={() => (showAddPanel = !showAddPanel)}
										class="flex w-full flex-col items-center justify-center gap-3 rounded-xl border border-dashed border-surface-600 py-10 text-surface-400 transition-all duration-300 hover:border-accent-500/40 hover:text-accent-500"
									>
										<svg
											viewBox="0 0 24 24"
											class="stroke-1.5 size-8 fill-none stroke-current"
											stroke-linecap="round"
											stroke-linejoin="round"
										>
											<circle cx="12" cy="12" r="9" />
											<path d="M12 8v8M8 12h8" />
										</svg>
										<span class="text-center text-xs leading-tight font-medium"
											>Добавить<br />коллекцию</span
										>
									</button>
								</th>
							{/if}
						</tr>
					</thead>

					<!-- Spec rows -->
					<tbody>
						{#each specRows as row, i (row.key)}
							<tr
								class="border-b border-surface-700/30 transition-colors duration-200 {allSame(
									row.key
								)
									? 'bg-surface-800/20'
									: 'bg-surface-900/40'} hover:bg-surface-800/30"
							>
								<!-- Label cell -->
								<td class="py-4 pr-4 pl-6">
									<div class="flex items-center gap-2">
										<span class="text-base leading-none">{row.icon}</span>
										<span class="text-sm font-medium text-surface-300">{row.label}</span>
									</div>
									{#if allSame(row.key) && compareItems.length > 1}
										<div class="mt-1 ml-6 text-[10px] text-surface-500">одинаково</div>
									{/if}
								</td>

								<!-- Value cells -->
								{#each compareItems as item (item.id)}
									<td class="px-4 py-4 align-middle">
										{#if row.type === 'boolean'}
											{#if item[row.key]}
												<span
													class="inline-flex items-center gap-1.5 text-sm font-semibold text-emerald-400"
												>
													<svg viewBox="0 0 12 12" class="size-3.5 fill-emerald-400">
														<path
															d="M10.28 2.28L3.989 8.575 1.695 6.28A.751.751 0 00.633 7.345l2.83 2.83a.75.75 0 001.06 0l6.88-6.83a.751.751 0 00-1.123-1.065z"
														/>
													</svg>
													Да
												</span>
											{:else}
												<span class="inline-flex items-center gap-1.5 text-sm text-surface-500">
													<svg
														viewBox="0 0 12 12"
														class="size-3 fill-none stroke-current stroke-2"
														stroke-linecap="round"
													>
														<path d="M2 2l8 8M10 2L2 10" />
													</svg>
													Нет
												</span>
											{/if}
										{:else}
											<span
												class="text-sm {allSame(row.key)
													? 'text-surface-300'
													: 'font-semibold text-white'}"
											>
												{item[row.key]}
											</span>
										{/if}
									</td>
								{/each}

								<!-- Empty add column spacer -->
								{#if compareItems.length < 4}
									<td class="px-4 py-4"></td>
								{/if}
							</tr>
						{/each}

						<!-- CTA row -->
						<tr class="bg-surface-800/40">
							<td class="py-6 pr-4 pl-6">
								<span class="text-xs font-semibold tracking-[0.3em] text-surface-400 uppercase"
									>Действие</span
								>
							</td>
							{#each compareItems as item (item.id)}
								<td class="px-4 py-6">
									<a
										href="/collections"
										class="inline-flex w-full items-center justify-center gap-2 rounded-xl bg-accent-500 px-4 py-3 text-xs font-bold tracking-wide text-surface-900 uppercase transition-all duration-300 hover:bg-accent-400 hover:shadow-lg hover:shadow-accent-500/25"
									>
										Заказать образец
									</a>
								</td>
							{/each}
							{#if compareItems.length < 4}
								<td class="px-4 py-6"></td>
							{/if}
						</tr>
					</tbody>
				</table>
			</div>

			<!-- Legend -->
			<div class="mt-6 flex flex-wrap items-center gap-6 text-xs text-surface-400">
				<div class="flex items-center gap-2">
					<div class="size-2.5 rounded-full bg-emerald-400"></div>
					<span>Лучший показатель</span>
				</div>
				<div class="flex items-center gap-2">
					<div class="size-2.5 rounded-full bg-rose-400"></div>
					<span>Наибольшая цена</span>
				</div>
				<div class="flex items-center gap-2">
					<div class="size-3 rounded-sm bg-surface-800/40"></div>
					<span>Одинаковые значения</span>
				</div>
			</div>
		{/if}
	</div>
</section>

<!-- ===== CTA SECTION ===== -->
{#if compareItems.length > 0}
	<section class="relative overflow-hidden py-20 lg:py-28">
		<div
			class="absolute inset-0 bg-gradient-to-br from-accent-600/8 via-surface-900 to-surface-900"
		></div>
		<div
			class="pointer-events-none absolute inset-0 opacity-[0.03]"
			style="background-image: linear-gradient(rgba(201,169,110,0.5) 1px, transparent 1px), linear-gradient(90deg, rgba(201,169,110,0.5) 1px, transparent 1px); background-size: 40px 40px;"
		></div>

		<div class="relative px-10 text-center lg:px-24 xl:px-32">
			<span class="text-xs font-semibold tracking-[0.3em] text-accent-500 uppercase">
				Следующий шаг
			</span>
			<h2 class="mt-4 font-display text-3xl font-bold tracking-wide text-white lg:text-4xl">
				Хотите увидеть вживую?
			</h2>
			<p class="mx-auto mt-4 max-w-xl text-surface-300">
				Закажите бесплатную доставку образцов понравившихся коллекций прямо к вам домой или в офис.
			</p>
			<div class="mt-8 flex flex-wrap items-center justify-center gap-4">
				<a
					href="/contacts"
					class="inline-flex items-center gap-3 rounded-xl bg-accent-500 px-8 py-4 text-sm font-bold tracking-wide text-surface-900 uppercase transition-all duration-300 hover:bg-accent-400 hover:shadow-2xl hover:shadow-accent-500/30"
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
				<a
					href="/collections"
					class="inline-flex items-center gap-2 rounded-xl border border-surface-500 px-8 py-4 text-sm font-semibold tracking-wide text-surface-200 transition-all duration-300 hover:border-surface-300 hover:text-white"
				>
					Все коллекции
				</a>
			</div>
		</div>
	</section>
{/if}
