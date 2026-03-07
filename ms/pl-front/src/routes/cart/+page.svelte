<script>
	import { browser } from '$app/environment';

	// Demo products catalog
	const allProducts = [
		{
			id: 'nero-marquina',
			name: 'Nero Marquina',
			brand: 'Kerama Marazzi',
			priceRaw: 2890,
			price: '2 890',
			priceUnit: '₽/м²',
			image: '/images/hero-bathroom.png',
			tag: 'Хит продаж',
			category: 'Настенная плитка',
			size: '30×60 см',
			inStock: true
		},
		{
			id: 'calacatta-oro',
			name: 'Calacatta Oro',
			brand: 'Atlas Concorde',
			priceRaw: 4150,
			price: '4 150',
			priceUnit: '₽/м²',
			image: '/images/tile-marble.png',
			tag: 'Люкс',
			category: 'Керамогранит',
			size: '60×120 см',
			inStock: true
		},
		{
			id: 'urban-craft',
			name: 'Urban Craft',
			brand: 'Italon',
			priceRaw: 1990,
			price: '1 990',
			priceUnit: '₽/м²',
			image: '/images/tile-terrazzo.png',
			tag: 'Новинка',
			category: 'Напольная плитка',
			size: '45×45 см',
			inStock: true
		},
		{
			id: 'royal-deco',
			name: 'Royal Deco',
			brand: 'Laparet',
			priceRaw: 3490,
			price: '3 490',
			priceUnit: '₽/м²',
			image: '/images/tile-geometric.png',
			tag: 'Эксклюзив',
			category: 'Декоры',
			size: '25×75 см',
			inStock: false
		},
		{
			id: 'emerald-kitchen',
			name: 'Emerald Kitchen',
			brand: 'Cersanit',
			priceRaw: 1690,
			price: '1 690',
			priceUnit: '₽/м²',
			image: '/images/tile-kitchen.png',
			tag: 'Популярное',
			category: 'Настенная плитка',
			size: '20×60 см',
			inStock: true
		},
		{
			id: 'hex-terracotta',
			name: 'Hex Terracotta',
			brand: 'Estima',
			priceRaw: 2340,
			price: '2 340',
			priceUnit: '₽/м²',
			image: '/images/tile-hexagonal.png',
			tag: 'Тренд',
			category: 'Мозаика',
			size: '9×10 см',
			inStock: true
		}
	];

	// ── Cart state ──────────────────────────────────────────────────────────────

	/** @type {{ id: string, qty: number }[]} */
	function readCart() {
		if (!browser) return [];
		const raw = localStorage.getItem('plitka_cart');
		if (raw) return JSON.parse(raw);
		// Seed with demo items on first visit
		const defaults = [
			{ id: 'nero-marquina', qty: 3 },
			{ id: 'calacatta-oro', qty: 2 },
			{ id: 'hex-terracotta', qty: 5 }
		];
		localStorage.setItem('plitka_cart', JSON.stringify(defaults));
		return defaults;
	}

	function saveCart(items) {
		if (browser) localStorage.setItem('plitka_cart', JSON.stringify(items));
	}

	let cartEntries = $state(readCart());

	// Enriched cart items with product data
	let cartItems = $derived(
		cartEntries
			.map((entry) => {
				const product = allProducts.find((p) => p.id === entry.id);
				if (!product) return null;
				return { ...product, qty: entry.qty, total: product.priceRaw * entry.qty };
			})
			.filter(Boolean)
	);

	// Order summary
	let subtotal = $derived(cartItems.reduce((sum, item) => sum + item.total, 0));
	let delivery = $derived(subtotal >= 10000 ? 0 : 990);
	let totalPrice = $derived(subtotal + delivery);

	// ── Helpers ─────────────────────────────────────────────────────────────────

	function setQty(id, qty) {
		if (qty < 1) {
			removeItem(id);
			return;
		}
		cartEntries = cartEntries.map((e) => (e.id === id ? { ...e, qty } : e));
		saveCart(cartEntries);
	}

	function removeItem(id) {
		cartEntries = cartEntries.filter((e) => e.id !== id);
		saveCart(cartEntries);
	}

	function clearCart() {
		cartEntries = [];
		saveCart([]);
	}

	function addDemoItems() {
		cartEntries = [
			{ id: 'nero-marquina', qty: 3 },
			{ id: 'calacatta-oro', qty: 2 },
			{ id: 'hex-terracotta', qty: 5 }
		];
		saveCart(cartEntries);
	}

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

	function formatPrice(val) {
		return val.toLocaleString('ru-RU');
	}

	// Order placed state
	let orderPlaced = $state(false);

	function placeOrder() {
		orderPlaced = true;
		clearCart();
	}
