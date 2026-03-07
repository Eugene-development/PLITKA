<script>
	import { page } from '$app/stores';
	import { SvelteSet } from 'svelte/reactivity';

	// ── Mock DB: all collections ──────────────────────────────────────────────
	const allCollections = [
		{
			slug: 'nero-marquina',
			name: 'Nero Marquina',
			brand: 'Kerama Marazzi',
			country: 'Россия',
			countryFlag: '🇷🇺',
			tag: 'Хит продаж',
			description:
				'Коллекция вдохновлена испанским чёрным мрамором Nero Marquina с характерными белыми прожилками. Идеальна для создания эффектных акцентных зон в ванных комнатах и прихожих.',
			interiorImages: [
				'/images/hero-bathroom.png',
				'/images/tile-marble.png',
				'/images/tile-kitchen.png',
				'/images/tile-geometric.png',
				'/images/tile-hexagonal.png'
			],
			items: [
				{
					name: 'Nero Marquina 60×60',
					size: '60×60 см',
					price: 3290,
					image: '/images/hero-bathroom.png'
				},
				{
					name: 'Nero Marquina 30×60',
					size: '30×60 см',
					price: 2890,
					image: '/images/tile-marble.png'
				},
				{
					name: 'Nero Marquina Mosaic',
					size: '30×30 см',
					price: 4100,
					image: '/images/tile-terrazzo.png'
				},
				{
					name: 'Nero Marquina Decor',
					size: '20×60 см',
					price: 5200,
					image: '/images/tile-geometric.png'
				},
				{
					name: 'Nero Marquina Border',
					size: '7×60 см',
					price: 1890,
					image: '/images/tile-hexagonal.png'
				},
				{
					name: 'Nero Marquina Floor',
					size: '60×120 см',
					price: 6800,
					image: '/images/tile-kitchen.png'
				}
			]
		},
		{
			slug: 'calacatta-oro',
			name: 'Calacatta Oro',
			brand: 'Atlas Concorde',
			country: 'Италия',
			countryFlag: '🇮🇹',
			tag: 'Люкс',
			description:
				'Утончённая интерпретация легендарного итальянского мрамора Calacatta с золотистыми прожилками на белоснежном фоне. Для интерьеров высшего класса.',
			interiorImages: [
				'/images/tile-marble.png',
				'/images/hero-bathroom.png',
				'/images/tile-terrazzo.png',
				'/images/tile-kitchen.png',
				'/images/tile-hexagonal.png'
			],
			items: [
				{
					name: 'Calacatta Oro 60×120',
					size: '60×120 см',
					price: 5800,
					image: '/images/tile-marble.png'
				},
				{
					name: 'Calacatta Oro 60×60',
					size: '60×60 см',
					price: 4150,
					image: '/images/hero-bathroom.png'
				},
				{
					name: 'Calacatta Oro Mosaic',
					size: '30×30 см',
					price: 6200,
					image: '/images/tile-terrazzo.png'
				},
				{
					name: 'Calacatta Oro Decor',
					size: '40×80 см',
					price: 7500,
					image: '/images/tile-geometric.png'
				},
				{
					name: 'Calacatta Oro Listello',
					size: '7×60 см',
					price: 2100,
					image: '/images/tile-hexagonal.png'
				},
				{
					name: 'Calacatta Oro Slab',
					size: '120×240 см',
					price: 12900,
					image: '/images/tile-kitchen.png'
				}
			]
		},
		{
			slug: 'urban-craft',
			name: 'Urban Craft',
			brand: 'Italon',
			country: 'Россия / Италия',
			countryFlag: '🇷🇺',
			tag: 'Новинка',
			description:
				'Брутальная городская эстетика. Коллекция с текстурами лофта — бетона, металла и стали. Идеальна для современных пространств.',
			interiorImages: [
				'/images/tile-terrazzo.png',
				'/images/tile-geometric.png',
				'/images/hero-bathroom.png',
				'/images/tile-marble.png',
				'/images/tile-kitchen.png'
			],
			items: [
				{
					name: 'Urban Craft Concrete 60×60',
					size: '60×60 см',
					price: 2490,
					image: '/images/tile-terrazzo.png'
				},
				{
					name: 'Urban Craft Metal 30×60',
					size: '30×60 см',
					price: 1990,
					image: '/images/tile-geometric.png'
				},
				{
					name: 'Urban Craft Decor',
					size: '20×60 см',
					price: 3100,
					image: '/images/hero-bathroom.png'
				},
				{
					name: 'Urban Craft Floor 60×120',
					size: '60×120 см',
					price: 3800,
					image: '/images/tile-marble.png'
				},
				{
					name: 'Urban Craft Border',
					size: '7×60 см',
					price: 990,
					image: '/images/tile-hexagonal.png'
				},
				{
					name: 'Urban Craft Mosaic',
					size: '30×30 см',
					price: 2200,
					image: '/images/tile-kitchen.png'
				}
			]
		}
	];

	// Default fallback for slugs not in mock DB
	function getCollection(slug) {
		const found = allCollections.find((c) => c.slug === slug);
		if (found) return found;
		// Generic fallback
		const name = slug
			.split('-')
			.map((w) => w.charAt(0).toUpperCase() + w.slice(1))
			.join(' ');
		return {
			slug,
			name,
			brand: 'PLITKA',
			country: 'Россия',
			countryFlag: '🇷🇺',
			tag: 'Коллекция',
			description: 'Откройте мир плитки этой замечательной коллекции.',
			interiorImages: [
				'/images/hero-bathroom.png',
				'/images/tile-marble.png',
				'/images/tile-terrazzo.png',
				'/images/tile-geometric.png',
				'/images/tile-hexagonal.png'
			],
			items: [
				{ name: `${name} 60×60`, size: '60×60 см', price: 3200, image: '/images/tile-marble.png' },
				{
					name: `${name} 30×60`,
					size: '30×60 см',
					price: 2600,
					image: '/images/tile-geometric.png'
				},
				{
					name: `${name} Mosaic`,
					size: '30×30 см',
					price: 3900,
					image: '/images/tile-terrazzo.png'
				},
				{
					name: `${name} Decor`,
					size: '20×60 см',
					price: 4400,
					image: '/images/tile-hexagonal.png'
				},
				{ name: `${name} Border`, size: '7×60 см', price: 1500, image: '/images/tile-kitchen.png' },
				{
					name: `${name} Floor`,
					size: '60×120 см',
					price: 5100,
					image: '/images/hero-bathroom.png'
				}
			]
		};
	}

	const slug = $derived($page.params.slug);
	const collection = $derived(getCollection(slug));

	// ── Slider state ──────────────────────────────────────────────────────────
	let currentSlide = $state(0);
	let isHovered = $state(false);

	// Group images into pairs. If odd count — last slide gets first image as second photo.
	function buildSlides(imgs) {
		const pairs = imgs.reduce((acc, img, i) => {
			if (i % 2 === 0) acc.push([img]);
			else acc[acc.length - 1].push(img);
			return acc;
		}, []);
		if (pairs.length > 0 && pairs[pairs.length - 1].length === 1) {
			pairs[pairs.length - 1].push(imgs[0]);
		}
		return pairs;
	}
	const slides = $derived(buildSlides(collection.interiorImages));

	function goTo(index) {
		currentSlide = (index + slides.length) % slides.length;
	}
	function prev() {
		goTo(currentSlide - 1);
	}
	function next() {
		goTo(currentSlide + 1);
	}

	$effect(() => {
		const timer = setInterval(() => {
			if (!isHovered) next();
		}, 4000);
		return () => clearInterval(timer);
	});

	// ── Wishlist / Compare / Cart state ──────────────────────────────────────
	import { browser } from '$app/environment';

	let wishlist = $state(
		new SvelteSet(browser ? JSON.parse(localStorage.getItem('plitka_favorites') || '[]') : [])
	);
	let compareList = $state(
		new SvelteSet(browser ? JSON.parse(localStorage.getItem('plitka_compare') || '[]') : [])
	);
	let cart = $state(
		new SvelteSet(
			browser ? JSON.parse(localStorage.getItem('plitka_cart') || '[]').map((item) => item.id) : []
		)
	);

	function toggleWishlist(name) {
		wishlist.has(name) ? wishlist.delete(name) : wishlist.add(name);
		if (browser) {
			localStorage.setItem('plitka_favorites', JSON.stringify(Array.from(wishlist)));
		}
	}
	function toggleCompare(name) {
		compareList.has(name) ? compareList.delete(name) : compareList.add(name);
		if (browser) {
			localStorage.setItem('plitka_compare', JSON.stringify(Array.from(compareList)));
		}
	}
	function toggleCart(name) {
		if (cart.has(name)) {
			cart.delete(name);
			if (browser) {
				const current = JSON.parse(localStorage.getItem('plitka_cart') || '[]');
				localStorage.setItem('plitka_cart', JSON.stringify(current.filter((c) => c.id !== name)));
			}
		} else {
			cart.add(name);
			if (browser) {
				const current = JSON.parse(localStorage.getItem('plitka_cart') || '[]');
				// Check if already in array just in case
				if (!current.some((c) => c.id === name)) {
					current.push({ id: name, qty: 1 });
					localStorage.setItem('plitka_cart', JSON.stringify(current));
				}
			}
		}
	}

	function formatPrice(p) {
		return p.toLocaleString('ru-RU') + ' ₽/м²';
	}
