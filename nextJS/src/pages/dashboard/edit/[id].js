import React, { useEffect, useState } from "react";
import FormProduct from "@components/FormProduct";
import { useRouter } from "next/router";
import endPoints from "@services/api";
import axios from "axios";

export default function Edit() {
    const [product, setProduct] = useState({});
    const router = useRouter();
    const [notFound, setNotFound] = useState(false);
    const [error, setError] = useState();

    useEffect(() => {
        const { id } = router.query;

        if (!router.isReady) return;
        async function getProduct() {
            try {
                const response = await axios.get(endPoints.products.getProduct(id));

                if (response) {
                    setProduct(response.data);
                }
            } catch (error) {
                setError(error);
                setNotFound(true);
            }
        }
        getProduct();

    }, [router?.isReady]);

    return (
        notFound ? (
            <div className="text-red-700 text-center align-middle">
                Product Not Found. <br />
                {error && error.message}
            </div>
        ) : (
            <FormProduct product={product} />
        )
    );
};