</script>

<svelte:head>
	<title>Корзина — PLITKA</title>
	<meta
		name="description"
		content="Ваша корзина PLITKA. Добавляйте понравившуюся плитку и оформляйте заказ в несколько кликов."
	/>
</svelte:head>

<!-- ===== HERO ===== -->
<section class="relative flex min-h-[46vh] items-center overflow-hidden">
	<div
		class="absolute inset-0 bg-gradient-to-br from-surface-900 via-surface-900 to-surface-800"
	></div>
	<!-- Grid pattern -->
	<div
		class="pointer-events-none absolute inset-0 opacity-[0.03]"
		style="background-image: linear-gradient(rgba(201,169,110,0.5) 1px, transparent 1px), linear-gradient(90deg, rgba(201,169,110,0.5) 1px, transparent 1px); background-size: 60px 60px;"
	></div>
	<!-- Glow -->
	<div class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2">
		<div class="size-[480px] rounded-full bg-accent-500/6 blur-3xl"></div>
	</div>

	<div class="relative z-10 w-full px-10 pt-40 pb-20 lg:px-24 xl:px-32">
		<div
			class="mb-8 inline-flex items-center gap-2 rounded-full border border-accent-500/20 bg-accent-500/5 px-4 py-1.5"
		>
			<span class="size-2 rounded-full bg-accent-500"></span>
			<span class="text-xs font-semibold tracking-wider text-accent-400 uppercase">Ваш заказ</span>
		</div>
		<h1
			class="font-display text-5xl leading-tight font-bold tracking-tight text-white sm:text-6xl lg:text-7xl"
		>
			Корзина
		</h1>
		<p class="mt-6 max-w-2xl text-lg leading-relaxed text-surface-300">
			Выбранные позиции, итоговая стоимость и оформление заказа —
			<span class="font-semibold text-white">всё в одном месте</span>.
		</p>
	</div>
</section>