</script>

<svelte:head>
	<title>{collection.name} — Коллекции — PLITKA</title>
	<meta
		name="description"
		content="Коллекция {collection.name} от {collection.brand}. Узнайте размеры, цены и закажите плитку в PLITKA."
	/>
</svelte:head>

<!-- ===== BREADCRUMB + HERO ===== -->
<section
	class="relative overflow-hidden bg-gradient-to-br from-surface-900 via-surface-900 to-surface-800"
>
	<!-- Grid pattern -->
	<div
		class="pointer-events-none absolute inset-0 opacity-[0.03]"
		style="background-image: linear-gradient(rgba(201,169,110,0.5) 1px, transparent 1px), linear-gradient(90deg, rgba(201,169,110,0.5) 1px, transparent 1px); background-size: 60px 60px;"
	></div>
	<div class="absolute top-1/2 right-1/4 -translate-y-1/2">
		<div class="size-[400px] rounded-full bg-accent-500/5 blur-3xl"></div>
	</div>

	<div class="relative z-10 px-10 pt-24 pb-8 lg:px-24 xl:px-32">
		<!-- Breadcrumb (temporarily hidden) -->
		<!-- <nav class="mb-8 flex items-center gap-2 text-xs text-surface-400">
			<a href="/" class="transition-colors hover:text-accent-500">Главная</a>
			<span>/</span>
			<a href="/collections" class="transition-colors hover:text-accent-500">Коллекции</a>
			<span>/</span>
			<span class="text-surface-200">{collection.name}</span>
		</nav> -->

		<div class="flex flex-col gap-6 lg:flex-row lg:items-end lg:justify-between">
			<div>
				<!-- Tag + brand -->
				<div class="mb-4 flex flex-wrap items-center gap-3">
					<span
						class="rounded-lg bg-accent-500/15 px-3 py-1 text-[11px] font-bold tracking-wider text-accent-500 uppercase"
					>
						{collection.tag}
					</span>
					<span class="flex items-center gap-1.5 text-sm text-surface-400">
						<span>{collection.countryFlag}</span>
						<span>{collection.brand} · {collection.country}</span>
					</span>
				</div>
				<h1
					class="font-display text-4xl font-bold tracking-tight text-white lg:text-5xl xl:text-6xl"
				>
					{collection.name}
				</h1>
				<p class="mt-4 max-w-2xl text-base leading-relaxed text-surface-300">
					{collection.description}
				</p>
			</div>

			<!-- Quick actions -->
			<div class="flex shrink-0 gap-3">
				<a
					href="/contacts"
					class="inline-flex items-center gap-2 rounded-xl bg-accent-500 px-6 py-3 text-sm font-bold text-surface-900 transition-all hover:bg-accent-400 hover:shadow-xl hover:shadow-accent-500/30"
				>
					Заказать
				</a>
				<a
					href="/collections"
					class="inline-flex items-center gap-2 rounded-xl border border-surface-600 px-6 py-3 text-sm font-semibold text-surface-300 transition-all hover:border-surface-400 hover:text-white"
				>
					← Назад
				</a>
			</div>
		</div>
	</div>
