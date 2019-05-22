import LocalForage from 'localforage';
import CordovaSQLiteDriver from 'localforage-cordovasqlitedriver';
import IStorage from '@/services/IStorage';

export default class Storage implements IStorage{

	private dbPromise: Promise<LocalForage>;

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

	public ready(): Promise<void> {
		return this.dbPromise.then(() => {});
	}

	public get<T>(key: string): Promise<T> {
		return this.dbPromise.then(db => db.getItem(key));
	}

	public set<T>(key: string, value: T): Promise<T> {
		return this.dbPromise.then(db => db.setItem(key, value));
	}

	public remove(key: string): Promise<void> {
		return this.dbPromise.then(db => db.removeItem(key));
	}

	public clear(): Promise<void> {
		return this.dbPromise.then(db => db.clear());
	}
}