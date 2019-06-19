import LocalForage from 'localforage';
import CordovaSQLiteDriver from 'localforage-cordovasqlitedriver';
import IStorage from '@/services/IStorage';

export default class Storage implements IStorage{

	private readonly dbPromise: Promise<LocalForage>;

	public constructor() {
		this.dbPromise = LocalForage.defineDriver(CordovaSQLiteDriver)
			.then(() => {
				let db:LocalForage = LocalForage.createInstance({
					name: '_pfinderstorage',
					storeName: '_pfinderkv'
				});
				db.setDriver([
					CordovaSQLiteDriver._driver,
					LocalForage.INDEXEDDB,
					LocalForage.WEBSQL,
					LocalForage.LOCALSTORAGE
				]);
				return db;
			});
	}

	public async ready(): Promise<void> {
		await this.dbPromise;
	}

	public async get<T>(key: string): Promise<T> {
		const db: LocalForage = await this.dbPromise;
		return db.getItem(key);
	}

	public async set<T>(key: string, value: T): Promise<T> {
		const db: LocalForage = await this.dbPromise;
		return db.setItem(key, value);
	}

	public async remove(key: string): Promise<void> {
		const db: LocalForage = await this.dbPromise;
		await db.removeItem(key);
	}

	public async clear(): Promise<void> {
		const db: LocalForage = await this.dbPromise;
		await db.clear();
	}
}