</section>

<!-- ===== INTERIOR SLIDER ===== -->
<section class="relative bg-surface-900 pt-10 pb-6">
	<div class="px-10 lg:px-24 xl:px-32">
		<!-- Section label -->
		<div class="mb-6 flex items-center justify-between">
			<div>
				<span class="text-xs font-semibold tracking-[0.3em] text-accent-500 uppercase"
					>Интерьеры</span
				>
				<h2 class="mt-1 text-xl font-bold text-white">Коллекция в интерьере</h2>
			</div>
			<!-- Slide counter -->
			<span class="text-sm text-surface-400">
				{currentSlide + 1} / {slides.length}
			</span>
		</div>

		<!-- Slider wrapper -->
		<div
			class="relative overflow-hidden rounded-2xl"
			onmouseenter={() => (isHovered = true)}
			onmouseleave={() => (isHovered = false)}
			role="region"
			aria-label="Слайдер интерьеров"
		>
			<!-- Slides: 2 images per slide -->
			<div class="relative aspect-[8/3] w-full">
				{#each slides as pair, i (i)}
					<div
						class="absolute inset-0 grid gap-2 transition-opacity duration-700 {i === currentSlide
							? 'opacity-100'
							: 'opacity-0'} {pair.length === 2 ? 'grid-cols-2' : 'grid-cols-1'}"
					>
						{#each pair as img (img)}
							<div class="relative overflow-hidden rounded-xl">
								<img
									src={img}
									alt="Интерьер с коллекцией {collection.name}"
									class="size-full object-cover"
								/>
								<div
									class="absolute inset-0 bg-gradient-to-t from-surface-900/30 to-transparent"
								></div>
							</div>
						{/each}
					</div>
				{/each}
			</div>

			<!-- Prev / Next buttons -->
			<button
				onclick={prev}
				class="absolute top-1/2 left-4 z-10 flex size-11 -translate-y-1/2 items-center justify-center rounded-full border border-white/20 bg-surface-900/60 text-white backdrop-blur-sm transition-all hover:border-accent-500/60 hover:bg-surface-900/80 hover:text-accent-500"
				aria-label="Предыдущий слайд"
			>
				<svg viewBox="0 0 20 20" class="size-4 fill-current">
					<path
						fill-rule="evenodd"
						d="M12.79 5.23a.75.75 0 01-.02 1.06L8.832 10l3.938 3.71a.75.75 0 11-1.04 1.08l-4.5-4.25a.75.75 0 010-1.08l4.5-4.25a.75.75 0 011.06.02z"
						clip-rule="evenodd"
					/>
				</svg>
			</button>
			<button
				onclick={next}
				class="absolute top-1/2 right-4 z-10 flex size-11 -translate-y-1/2 items-center justify-center rounded-full border border-white/20 bg-surface-900/60 text-white backdrop-blur-sm transition-all hover:border-accent-500/60 hover:bg-surface-900/80 hover:text-accent-500"
				aria-label="Следующий слайд"
			>
				<svg viewBox="0 0 20 20" class="size-4 fill-current">
					<path
						fill-rule="evenodd"
						d="M7.21 14.77a.75.75 0 01.02-1.06L11.168 10 7.23 6.29a.75.75 0 111.04-1.08l4.5 4.25a.75.75 0 010 1.08l-4.5 4.25a.75.75 0 01-1.06-.02z"
						clip-rule="evenodd"
					/>
				</svg>
			</button>
		</div>
	</div>
</section>

<!-- ===== PRODUCT CARDS ===== -->
<section class="relative py-16 lg:py-24">
	<div class="px-10 lg:px-24 xl:px-32">
		<!-- Section header -->
		<div class="mb-10 flex flex-col gap-4 sm:flex-row sm:items-end sm:justify-between">
			<div>
				<span class="text-xs font-semibold tracking-[0.3em] text-accent-500 uppercase"
					>Элементы</span
				>
				<h2 class="mt-1 text-2xl font-bold text-white">
					Плитка в коллекции
					<span class="ml-2 text-lg font-normal text-surface-400"
						>({collection.items.length} позиций)</span
					>
				</h2>
			</div>
			<!-- Cart counter -->
			{#if cart.size > 0}
				<div
					class="flex items-center gap-2 rounded-xl border border-accent-500/30 bg-accent-500/10 px-4 py-2 text-sm text-accent-500"
				>
					<svg viewBox="0 0 20 20" class="size-4 fill-current">
						<path
							d="M1 1.75A.75.75 0 011.75 1h1.628a1.75 1.75 0 011.734 1.51L5.18 3a65.25 65.25 0 0113.36 1.412.75.75 0 01.58.875 48.645 48.645 0 01-1.618 6.2.75.75 0 01-.712.513H6a2.503 2.503 0 00-2.292 1.5H17.25a.75.75 0 010 1.5H2.76a.75.75 0 01-.748-.807 4.002 4.002 0 012.716-3.486L3.626 2.716a.25.25 0 00-.248-.216H1.75A.75.75 0 011 1.75zM6 17.5a1.5 1.5 0 110 3 1.5 1.5 0 010-3zm10.5 0a1.5 1.5 0 110 3 1.5 1.5 0 010-3z"
						/>
					</svg>
					В корзине: {cart.size}
				</div>
			{/if}
		</div>

		<!-- Grid -->
		<div class="grid grid-cols-1 gap-6 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4">
			{#each collection.items as item (item.name)}
				<div
					class="group relative flex flex-col overflow-hidden rounded-2xl border border-surface-700/50 bg-surface-800/40 transition-all duration-500 hover:border-accent-500/20 hover:shadow-2xl hover:shadow-accent-500/5"
				>
					<!-- Image -->
					<div class="relative aspect-[4/3] overflow-hidden bg-surface-800">
						<img
							src={item.image}
							alt={item.name}
							class="size-full object-cover transition-transform duration-700 group-hover:scale-105"
						/>
						<div
							class="absolute inset-0 bg-gradient-to-t from-surface-900/60 via-transparent to-transparent opacity-0 transition-opacity duration-500 group-hover:opacity-100"
						></div>

						<!-- Quick action overlay buttons -->
						<div
							class="absolute top-3 right-3 flex translate-x-2 flex-col gap-2 opacity-0 transition-all duration-300 group-hover:translate-x-0 group-hover:opacity-100"
						>
							<!-- Wishlist -->
							<button
								onclick={() => toggleWishlist(item.name)}
								class="flex size-8 items-center justify-center rounded-lg border transition-all duration-200 {wishlist.has(
									item.name
								)
									? 'border-rose-500/60 bg-rose-500/20 text-rose-400'
									: 'border-surface-600/70 bg-surface-800/70 text-surface-400 hover:border-rose-500/40 hover:text-rose-400'}"
								aria-label="В избранное"
								title="В избранное"
							>
								<svg
									viewBox="0 0 20 20"
									class="size-4 {wishlist.has(item.name)
										? 'fill-current'
										: 'fill-none stroke-current stroke-[1.5]'}"
								>
									<path
										d="M9.653 16.915l-.005-.003-.019-.01a20.759 20.759 0 01-1.162-.682 22.045 22.045 0 01-2.582-2.032C4.045 12.637 2 10.43 2 7.5a4.5 4.5 0 018-2.878A4.5 4.5 0 0118 7.5c0 2.93-2.045 5.137-3.885 6.688a22.08 22.08 0 01-2.582 2.032l-.019.01-.005.003h-.002a.739.739 0 01-.69.001l-.002-.001z"
									/>
								</svg>
							</button>
							<!-- Compare -->
							<button
								onclick={() => toggleCompare(item.name)}
								class="flex size-8 items-center justify-center rounded-lg border transition-all duration-200 {compareList.has(
									item.name
								)
									? 'border-sky-500/60 bg-sky-500/20 text-sky-400'
									: 'border-surface-600/70 bg-surface-800/70 text-surface-400 hover:border-sky-500/40 hover:text-sky-400'}"
								aria-label="Сравнить"
								title="Сравнить"
							>
								<svg viewBox="0 0 20 20" class="size-4 fill-current">
									<path
										fill-rule="evenodd"
										d="M6 2a1 1 0 00-1 1v1H4a2 2 0 00-2 2v10a2 2 0 002 2h12a2 2 0 002-2V6a2 2 0 00-2-2h-1V3a1 1 0 10-2 0v1H7V3a1 1 0 00-1-1zm0 5a1 1 0 000 2h8a1 1 0 100-2H6z"
										clip-rule="evenodd"
									/>
								</svg>
							</button>
						</div>
					</div>

					<!-- Content -->
					<div class="flex flex-1 flex-col p-4">
						<h3
							class="text-sm leading-snug font-semibold text-white transition-colors group-hover:text-accent-400"
						>
							{item.name}
						</h3>
						<div class="mt-1.5 flex items-center gap-1.5">
							<svg viewBox="0 0 16 16" class="size-3 shrink-0 fill-surface-500">
								<path d="M3 3h10v10H3V3zm1 1v8h8V4H4z" />
							</svg>
							<span class="text-xs text-surface-400">{item.size}</span>
						</div>

						<!-- Price -->
						<div class="mt-3">
							<span class="font-display text-lg font-bold text-accent-500">
								{formatPrice(item.price)}
							</span>
						</div>

						<!-- Action buttons -->
						<div class="mt-4 flex gap-2">
							<!-- Add to cart -->
							<button
								onclick={() => toggleCart(item.name)}
								class="flex flex-1 items-center justify-center gap-1.5 rounded-xl px-3 py-2.5 text-xs font-semibold transition-all duration-300 {cart.has(
									item.name
								)
									? 'bg-accent-500 text-surface-900 hover:bg-accent-400'
									: 'border border-surface-600 bg-surface-700/50 text-surface-200 hover:border-accent-500/40 hover:text-accent-500'}"
							>
								{#if cart.has(item.name)}
									<svg viewBox="0 0 20 20" class="size-3.5 fill-current">
										<path
											fill-rule="evenodd"
											d="M16.704 4.153a.75.75 0 01.143 1.052l-8 10.5a.75.75 0 01-1.127.075l-4.5-4.5a.75.75 0 011.06-1.06l3.894 3.893 7.48-9.817a.75.75 0 011.05-.143z"
											clip-rule="evenodd"
										/>
									</svg>
									В корзине
								{:else}
									<svg viewBox="0 0 20 20" class="size-3.5 fill-current">
										<path
											d="M1 1.75A.75.75 0 011.75 1h1.628a1.75 1.75 0 011.734 1.51L5.18 3a65.25 65.25 0 0113.36 1.412.75.75 0 01.58.875 48.645 48.645 0 01-1.618 6.2.75.75 0 01-.712.513H6a2.503 2.503 0 00-2.292 1.5H17.25a.75.75 0 010 1.5H2.76a.75.75 0 01-.748-.807 4.002 4.002 0 012.716-3.486L3.626 2.716a.25.25 0 00-.248-.216H1.75A.75.75 0 011 1.75zM6 17.5a1.5 1.5 0 110 3 1.5 1.5 0 010-3zm10.5 0a1.5 1.5 0 110 3 1.5 1.5 0 010-3z"
										/>
									</svg>
									В корзину
								{/if}
							</button>

							<!-- Wishlist (bottom) -->
							<button
								onclick={() => toggleWishlist(item.name)}
								class="flex size-10 shrink-0 items-center justify-center rounded-xl border transition-all duration-200 {wishlist.has(
									item.name
								)
									? 'border-rose-500/50 bg-rose-500/15 text-rose-400'
									: 'border-surface-600 bg-surface-700/30 text-surface-400 hover:border-rose-500/40 hover:text-rose-400'}"
								aria-label="В избранное"
							>
								<svg
									viewBox="0 0 20 20"
									class="size-4 {wishlist.has(item.name)
										? 'fill-current'
										: 'fill-none stroke-current stroke-[1.5]'}"
								>
									<path
										d="M9.653 16.915l-.005-.003-.019-.01a20.759 20.759 0 01-1.162-.682 22.045 22.045 0 01-2.582-2.032C4.045 12.637 2 10.43 2 7.5a4.5 4.5 0 018-2.878A4.5 4.5 0 0118 7.5c0 2.93-2.045 5.137-3.885 6.688a22.08 22.08 0 01-2.582 2.032l-.019.01-.005.003h-.002a.739.739 0 01-.69.001l-.002-.001z"
									/>
								</svg>
							</button>

							<!-- Compare (bottom) -->
							<button
								onclick={() => toggleCompare(item.name)}
								class="flex size-10 shrink-0 items-center justify-center rounded-xl border transition-all duration-200 {compareList.has(
									item.name
								)
									? 'border-sky-500/50 bg-sky-500/15 text-sky-400'
									: 'border-surface-600 bg-surface-700/30 text-surface-400 hover:border-sky-500/40 hover:text-sky-400'}"
								aria-label="Сравнить"
							>
								<svg viewBox="0 0 16 16" class="size-4 fill-current">
									<path
										d="M1 3.5A1.5 1.5 0 012.5 2h11A1.5 1.5 0 0115 3.5v9A1.5 1.5 0 0113.5 14h-11A1.5 1.5 0 011 12.5v-9zm8.5 1a.5.5 0 00-1 0V6H7V4.5a.5.5 0 00-1 0v7a.5.5 0 001 0V10h1.5v1.5a.5.5 0 001 0v-7zM3 9.5h2.5V10H3v-.5zm0-1h2.5V9H3v-.5zm0-1h2.5V8H3v-.5zm7.5 0H13V8h-2.5v-.5zm0 1H13V9h-2.5v-.5zm0 1H13V10h-2.5v-.5z"
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