<!-- ===== CART SECTION ===== -->
<section class="relative py-20 lg:py-28">
	<div class="px-10 lg:px-24 xl:px-32">
		{#if orderPlaced}
			<!-- ── Order success state ── -->
			<div
				class="flex flex-col items-center justify-center rounded-3xl border border-emerald-500/20 bg-emerald-500/5 py-32 text-center"
			>
				<div
					class="mb-8 flex size-24 items-center justify-center rounded-full border border-emerald-500/30 bg-emerald-500/10"
				>
					<svg
						viewBox="0 0 24 24"
						class="size-11 fill-none stroke-emerald-400 stroke-2"
						stroke-linecap="round"
						stroke-linejoin="round"
					>
						<path d="M9 12l2 2 4-4" />
						<circle cx="12" cy="12" r="9" />
					</svg>
				</div>
				<h2 class="font-display text-3xl font-bold text-white">Заказ оформлен!</h2>
				<p class="mx-auto mt-4 max-w-sm text-surface-300">
					Наш менеджер свяжется с вами в течение 30 минут для подтверждения деталей.
				</p>
				<div class="mt-8 flex flex-wrap items-center justify-center gap-4">
					<a
						href="/collections"
						class="inline-flex items-center gap-3 rounded-xl bg-accent-500 px-8 py-4 text-sm font-bold tracking-wide text-surface-900 uppercase transition-all duration-300 hover:bg-accent-400 hover:shadow-2xl hover:shadow-accent-500/30"
					>
						Продолжить покупки
					</a>
					<a
						href="/contacts"
						class="inline-flex items-center gap-2 rounded-xl border border-surface-500 px-8 py-4 text-sm font-semibold tracking-wide text-surface-200 transition-all duration-300 hover:border-surface-300 hover:text-white"
					>
						Связаться с нами
					</a>
				</div>
			</div>
		{:else if cartItems.length === 0}
			<!-- ── Empty state ── -->
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
						<path d="M6 2L3 6v14a2 2 0 002 2h14a2 2 0 002-2V6l-3-4z" />
						<line x1="3" y1="6" x2="21" y2="6" />
						<path d="M16 10a4 4 0 01-8 0" />
					</svg>
				</div>
				<h3 class="font-display text-2xl font-bold text-white">Корзина пуста</h3>
				<p class="mx-auto mt-4 max-w-sm text-surface-300">
					Добавьте понравившиеся коллекции плитки, чтобы оформить заказ или рассчитать стоимость.
				</p>
				<div class="mt-8 flex flex-wrap items-center justify-center gap-4">
					<a
						href="/collections"
						class="inline-flex items-center gap-3 rounded-xl bg-accent-500 px-8 py-4 text-sm font-bold tracking-wide text-surface-900 uppercase transition-all duration-300 hover:bg-accent-400 hover:shadow-2xl hover:shadow-accent-500/30"
					>
						Смотреть коллекции
					</a>
					<button
						onclick={addDemoItems}
						class="inline-flex items-center gap-2 rounded-xl border border-surface-500 px-8 py-4 text-sm font-semibold tracking-wide text-surface-200 transition-all duration-300 hover:border-surface-300 hover:text-white"
					>
						Показать пример
					</button>
				</div>
			</div>
		{:else}
			<!-- ── Cart content ── -->
			<div class="flex flex-col gap-12 xl:flex-row xl:items-start">
				<!-- Left: items list -->
				<div class="min-w-0 flex-1">
					<!-- Header row -->
					<div
						class="mb-8 flex flex-col items-start justify-between gap-5 sm:flex-row sm:items-center"
					>
						<div>
							<span class="text-xs font-semibold tracking-[0.3em] text-accent-500 uppercase">
								Позиций в корзине
							</span>
							<h2 class="mt-1 font-display text-2xl font-bold text-white">
								{cartItems.length}
								{#if cartItems.length === 1}позиция{:else if cartItems.length >= 2 && cartItems.length <= 4}позиции{:else}позиций{/if}
							</h2>
						</div>
						<button
							onclick={clearCart}
							class="flex items-center gap-2 rounded-xl border border-surface-600 bg-surface-800/50 px-5 py-2.5 text-sm font-medium text-surface-300 transition-all duration-300 hover:border-rose-500/40 hover:text-rose-400"
						>
							<svg viewBox="0 0 16 16" class="size-3.5 fill-current">
								<path
									fill-rule="evenodd"
									d="M5 3.25V4H2.75a.75.75 0 000 1.5h.3l.815 8.15A1.5 1.5 0 005.357 15h5.285a1.5 1.5 0 001.493-1.35l.815-8.15h.3a.75.75 0 000-1.5H11v-.75A2.25 2.25 0 008.75 1h-1.5A2.25 2.25 0 005 3.25zm2.25-.75a.75.75 0 00-.75.75V4h3v-.75a.75.75 0 00-.75-.75h-1.5zM6.05 6a.75.75 0 01.787.713l.275 5.5a.75.75 0 01-1.498.075l-.275-5.5A.75.75 0 016.05 6zm3.9 0a.75.75 0 01.712.787l-.275 5.5a.75.75 0 01-1.498-.075l.275-5.5A.75.75 0 019.95 6z"
									clip-rule="evenodd"
								/>
							</svg>
							Очистить корзину
						</button>
					</div>

					<!-- Items -->
					<div class="flex flex-col gap-4">
						{#each cartItems as item (item.id)}
							<div
								class="group relative overflow-hidden rounded-2xl border border-surface-700/50 bg-surface-800/80 p-5 transition-all duration-300 hover:border-accent-500/20 hover:shadow-xl hover:shadow-accent-500/5 sm:p-6"
							>
								<div class="flex items-start gap-5">
									<!-- Image -->
									<div class="relative shrink-0">
										<div class="size-24 overflow-hidden rounded-xl sm:size-28">
											<img
												src={item.image}
												alt={item.name}
												class="size-full object-cover transition-transform duration-500 group-hover:scale-105"
											/>
										</div>
										<!-- Tag -->
										<span
											class="absolute -top-2 -left-2 rounded-md px-2 py-0.5 text-[9px] font-bold tracking-wider text-white uppercase shadow-lg {tagColor(
												item.tag
											)}"
										>
											{item.tag}
										</span>
									</div>

									<!-- Info -->
									<div class="flex min-w-0 flex-1 flex-col gap-4">
										<div class="flex items-start justify-between gap-3">
											<div class="min-w-0">
												<div
													class="text-[11px] font-medium tracking-wider text-surface-300 uppercase"
												>
													{item.brand}
												</div>
												<h3
													class="mt-0.5 truncate text-lg font-bold text-white transition-colors group-hover:text-accent-500"
												>
													{item.name}
												</h3>
												<div class="mt-1 flex flex-wrap gap-2">
													<span
														class="inline-block rounded-md border border-surface-600 bg-surface-700/50 px-2 py-0.5 text-[10px] font-medium text-surface-300"
													>
														{item.category}
													</span>
													<span
														class="inline-block rounded-md border border-surface-600 bg-surface-700/50 px-2 py-0.5 text-[10px] font-medium text-surface-300"
													>
														{item.size}
													</span>
													{#if item.inStock}
														<span
															class="inline-flex items-center gap-1 text-[10px] font-medium text-emerald-400"
														>
															<span class="size-1.5 rounded-full bg-emerald-400"></span>
															В наличии
														</span>
													{:else}
														<span
															class="inline-flex items-center gap-1 text-[10px] font-medium text-orange-400"
														>
															<span class="size-1.5 rounded-full bg-orange-400"></span>
															Под заказ
														</span>
													{/if}
												</div>
											</div>
											<!-- Remove button -->
											<button
												onclick={() => removeItem(item.id)}
												aria-label="Удалить из корзины"
												class="flex size-8 shrink-0 items-center justify-center rounded-lg border border-surface-600 bg-surface-700 text-surface-400 transition-all duration-200 hover:border-rose-500/50 hover:bg-rose-500/10 hover:text-rose-400"
											>
												<svg
													viewBox="0 0 12 12"
													class="size-3 fill-none stroke-current stroke-2"
													stroke-linecap="round"
												>
													<path d="M2 2l8 8M10 2L2 10" />
												</svg>
											</button>
										</div>

										<!-- Price & Qty row -->
										<div class="flex flex-wrap items-center justify-between gap-4">
											<!-- Qty control -->
											<div
												class="flex items-center gap-0 overflow-hidden rounded-xl border border-surface-600 bg-surface-700/40"
											>
												<button
													onclick={() => setQty(item.id, item.qty - 1)}
													aria-label="Уменьшить количество"
													class="flex size-9 items-center justify-center text-surface-300 transition-colors hover:bg-surface-700 hover:text-white"
												>
													<svg
														viewBox="0 0 24 24"
														class="size-4 fill-none stroke-current stroke-2"
														stroke-linecap="round"
													>
														<path d="M5 12h14" />
													</svg>
												</button>
												<span class="w-10 text-center text-sm font-bold text-white"
													>{item.qty} м²</span
												>
												<button
													onclick={() => setQty(item.id, item.qty + 1)}
													aria-label="Увеличить количество"
													class="flex size-9 items-center justify-center text-surface-300 transition-colors hover:bg-surface-700 hover:text-white"
												>
													<svg
														viewBox="0 0 24 24"
														class="size-4 fill-none stroke-current stroke-2"
														stroke-linecap="round"
													>
														<path d="M12 5v14M5 12h14" />
													</svg>
												</button>
											</div>

											<!-- Price -->
											<div class="text-right">
												<div class="text-xs text-surface-400">
													{item.price}
													{item.priceUnit} × {item.qty} м²
												</div>
												<div class="font-display text-xl font-bold text-accent-500">
													{formatPrice(item.total)} ₽
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						{/each}
					</div>
				</div>

				<!-- Right: Order summary -->
				<div class="shrink-0 xl:sticky xl:top-28 xl:w-96">
					<div
						class="overflow-hidden rounded-3xl border border-surface-700/50 bg-surface-800/80 backdrop-blur-sm"
					>
						<!-- Summary header -->
						<div class="border-b border-surface-700/50 px-7 py-6">
							<span class="text-xs font-semibold tracking-[0.3em] text-accent-500 uppercase">
								Итого
							</span>
							<h3 class="mt-1 font-display text-xl font-bold text-white">Сводка заказа</h3>
						</div>

						<!-- Summary rows -->
						<div class="space-y-4 px-7 py-6">
							<div class="flex items-center justify-between text-sm">
								<span class="text-surface-300">
									Товары ({cartItems.length}
									{#if cartItems.length === 1}позиция{:else if cartItems.length >= 2 && cartItems.length <= 4}позиции{:else}позиций{/if})
								</span>
								<span class="font-medium text-white">{formatPrice(subtotal)} ₽</span>
							</div>

							<div class="flex items-center justify-between text-sm">
								<span class="text-surface-300">Доставка</span>
								{#if delivery === 0}
									<span class="font-medium text-emerald-400">Бесплатно</span>
								{:else}
									<span class="font-medium text-white">{formatPrice(delivery)} ₽</span>
								{/if}
							</div>

							{#if delivery > 0}
								<p class="text-[11px] leading-relaxed text-surface-400">
									Бесплатная доставка от {formatPrice(10000)} ₽. До порога ещё {formatPrice(
										10000 - subtotal
									)} ₽.
								</p>
							{/if}

							<div class="h-px bg-surface-700/50"></div>

							<div class="flex items-center justify-between">
								<span class="font-semibold text-white">К оплате</span>
								<span class="font-display text-2xl font-bold text-accent-500">
									{formatPrice(totalPrice)} ₽
								</span>
							</div>
						</div>

						<!-- Checkout button -->
						<div class="space-y-3 px-7 pb-7">
							<button
								onclick={placeOrder}
								class="flex w-full items-center justify-center gap-3 rounded-xl bg-accent-500 py-4 text-sm font-bold tracking-wide text-surface-900 uppercase transition-all duration-300 hover:bg-accent-400 hover:shadow-2xl hover:shadow-accent-500/30 active:scale-[0.98]"
							>
								<svg
									viewBox="0 0 24 24"
									class="size-4 fill-none stroke-current stroke-2"
									stroke-linecap="round"
									stroke-linejoin="round"
								>
									<path d="M20 12V22H4V12" />
									<path d="M22 7H2v5h20V7z" />
									<path d="M12 22V7" />
									<path d="M12 7H7.5a2.5 2.5 0 010-5C11 2 12 7 12 7z" />
									<path d="M12 7h4.5a2.5 2.5 0 000-5C13 2 12 7 12 7z" />
								</svg>
								Оформить заказ
							</button>
							<a
								href="/collections"
								class="flex w-full items-center justify-center gap-2 rounded-xl border border-surface-600 py-3.5 text-sm font-medium text-surface-300 transition-all duration-300 hover:border-surface-400 hover:text-white"
							>
								Продолжить покупки
							</a>
						</div>

						<!-- Trust badges -->
						<div class="space-y-3 border-t border-surface-700/30 px-7 py-5">
							{#each [{ icon: 'M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z', label: 'Безопасная оплата' }, { icon: 'M5 8h14M5 8a2 2 0 110-4h14a2 2 0 110 4M5 8v10a2 2 0 002 2h10a2 2 0 002-2V8m-9 4h4', label: 'Доставка по всей России' }, { icon: 'M16 15v-1a4 4 0 00-4-4H8m0 0l3 3m-3-3l3-3m9 14V5a2 2 0 00-2-2H6a2 2 0 00-2 2v16l4-2 2 2 2-2 2 2 2-2 4 2z', label: 'Возврат в течение 14 дней' }] as badge}
								<div class="flex items-center gap-3 text-xs text-surface-400">
									<svg
										viewBox="0 0 24 24"
										class="stroke-1.5 size-4 shrink-0 fill-none stroke-accent-500/60"
										stroke-linecap="round"
										stroke-linejoin="round"
									>
										<path d={badge.icon} />
									</svg>
									<span>{badge.label}</span>
								</div>
							{/each}
						</div>
					</div>
				</div>
			</div>
		{/if}
	</div>
</section>

<!-- ===== UPSELL – recommended ===== -->
{#if cartItems.length > 0 && !orderPlaced}
	<section class="relative overflow-hidden py-20 lg:py-28">
		<div
			class="absolute inset-0 bg-gradient-to-br from-accent-600/5 via-surface-900 to-surface-900"
		></div>
		<div
			class="pointer-events-none absolute inset-0 opacity-[0.025]"
			style="background-image: linear-gradient(rgba(201,169,110,0.5) 1px, transparent 1px), linear-gradient(90deg, rgba(201,169,110,0.5) 1px, transparent 1px); background-size: 40px 40px;"
		></div>
		<div class="relative px-10 text-center lg:px-24 xl:px-32">
			<span class="text-xs font-semibold tracking-[0.3em] text-accent-500 uppercase">
				Также рекомендуем
			</span>
			<h2 class="mt-4 font-display text-3xl font-bold tracking-wide text-white lg:text-4xl">
				Нужна помощь с выбором?
			</h2>
			<p class="mx-auto mt-4 max-w-xl text-surface-300">
				Наши специалисты помогут подобрать плитку под ваш проект, рассчитают количество и организуют
				доставку образцов.
			</p>
			<div class="mt-8 flex flex-wrap items-center justify-center gap-4">
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
					href="/compare"
					class="inline-flex items-center gap-2 rounded-xl border border-surface-500 px-8 py-4 text-sm font-semibold tracking-wide text-surface-200 transition-all duration-300 hover:border-surface-300 hover:text-white"
				>
					Сравнить коллекции
				</a>
			</div>
		</div>
	</section>
{/if}
